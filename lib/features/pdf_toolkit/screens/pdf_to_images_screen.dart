import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/pdf_toolkit/services/pdf_extra_service.dart';
import 'package:utility_toolbox/features/pdf_toolkit/widgets/pdf_tool_widgets.dart';

/// Renders PDF pages to JPG images, then saves them to the gallery or
/// shares them.
class PdfToImagesScreen extends ConsumerStatefulWidget {
  const PdfToImagesScreen({super.key, this.initialPath});

  final String? initialPath;

  @override
  ConsumerState<PdfToImagesScreen> createState() => _PdfToImagesScreenState();
}

class _PdfToImagesScreenState extends ConsumerState<PdfToImagesScreen> {
  static const _accent = Color(0xFFFFA726);

  String? _path;
  PdfInfo? _info;
  bool _inspecting = false;
  bool _working = false;
  bool _saving = false;
  bool _allPages = true;
  String? _error;
  final _ranges = TextEditingController();
  final List<File> _images = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialPath != null) _load(widget.initialPath!);
  }

  @override
  void dispose() {
    _ranges.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    final path = await pickPdfPath();
    if (path != null) await _load(path);
  }

  Future<void> _load(String path) async {
    setState(() {
      _path = path;
      _info = null;
      _images.clear();
      _error = null;
      _inspecting = true;
    });
    try {
      final info = await ref.read(pdfExtraServiceProvider).inspect(path);
      if (!mounted) return;
      setState(() => _info = info);
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = 'This file doesn’t look like a valid PDF.');
    } finally {
      if (mounted) setState(() => _inspecting = false);
    }
  }

  Future<void> _convert() async {
    final path = _path;
    final info = _info;
    if (path == null || info == null) return;
    List<int>? pages;
    if (!_allPages) {
      try {
        pages = parsePageRanges(_ranges.text, info.pageCount);
      } on FormatException catch (e) {
        setState(() => _error = e.message);
        return;
      }
    }
    setState(() {
      _working = true;
      _error = null;
      _images.clear();
    });
    try {
      await for (final file in ref.read(pdfExtraServiceProvider).renderPages(path, pages: pages)) {
        if (!mounted) return;
        setState(() => _images.add(file));
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = 'Couldn’t render this PDF.');
    } finally {
      if (mounted) setState(() => _working = false);
    }
  }

  Future<void> _saveAll() async {
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _saving = true);
    var saved = 0;
    for (final img in _images) {
      final ok = await FileUtils.saveImageToGallery(
        bytes: await img.readAsBytes(),
        fileName: img.uri.pathSegments.last,
        toolId: 'pdf_to_images',
      );
      if (ok) saved++;
    }
    if (!mounted) return;
    setState(() => _saving = false);
    messenger.showSnackBar(
      SnackBar(content: Text('Saved $saved of ${_images.length} images to your gallery')),
    );
    await ref.read(adsServiceProvider).showInterstitialIfAllowed();
  }

  @override
  Widget build(BuildContext context) {
    final info = _info;
    final total = _allPages ? (info?.pageCount ?? 0) : null;
    return ToolScaffold(
      title: 'PDF to JPG',
      accentColor: _accent,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PdfSourceCard(
            path: _path,
            info: info,
            loading: _inspecting,
            onPick: _working ? () {} : _pick,
            accent: _accent,
          ),
          if (info != null && info.isEncrypted)
            const InlineError(
              message: 'This PDF is password protected. Unlock it first with Unlock PDF.',
            ),
          if (info != null && !info.isEncrypted && _images.isEmpty && !_working) ...[
            const SizedBox(height: 12),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('All pages'),
              value: _allPages,
              onChanged: (v) => setState(() => _allPages = v),
            ),
            if (!_allPages)
              TextField(
                controller: _ranges,
                decoration: InputDecoration(
                  labelText: 'Pages (1–${info.pageCount})',
                  hintText: 'e.g. 1-3, 5',
                  border: const OutlineInputBorder(),
                ),
              ),
            const SizedBox(height: 16),
            FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: _accent),
              onPressed: _convert,
              icon: const Icon(Icons.image_rounded),
              label: const Text('Convert to JPG'),
            ),
          ],
          if (_working) ...[
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: total == null || total == 0 ? null : _images.length / total,
              color: _accent,
            ),
            const SizedBox(height: 8),
            Text('Rendered ${_images.length}${total == null ? '' : ' of $total'} pages…'),
          ],
          if (_images.isNotEmpty) ...[
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 120,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.72,
              ),
              itemCount: _images.length,
              itemBuilder: (_, i) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(_images[i], fit: BoxFit.cover, cacheWidth: 240),
              ),
            ),
            if (!_working) ...[
              const SizedBox(height: 16),
              FilledButton.icon(
                style: FilledButton.styleFrom(backgroundColor: _accent),
                onPressed: _saving ? null : _saveAll,
                icon: const Icon(Icons.save_alt_rounded),
                label: Text('Save ${_images.length} to gallery'),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => Share.shareXFiles([for (final f in _images) XFile(f.path)]),
                icon: const Icon(Icons.share_rounded),
                label: const Text('Share'),
              ),
            ],
          ],
          if (_error != null) InlineError(message: _error!),
        ],
      ),
    );
  }
}
