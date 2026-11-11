import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/image_resizer/image_resize_logic.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

enum _Mode { percent, fit, exact }

class _Preset {
  const _Preset(this.label, this.spec);
  final String Function(AppLocalizations l) label;
  final ResizeSpec spec;
}

final _presets = [
  _Preset((l) => l.imgResizePresetPassport, const ExactResize(413, 531)),
  _Preset((l) => l.imgResizePresetSquare('1080'), const ExactResize(1080, 1080)),
  _Preset((l) => l.imgResizePresetStory('1080×1920'), const ExactResize(1080, 1920)),
  _Preset((l) => l.imgResizePresetMax('HD', '1280'), const FitResize(1280)),
  _Preset((l) => l.imgResizePresetMax('Full HD', '1920'), const FitResize(1920)),
];

class _Result {
  const _Result(this.source, this.file, this.output, this.srcBytes, this.outBytes);
  final String source;
  final File file;
  final ResizeOutput output;
  final int srcBytes;
  final int outBytes;
}

/// Resize to exact pixels / a percentage / a max side, or a preset
/// (passport, square, story, HD), and convert between JPG, PNG and WEBP.
/// Works on many photos at once.
class ImageResizerScreen extends ConsumerStatefulWidget {
  const ImageResizerScreen({super.key, this.initialPaths = const []});

  final List<String> initialPaths;

  @override
  ConsumerState<ImageResizerScreen> createState() => _ImageResizerScreenState();
}

class _ImageResizerScreenState extends ConsumerState<ImageResizerScreen> {
  static const _accent = Color(0xFF3D9BFF);

  late List<String> _inputs = List.of(widget.initialPaths);
  _Mode _mode = _Mode.percent;
  int _percent = 50;
  int _maxSide = 1280;
  _Preset? _preset;
  bool _crop = true;
  OutputFormat _format = OutputFormat.jpg;
  int _quality = 85;
  bool _working = false;
  bool _saving = false;

  /// Shown under the form: width/height out of range, or how many photos
  /// failed. Kept as data so the text follows the app language.
  bool _invalidSize = false;
  int _failedCount = 0;
  final List<_Result> _results = [];
  final _w = TextEditingController(text: '1080');
  final _h = TextEditingController(text: '1080');
  Directory? _outDir;

  @override
  void dispose() {
    _w.dispose();
    _h.dispose();
    _deleteOutDir();
    super.dispose();
  }

  /// Outputs live in a per-run temp folder; drop the previous one so repeated
  /// runs don't pile up full-size copies in the cache.
  void _deleteOutDir() {
    final dir = _outDir;
    _outDir = null;
    if (dir != null) dir.delete(recursive: true).ignore();
  }

  Future<void> _pick() async {
    List<XFile> picked;
    try {
      picked = await ImagePicker().pickMultiImage(imageQuality: 100);
    } on PlatformException catch (e) {
      debugPrint('Image pick failed: $e');
      return;
    }
    if (picked.isEmpty || !mounted) return;
    setState(() {
      _inputs = [for (final x in picked) x.path];
      _results.clear();
      _invalidSize = false;
      _failedCount = 0;
    });
  }

  ResizeSpec? _spec() {
    if (_preset != null) return _preset!.spec;
    switch (_mode) {
      case _Mode.percent:
        return PercentResize(_percent);
      case _Mode.fit:
        return FitResize(_maxSide);
      case _Mode.exact:
        final w = int.tryParse(_w.text);
        final h = int.tryParse(_h.text);
        if (w == null || h == null || w < 1 || h < 1 || w > 12000 || h > 12000) {
          return null;
        }
        return ExactResize(w, h, crop: _crop);
    }
  }

