import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_subject_segmentation/google_mlkit_subject_segmentation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/bg_remover/bg_remover_logic.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// One-tap background removal with ML Kit subject segmentation (on-device,
/// model provided by Google Play services). The photo is downscaled first,
/// the soft cut-out is built in an isolate, and backgrounds are previewed
/// on the GPU, so only the final save re-encodes the image.
class BgRemoverScreen extends ConsumerStatefulWidget {
  const BgRemoverScreen({super.key, this.initialPath});

  final String? initialPath;

  @override
  ConsumerState<BgRemoverScreen> createState() => _BgRemoverScreenState();
}

enum _Phase { empty, preparing, segmenting, downloading, ready, error }

enum _Problem { openFailed, noSubject, notReady, failed }

class _BgOption {
  const _BgOption(this.fill, this.label, {this.color});

  final BgFill fill;
  final String Function(AppLocalizations l) label;
  final Color? color;
}

final _bgOptions = <_BgOption>[
  _BgOption(const TransparentFill(), (l) => l.bgRemoverBgTransparent),
  _BgOption(const ColorFill(0xFFFFFFFF), (l) => l.bgRemoverBgWhite, color: const Color(0xFFFFFFFF)),
  _BgOption(const ColorFill(0xFF000000), (l) => l.bgRemoverBgBlack, color: const Color(0xFF000000)),
  _BgOption(const ColorFill(0xFF5BA4E6), (l) => l.bgRemoverBgBlue, color: const Color(0xFF5BA4E6)),
  _BgOption(const ColorFill(0xFFD32F2F), (l) => l.bgRemoverBgRed, color: const Color(0xFFD32F2F)),
  _BgOption(const ColorFill(0xFFFFD54F), (l) => l.bgRemoverBgYellow, color: const Color(0xFFFFD54F)),
  _BgOption(const BlurFill(), (l) => l.bgRemoverBgBlur),
];

class _BgRemoverScreenState extends ConsumerState<BgRemoverScreen> {
  static const _accent = Color(0xFFD6338A);

  /// Preview textures are capped lower than the working image to save GPU
  /// memory on low-end phones.
  static const _previewLongSide = 1280;

  /// First use: Play services downloads the model in the background. Retry
  /// quietly for about a minute before asking the user.
  static const _maxAutoRetries = 12;
  static const _retryDelay = Duration(seconds: 5);

  _Phase _phase = _Phase.empty;
  _Problem? _problem;

  SubjectSegmenter? _segmenter;
  Directory? _workDir;
  String? _preparedPath;
  int _width = 0, _height = 0;
  Uint8List? _alpha;
  ui.Image? _original;
  ui.Image? _cutout;

  BgFill _fill = const TransparentFill();
  double _split = 0.5;
  bool _busyExport = false;
  final Map<BgFill, File> _exports = {};

  /// Bumped for every new photo so late results of an old one are dropped.
  int _job = 0;
  int _autoRetries = 0;
  Timer? _retryTimer;

