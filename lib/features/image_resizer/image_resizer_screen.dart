import 'dart:io';
import 'dart:isolate';

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

enum _Mode { percent, fit, exact }

class _Preset {
  const _Preset(this.label, this.spec);
  final String label;
  final ResizeSpec spec;
}

const _presets = [
  _Preset('Passport 35×45 mm', ExactResize(413, 531)),
  _Preset('Square 1080', ExactResize(1080, 1080)),
  _Preset('Story 1080×1920', ExactResize(1080, 1920)),
  _Preset('HD (max 1280)', FitResize(1280)),
  _Preset('Full HD (max 1920)', FitResize(1920)),
];

class _Result {
  const _Result(this.source, this.file, this.output, this.srcBytes);
  final String source;
  final File file;
  final ResizeOutput output;
  final int srcBytes;
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
  String? _error;
  final List<_Result> _results = [];
  final _w = TextEditingController(text: '1080');
  final _h = TextEditingController(text: '1080');

  @override
  void dispose() {
    _w.dispose();
    _h.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    final picked = await ImagePicker().pickMultiImage(imageQuality: 100);
    if (picked.isEmpty || !mounted) return;
    setState(() {
      _inputs = [for (final x in picked) x.path];
      _results.clear();
      _error = null;
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
      setState(() => _error = 'Enter a width and height between 1 and 12000.');
      return;
    }
    setState(() {
      _working = true;
      _error = null;
      _results.clear();
    });
    final outDir = await Directory.systemTemp.createTemp('resized_');
    var failed = 0;
    for (final path in _inputs) {
      try {
        final bytes = await File(path).readAsBytes();
        final job = ResizeJob(bytes: bytes, spec: spec, format: _format, quality: _quality);
        final out = await Isolate.run(() => resizeInIsolate(job));
        var data = out.bytes;
        if (_format == OutputFormat.webp) {
          data = await FlutterImageCompress.compressWithList(
            data,
            format: CompressFormat.webp,
            quality: _quality,
            minWidth: 1,
            minHeight: 1,
          );
        }
        final name = '${p.basenameWithoutExtension(path)}_${out.width}x${out.height}.${_format.ext}';
        final file = await File(p.join(outDir.path, name)).writeAsBytes(data);
        if (!mounted) return;
        setState(() => _results.add(_Result(path, file, out, bytes.length)));
      } catch (_) {
        failed++;
      }
    }
    if (!mounted) return;
    setState(() {
      _working = false;
      if (failed > 0) _error = '$failed photo${failed == 1 ? '' : 's'} couldn’t be read.';
    });
  }

  Future<void> _saveAll() async {
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _saving = true);
    var saved = 0;
    for (final r in _results) {
      final ok = await FileUtils.saveImageToGallery(
        bytes: await r.file.readAsBytes(),
        fileName: p.basename(r.file.path),
        mimeType: _format.mime,
        toolId: 'image_resizer',
      );
      if (ok) saved++;
    }
    if (!mounted) return;
    setState(() => _saving = false);
    messenger.showSnackBar(SnackBar(content: Text('Saved $saved to your gallery')));
    await ref.read(adsServiceProvider).showInterstitialIfAllowed();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ToolScaffold(
      title: 'Resize & Convert',
      accentColor: _accent,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.photo_library_rounded, color: _accent, size: 32),
              title: Text(
                _inputs.isEmpty
                    ? 'Choose photos'
                    : '${_inputs.length} photo${_inputs.length == 1 ? '' : 's'} selected',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: _inputs.isEmpty
                  ? const Text('Pick one or many — or share them to the app')
                  : Text(_inputs.map(p.basename).take(3).join(', ')),
              trailing: TextButton(
                onPressed: _working ? null : _pick,
                child: Text(_inputs.isEmpty ? 'Choose' : 'Change'),
              ),
              onTap: _working ? null : _pick,
            ),
          ),
          if (_inputs.isNotEmpty && _results.isEmpty) ...[
            const SizedBox(height: 16),
            Text('Presets', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final preset in _presets)
                  ChoiceChip(
                    label: Text(preset.label),
                    selected: _preset == preset,
                    onSelected: (sel) => setState(() => _preset = sel ? preset : null),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (_preset == null) ...[
              SegmentedButton<_Mode>(
                segments: const [
                  ButtonSegment(value: _Mode.percent, label: Text('Percent')),
                  ButtonSegment(value: _Mode.fit, label: Text('Max side')),
                  ButtonSegment(value: _Mode.exact, label: Text('Exact')),
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
                        Expanded(child: _numField(_w, 'Width (px)')),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('×'),
                        ),
                        Expanded(child: _numField(_h, 'Height (px)')),
                      ],
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Crop to fit (no stretching)'),
                      value: _crop,
                      onChanged: (v) => setState(() => _crop = v),
                    ),
                  ],
                ),
              },
            ],
            const SizedBox(height: 8),
            Text('Format', style: theme.textTheme.titleSmall),
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
                  const Text('Quality'),
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
              label: Text(_working ? 'Working…' : 'Resize'),
            ),
          ],
          if (_results.isNotEmpty) ...[
            const SizedBox(height: 16),
            for (final r in _results)
              Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.file(r.file, width: 48, height: 48, fit: BoxFit.cover, cacheWidth: 96),
                  ),
                  title: Text(p.basename(r.file.path), maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text(
                    '${r.output.srcWidth}×${r.output.srcHeight} → ${r.output.width}×${r.output.height}  ·  '
                    '${FileUtils.formatFileSize(r.srcBytes)} → ${FileUtils.formatFileSize(r.file.lengthSync())}',
                  ),
                ),
              ),
            if (!_working) ...[
              const SizedBox(height: 8),
              FilledButton.icon(
                style: FilledButton.styleFrom(backgroundColor: _accent),
                onPressed: _saving ? null : _saveAll,
                icon: const Icon(Icons.save_alt_rounded),
                label: Text('Save ${_results.length} to gallery'),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => Share.shareXFiles([for (final r in _results) XFile(r.file.path)]),
                icon: const Icon(Icons.share_rounded),
                label: const Text('Share'),
              ),
              TextButton(
                onPressed: () => setState(_results.clear),
                child: const Text('Change settings'),
              ),
            ],
          ],
          if (_error != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(_error!, style: TextStyle(color: theme.colorScheme.error)),
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