  Future<void> _run() async {
    final spec = _spec();
    if (spec == null) {
      setState(() {
        _invalidSize = true;
        _failedCount = 0;
      });
      return;
    }
    if (_working) return;
    setState(() {
      _working = true;
      _invalidSize = false;
      _failedCount = 0;
      _results.clear();
    });
    _deleteOutDir();
    final format = _format;
    final quality = _quality;
    var failed = 0;
    try {
      final outDir = _outDir = await Directory.systemTemp.createTemp('resized_');
      for (final path in List.of(_inputs)) {
        try {
          final bytes = await File(path).readAsBytes();
          final job = ResizeJob(bytes: bytes, spec: spec, format: format, quality: quality);
          // compute() with a top-level function: a closure here would also
          // try to send this State (captured by setState below) to the isolate.
          ResizeOutput out;
          try {
            out = await compute(resizeInIsolate, job);
          } catch (_) {
            // package:image can't read HEIC/HEIF (default camera format on
            // many phones). Let Android decode it to JPEG, then retry.
            final converted = await FlutterImageCompress.compressWithFile(
              path,
              format: CompressFormat.jpeg,
              quality: 95,
              minWidth: 1 << 14,
              minHeight: 1 << 14,
            );
            if (converted == null) rethrow;
            out = await compute(
              resizeInIsolate,
              ResizeJob(bytes: converted, spec: spec, format: format, quality: quality),
            );
          }
          var data = out.bytes;
          if (format == OutputFormat.webp) {
            // minWidth/minHeight are a scale floor: passing 1 shrank every
            // WEBP to a few pixels. The exact output size means "don't scale".
            data = await FlutterImageCompress.compressWithList(
              data,
              format: CompressFormat.webp,
              quality: quality,
              minWidth: out.width,
              minHeight: out.height,
              autoCorrectionAngle: false,
            );
          }
          final name = '${p.basenameWithoutExtension(path)}_${out.width}x${out.height}.${format.ext}';
          final file = await File(p.join(outDir.path, name)).writeAsBytes(data);
          if (!mounted) return;
          setState(() => _results.add(_Result(path, file, out, bytes.length, data.length)));
        } catch (e) {
          debugPrint('Resize failed for $path: $e');
          failed++;
        }
      }
    } catch (e) {
      debugPrint('Resize run failed: $e');
      failed = _inputs.length - _results.length;
    }
    if (!mounted) return;
    setState(() {
      _working = false;
      _failedCount = failed;
    });
  }