  @override
  void initState() {
    super.initState();
    final path = widget.initialPath;
    if (path != null && path.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _load(path);
      });
    }
  }

  @override
  void dispose() {
    _job++;
    _retryTimer?.cancel();
    _segmenter?.close().ignore();
    _original?.dispose();
    _cutout?.dispose();
    final dir = _workDir;
    if (dir != null) dir.delete(recursive: true).ignore();
    super.dispose();
  }

  // ── Pipeline ────────────────────────────────────────────────────────────

  Future<void> _pick(ImageSource source) async {
    XFile? picked;
    try {
      picked = await ImagePicker().pickImage(source: source, requestFullMetadata: false);
    } on PlatformException catch (e) {
      debugPrint('Image pick failed: $e');
      return;
    }
    if (picked == null || !mounted) return;
    await _load(picked.path);
  }

  void _resetResult() {
    _retryTimer?.cancel();
    _alpha = null;
    _preparedPath = null;
    _original?.dispose();
    _original = null;
    _cutout?.dispose();
    _cutout = null;
    _exports.clear();
    _split = 0.5;
    _autoRetries = 0;
  }

  Future<void> _load(String path) async {
    final job = ++_job;
    setState(() {
      _resetResult();
      _phase = _Phase.preparing;
      _problem = null;
    });
    try {
      final old = _workDir;
      if (old != null) old.delete(recursive: true).ignore();
      final dir = _workDir = await Directory.systemTemp.createTemp('bg_remover_');
      final bytes = await _readDownscaled(path);
      final prepared = p.join(dir.path, 'source.jpg');
      final size = await compute(prepareInIsolate, PrepareJob(bytes, prepared));
      final original = await _decodePreview(await File(prepared).readAsBytes(), size.width, size.height);
      if (!mounted || job != _job) {
        original.dispose();
        return;
      }
      setState(() {
        _preparedPath = prepared;
        _width = size.width;
        _height = size.height;
        _original = original;
      });
    } catch (e) {
      debugPrint('Background remover: could not open $path: $e');
      if (mounted && job == _job) _fail(_Problem.openFailed);
      return;
    }
    await _segment(job);
  }

  /// Native, EXIF-aware decode + downscale (fast, handles HEIC); falls back
  /// to the raw file for formats the native path can't read.
  Future<Uint8List> _readDownscaled(String path) async {
    var sample = 1;
    try {
      final buffer = await ui.ImmutableBuffer.fromFilePath(path);
      final descriptor = await ui.ImageDescriptor.encoded(buffer);
      sample = sampleSizeFor(descriptor.width, descriptor.height);
      descriptor.dispose();
      buffer.dispose();
    } catch (_) {}
    try {
      final out = await FlutterImageCompress.compressWithFile(
        path,
        minWidth: 1536,
        minHeight: 1536,
        inSampleSize: sample,
        quality: 95,
        format: CompressFormat.jpeg,
      );
      if (out != null && out.isNotEmpty) return out;
    } catch (e) {
      debugPrint('Native downscale failed, decoding in Dart: $e');
    }
    return File(path).readAsBytes();
  }

  static Future<ui.Image> _decodePreview(Uint8List encoded, int width, int height) async {
    final size = fitLongSide(width, height, max: _previewLongSide);
    final codec = await ui.instantiateImageCodec(encoded, targetWidth: size.width, targetHeight: size.height);
    try {
      return (await codec.getNextFrame()).image;
    } finally {
      codec.dispose();
    }
  }

  Future<void> _segment(int job) async {
    final prepared = _preparedPath;
    if (prepared == null) return;
    setState(() => _phase = _autoRetries > 0 ? _Phase.downloading : _Phase.segmenting);
    try {
      final segmenter = _segmenter ??= SubjectSegmenter(
        options: SubjectSegmenterOptions(
          enableForegroundBitmap: false,
          enableForegroundConfidenceMask: true,
          enableMultipleSubjects: SubjectResultOptions(enableConfidenceMask: false, enableSubjectBitmap: false),
        ),
      );
      final result = await segmenter.processImage(InputImage.fromFilePath(prepared));
      if (!mounted || job != _job) return;
      final raw = result.foregroundConfidenceMask;
      if (raw == null || raw.length != _width * _height) {
        throw StateError('mask ${raw?.length} for $_width×$_height');
      }
      final mask = raw is Float32List ? raw : Float32List.fromList(raw);
      final cut = await compute(cutoutInIsolate, CutoutJob(prepared, mask, _width, _height));
      if (!mounted || job != _job) return;
      if (!cut.found) {
        _fail(_Problem.noSubject);
        return;
      }
      final preview = fitLongSide(cut.width, cut.height, max: _previewLongSide);
      final image = await _imageFromPixels(cut.previewRgba, cut.width, cut.height, preview.width, preview.height);
      if (!mounted || job != _job) {
        image.dispose();
        return;
      }
      HapticFeedback.lightImpact();
      setState(() {
        _alpha = cut.alpha;
        _cutout = image;
        _phase = _Phase.ready;
      });
    } on PlatformException catch (e) {
      debugPrint('Subject segmentation failed: ${e.code} ${e.message}');
      if (!mounted || job != _job) return;
      if (_isModelDownloading(e)) {
        if (_autoRetries < _maxAutoRetries) {
          _autoRetries++;
          setState(() => _phase = _Phase.downloading);
          _retryTimer?.cancel();
          _retryTimer = Timer(_retryDelay, () {
            if (mounted && job == _job) _segment(job);
          });
        } else {
          _fail(_Problem.notReady);
        }
      } else {
        _fail(_Problem.failed);
      }
    } catch (e) {
      debugPrint('Background removal failed: $e');
      if (mounted && job == _job) _fail(_Problem.failed);
    }
  }

  static bool _isModelDownloading(PlatformException e) {
    final text = '${e.code} ${e.message} ${e.details}'.toLowerCase();
    return text.contains('download') ||
        text.contains('waiting') ||
        text.contains('unavailable') ||
        text.contains('module');
  }

  static Future<ui.Image> _imageFromPixels(Uint8List rgba, int w, int h, int tw, int th) {
    final done = Completer<ui.Image>();
    ui.decodeImageFromPixels(rgba, w, h, ui.PixelFormat.rgba8888, done.complete, targetWidth: tw, targetHeight: th);
    return done.future;
  }

  void _fail(_Problem problem) {
    _retryTimer?.cancel();
    setState(() {
      _phase = _Phase.error;
      _problem = problem;
    });
  }

  void _retry() {
    if (_preparedPath == null) return;
    _autoRetries = 0;
    _segment(_job);
  }

  // ── Output ──────────────────────────────────────────────────────────────

  Future<File?> _export() async {
    final cached = _exports[_fill];
    if (cached != null) return cached;
    final prepared = _preparedPath, alpha = _alpha, dir = _workDir;
    if (prepared == null || alpha == null || dir == null) return null;
    final fill = _fill;
    final bytes = await compute(exportInIsolate, ExportJob(prepared, alpha, _width, _height, fill));
    final file = File(
      p.join(dir.path, 'background_removed_${DateTime.now().millisecondsSinceEpoch}.${fill.extension}'),
    );
    await file.writeAsBytes(bytes, flush: true);
    _exports[fill] = file;
    return file;
  }

  Future<void> _save() async {
    if (_busyExport) return;
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final fill = _fill;
    setState(() => _busyExport = true);
    var ok = false;
    try {
      final file = await _export();
      if (file != null) {
        ok = await FileUtils.saveImageToGallery(
          bytes: await file.readAsBytes(),
          fileName: p.basename(file.path),
          mimeType: fill.mimeType,
          toolId: 'bg_remover',
        );
      }
    } catch (e) {
      debugPrint('Saving cut-out failed: $e');
    }
    if (!mounted) return;
    setState(() => _busyExport = false);
    messenger.showSnackBar(SnackBar(content: Text(ok ? l.bgRemoverSaved : l.bgRemoverSaveFailed)));
    if (ok) await ref.read(adsServiceProvider).showInterstitialIfAllowed();
  }

  Future<void> _share() async {
    if (_busyExport) return;
    final fill = _fill;
    setState(() => _busyExport = true);
    File? file;
    try {
      file = await _export();
    } catch (e) {
      debugPrint('Exporting cut-out failed: $e');
    }
    if (!mounted) return;
    setState(() => _busyExport = false);
    if (file == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).bgRemoverSaveFailed)));
      return;
    }
    await Share.shareXFiles([XFile(file.path, mimeType: fill.mimeType)]);
  }

  // ── UI ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return ToolScaffold(
      title: l.toolBgRemoverTitle,
      accentColor: _accent,
      body: switch (_phase) {
        _Phase.empty => _buildPicker(l),
        _Phase.ready => _buildResult(l),
        _Phase.error => _buildError(l),
        _ => _buildWorking(l),
      },
    );
  }

  Widget _buildPicker(AppLocalizations l) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
      children: [
        Container(
          padding: const EdgeInsetsDirectional.all(24),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: _accent.withValues(alpha: 0.3)),
          ),
          child: Column(
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(color: _accent.withValues(alpha: 0.12), shape: BoxShape.circle),
                child: const Icon(Icons.auto_fix_high_rounded, size: 48, color: _accent),
              ),
              const SizedBox(height: 16),
              Text(
                l.bgRemoverPickTitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                l.bgRemoverPickBody,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56)),
                onPressed: () => _pick(ImageSource.gallery),
                icon: const Icon(Icons.photo_library_rounded),
                label: Text(l.bgRemoverGallery),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(56)),
                onPressed: () => _pick(ImageSource.camera),
                icon: const Icon(Icons.photo_camera_rounded),
                label: Text(l.bgRemoverCamera),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWorking(AppLocalizations l) {
    final theme = Theme.of(context);
    final text = switch (_phase) {
      _Phase.preparing => l.bgRemoverPreparing,
      _Phase.downloading => l.bgRemoverDownloading,
      _ => l.bgRemoverWorking,
    };
    final original = _original;
    return Padding(
      padding: const EdgeInsetsDirectional.all(20),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: original == null
                  ? null
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Opacity(
                        opacity: 0.55,
                        child: RawImage(image: original, fit: BoxFit.contain),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 20),
          Semantics(
            liveRegion: true,
            child: Column(
              children: [
                const SizedBox.square(dimension: 40, child: CircularProgressIndicator(color: _accent)),
                const SizedBox(height: 16),
                Text(text, textAlign: TextAlign.center, style: theme.textTheme.titleMedium),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildError(AppLocalizations l) {
    final theme = Theme.of(context);
    final problem = _problem ?? _Problem.failed;
    final (icon, text) = switch (problem) {
      _Problem.openFailed => (Icons.broken_image_outlined, l.bgRemoverOpenFailed),
      _Problem.noSubject => (Icons.person_search_rounded, l.bgRemoverNoSubject),
      _Problem.notReady => (Icons.cloud_download_outlined, l.bgRemoverDownloadFailed),
      _Problem.failed => (Icons.error_outline_rounded, l.bgRemoverFailed),
    };
    final canRetry = (problem == _Problem.notReady || problem == _Problem.failed) && _preparedPath != null;
    return ListView(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 40, 24, 24),
      children: [
        Icon(icon, size: 72, color: theme.colorScheme.onSurfaceVariant),
        const SizedBox(height: 16),
        Semantics(
          liveRegion: true,
          child: Text(text, textAlign: TextAlign.center, style: theme.textTheme.titleMedium),
        ),
        const SizedBox(height: 28),
        if (canRetry) ...[
          FilledButton.icon(
            style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56)),
            onPressed: _retry,
            icon: const Icon(Icons.refresh_rounded),
            label: Text(l.bgRemoverRetry),
          ),
          const SizedBox(height: 12),
        ],
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(56)),
          onPressed: () => _pick(ImageSource.gallery),
          icon: const Icon(Icons.photo_library_rounded),
          label: Text(l.bgRemoverAnotherPhoto),
        ),
      ],
    );
  }

  Widget _buildResult(AppLocalizations l) {
    final theme = Theme.of(context);
    final original = _original!, cutout = _cutout!;
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 4),
            child: Center(
              child: _ComparePreview(
                original: original,
                cutout: cutout,
                fill: _fill,
                split: _split,
                onSplit: (v) => setState(() => _split = v),
                l: l,
              ),
            ),
          ),
        ),
        Text(
          l.bgRemoverCompareHint,
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 84,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            itemCount: _bgOptions.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (context, i) {
              final o = _bgOptions[i];
              return _BgChip(
                option: o,
                label: o.label(l),
                selected: o.fill == _fill,
                original: original,
                onTap: () {
                  HapticFeedback.selectionClick();
                  setState(() => _fill = o.fill);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
                      onPressed: _busyExport ? null : _save,
                      icon: _busyExport
                          ? const SizedBox.square(
                              dimension: 18,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : const Icon(Icons.save_alt_rounded),
                      label: Text(l.bgRemoverSave, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(52)),
                      onPressed: _busyExport ? null : _share,
                      icon: const Icon(Icons.share_rounded),
                      label: Text(l.fileShare, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _fill.isTransparent ? l.bgRemoverPngHint : l.bgRemoverJpgHint,
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: _busyExport ? null : () => _pick(ImageSource.gallery),
                    icon: const Icon(Icons.add_photo_alternate_outlined),
                    label: Text(l.bgRemoverNewPhoto),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Before/after view with a draggable divider: the left part shows the
/// original photo, the right part the cut-out on the chosen background.
class _ComparePreview extends StatelessWidget {
  const _ComparePreview({
    required this.original,
    required this.cutout,
    required this.fill,
    required this.split,
    required this.onSplit,
    required this.l,
  });

  final ui.Image original, cutout;
  final BgFill fill;
  final double split;
  final ValueChanged<double> onSplit;
  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: original.width / original.height,
      child: LayoutBuilder(
        builder: (context, c) {
          final w = c.maxWidth;
          final x = w * split;
          void update(Offset local) => onSplit((local.dx / w).clamp(0.0, 1.0));
          return Semantics(
            slider: true,
            label: l.bgRemoverCompare,
            value: '${(split * 100).round()}%',
            increasedValue: '${((split + 0.1).clamp(0.0, 1.0) * 100).round()}%',
            decreasedValue: '${((split - 0.1).clamp(0.0, 1.0) * 100).round()}%',
            onIncrease: () => onSplit((split + 0.1).clamp(0.0, 1.0)),
            onDecrease: () => onSplit((split - 0.1).clamp(0.0, 1.0)),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: (d) => update(d.localPosition),
              onHorizontalDragUpdate: (d) => update(d.localPosition),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    RepaintBoundary(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          _Background(fill: fill, original: original, longSide: w > c.maxHeight ? w : c.maxHeight),
                          RawImage(image: cutout, fit: BoxFit.fill, filterQuality: FilterQuality.medium),
                        ],
                      ),
                    ),
                    ClipRect(
                      clipper: _LeftClipper(x),
                      child: RawImage(image: original, fit: BoxFit.fill, filterQuality: FilterQuality.medium),
                    ),
                    Positioned(
                      left: x - 1.5,
                      top: 0,
                      bottom: 0,
                      width: 3,
                      child: const ColoredBox(color: Colors.white),
                    ),
                    Positioned(
                      left: x - 22,
                      top: c.maxHeight / 2 - 22,
                      width: 44,
                      height: 44,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 8)],
                        ),
                        child: const Icon(Icons.compare_arrows_rounded, color: Colors.black87),
                      ),
                    ),
                    Positioned(left: 8, top: 8, child: _Tag(l.bgRemoverBefore)),
                    Positioned(right: 8, top: 8, child: _Tag(l.bgRemoverAfter)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LeftClipper extends CustomClipper<Rect> {
  _LeftClipper(this.x);

  final double x;

  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, x.clamp(0, size.width), size.height);

  @override
  bool shouldReclip(_LeftClipper old) => old.x != x;
}

class _Tag extends StatelessWidget {
  const _Tag(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(12)),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
    ),
  );
}

class _Background extends StatelessWidget {
  const _Background({required this.fill, required this.original, required this.longSide});

  final BgFill fill;
  final ui.Image original;
  final double longSide;

  @override
  Widget build(BuildContext context) {
    final f = fill;
    return switch (f) {
      TransparentFill() => const CustomPaint(painter: _CheckerPainter()),
      ColorFill() => ColoredBox(color: Color(f.argb)),
      BlurFill() => ClipRect(
        child: ImageFiltered(
          // Same strength, relative to the image, as the saved file.
          imageFilter: ui.ImageFilter.blur(
            sigmaX: blurSigmaFraction * longSide,
            sigmaY: blurSigmaFraction * longSide,
            tileMode: TileMode.clamp,
          ),
          child: RawImage(image: original, fit: BoxFit.fill),
        ),
      ),
    };
  }
}

class _CheckerPainter extends CustomPainter {
  const _CheckerPainter();

  @override
  void paint(Canvas canvas, Size size) {
    const cell = 12.0;
    canvas.drawRect(Offset.zero & size, Paint()..color = const Color(0xFFFFFFFF));
    final dark = Paint()..color = const Color(0xFFDADADA);
    for (var y = 0.0, row = 0; y < size.height; y += cell, row++) {
      for (var x = (row.isEven ? 0.0 : cell); x < size.width; x += cell * 2) {
        canvas.drawRect(Rect.fromLTWH(x, y, cell, cell), dark);
      }
    }
  }

  @override
  bool shouldRepaint(_CheckerPainter old) => false;
}

class _BgChip extends StatelessWidget {
  const _BgChip({
    required this.option,
    required this.label,
    required this.selected,
    required this.original,
    required this.onTap,
  });

  final _BgOption option;
  final String label;
  final bool selected;
  final ui.Image original;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final Widget swatch = switch (option.fill) {
      TransparentFill() => const CustomPaint(painter: _CheckerPainter()),
      BlurFill() => ImageFiltered(
        imageFilter: ui.ImageFilter.blur(sigmaX: 3, sigmaY: 3, tileMode: TileMode.clamp),
        child: RawImage(image: original, fit: BoxFit.cover),
      ),
      _ => ColoredBox(color: option.color ?? Colors.white),
    };
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          width: 64,
          child: Column(
            children: [
              Container(
                width: 52,
                height: 52,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected ? _BgRemoverScreenState._accent : scheme.outlineVariant,
                    width: selected ? 3.5 : 1.5,
                  ),
                ),
                child: ClipOval(child: swatch),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  color: selected ? _BgRemoverScreenState._accent : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