  Future<void> _saveAll() async {
    if (_saving) return;
    final messenger = ScaffoldMessenger.of(context);
    final l = AppLocalizations.of(context);
    setState(() => _saving = true);
    var saved = 0;
    final mime = _format.mime;
    for (final r in List.of(_results)) {
      try {
        final ok = await FileUtils.saveImageToGallery(
          bytes: await r.file.readAsBytes(),
          fileName: p.basename(r.file.path),
          mimeType: mime,
          toolId: 'image_resizer',
        );
        if (ok) saved++;
      } catch (e) {
        debugPrint('Saving ${r.file.path} failed: $e');
      }
    }
    if (!mounted) return;
    setState(() => _saving = false);
    messenger.showSnackBar(SnackBar(
      content: Text(saved > 0 ? l.imgResizeSavedCount(saved) : l.commonSaveFailed),
    ));
    await ref.read(adsServiceProvider).showInterstitialIfAllowed();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    // RTL: "1920×1080 ← 960×540" reads right to left.
    final arrow = Directionality.of(context) == TextDirection.rtl ? '←' : '→';
    return ToolScaffold(
      title: l.toolImageResizerTitle,
      accentColor: _accent,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.photo_library_rounded, color: _accent, size: 32),
              title: Text(
                _inputs.isEmpty
                    ? l.imgResizeChoosePhotos
                    : l.imgResizeSelected(_inputs.length),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: _inputs.isEmpty
                  ? Text(l.imgResizePickHint)
                  : Text(
                      _inputs.map(p.basename).take(3).join(', '),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
              trailing: TextButton(
                onPressed: _working ? null : _pick,
                child: Text(_inputs.isEmpty ? l.imgResizeChoose : l.imgResizeChange),
              ),
              onTap: _working ? null : _pick,
            ),
          ),
          if (_inputs.isNotEmpty && _results.isEmpty) ...[
            const SizedBox(height: 16),
            Text(l.imgResizePresets, style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final preset in _presets)
                  ChoiceChip(
                    label: Text(preset.label(l)),
                    selected: _preset == preset,
                    onSelected: (sel) => setState(() => _preset = sel ? preset : null),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (_preset == null) ...[
              SegmentedButton<_Mode>(
                segments: [
                  ButtonSegment(value: _Mode.percent, label: Text(l.imgResizeModePercent)),
                  ButtonSegment(value: _Mode.fit, label: Text(l.imgResizeModeMaxSide)),
                  ButtonSegment(value: _Mode.exact, label: Text(l.imgResizeModeExact)),
                ],
                selected: {_mode},
                onSelectionChanged: (s) => setState(() => _mode = s.first),
              ),
              const SizedBox(height: 12),
              switch (_mode) {
                _Mode.percent => Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _percent.toDouble(),
                        min: 5,
                        max: 100,
                        divisions: 19,
                        label: '$_percent%',
                        onChanged: (v) => setState(() => _percent = v.round()),
                      ),
                    ),
                    SizedBox(width: 48, child: Text('$_percent%')),
                  ],
                ),
                _Mode.fit => Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _maxSide.toDouble(),
                        min: 320,
                        max: 4096,
                        divisions: 37,
                        label: '$_maxSide px',
                        onChanged: (v) => setState(() => _maxSide = (v / 32).round() * 32),
                      ),
                    ),
                    SizedBox(width: 72, child: Text('$_maxSide px')),
                  ],
                ),
                _Mode.exact => Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: _numField(_w, l.imgResizeWidth)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('×'),
                        ),
                        Expanded(child: _numField(_h, l.imgResizeHeight)),
                      ],
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(l.imgResizeCrop),
                      value: _crop,
                      onChanged: (v) => setState(() => _crop = v),
                    ),
                  ],
                ),
              },
            ],
            const SizedBox(height: 8),
            Text(l.imgResizeFormat, style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            SegmentedButton<OutputFormat>(
              segments: [
                for (final f in OutputFormat.values) ButtonSegment(value: f, label: Text(f.label)),
              ],
              selected: {_format},
              onSelectionChanged: (s) => setState(() => _format = s.first),
            ),
            if (_format != OutputFormat.png) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(l.imgResizeQuality),
                  Expanded(
                    child: Slider(
                      value: _quality.toDouble(),
                      min: 40,
                      max: 100,
                      divisions: 12,
                      label: '$_quality',
                      onChanged: (v) => setState(() => _quality = v.round()),
                    ),
                  ),
                  SizedBox(width: 32, child: Text('$_quality')),
                ],
              ),
            ],
            const SizedBox(height: 16),
            FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: _accent),
              onPressed: _working ? null : _run,
              icon: _working
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.aspect_ratio_rounded),
              label: Text(_working ? l.commonWorking : l.imgResizeButton),
            ),
          ],
          if (_results.isNotEmpty) ...[
            const SizedBox(height: 16),
            for (final r in _results)
              Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.file(
                      r.file,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      cacheWidth: 96,
                      errorBuilder: (_, _, _) => const SizedBox.square(
                        dimension: 48,
                        child: Icon(Icons.broken_image_outlined),
                      ),
                    ),
                  ),
                  title: Text(p.basename(r.file.path), maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text(
                    '${r.output.srcWidth}×${r.output.srcHeight} $arrow ${r.output.width}×${r.output.height}  ·  '
                    '${FileUtils.formatFileSize(r.srcBytes)} $arrow ${FileUtils.formatFileSize(r.outBytes)}',
                  ),
                ),
              ),
            if (!_working) ...[
              const SizedBox(height: 8),
              FilledButton.icon(
                style: FilledButton.styleFrom(backgroundColor: _accent),
                onPressed: _saving ? null : _saveAll,
                icon: const Icon(Icons.save_alt_rounded),
                label: Text(l.imgResizeSaveAll(_results.length)),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => Share.shareXFiles([for (final r in _results) XFile(r.file.path)]),
                icon: const Icon(Icons.share_rounded),
                label: Text(l.commonShare),
              ),
              TextButton(
                onPressed: () => setState(_results.clear),
                child: Text(l.imgResizeChangeSettings),
              ),
            ],
          ],
          if (_invalidSize || _failedCount > 0)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                _invalidSize
                    ? l.imgResizeInvalidSize(1, 12000)
                    : l.imgResizeFailedCount(_failedCount),
                style: TextStyle(color: theme.colorScheme.error),
              ),
            ),
        ],
      ),
    );
  }

  Widget _numField(TextEditingController c, String label) => TextField(
    controller: c,
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
  );
}
