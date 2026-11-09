import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/tools/tool_input.dart';
import 'package:utility_toolbox/core/tools/tool_providers.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';

/// Document Scanner: Google's ML Kit scanner UI (auto edge detection,
/// perspective fix, filters, multi-page, import from gallery) → a clean PDF
/// plus page images. Runs on-device through Google Play services, so it
/// adds almost nothing to the app's download size.
class DocScannerScreen extends ConsumerStatefulWidget {
  const DocScannerScreen({super.key});

  @override
  ConsumerState<DocScannerScreen> createState() => _DocScannerScreenState();
}

class _DocScannerScreenState extends ConsumerState<DocScannerScreen> {
  static const _accent = Color(0xFFFF8642);

  DocumentScanner? _scanner;
  bool _scanning = false;
  String? _error;
  File? _pdf;
  int _pageCount = 0;
  List<String> _pages = const [];

  @override
  void initState() {
    super.initState();
    // Opening the tool means "scan now" — skip the empty screen.
    WidgetsBinding.instance.addPostFrameCallback((_) => _scan());
  }

  @override
  void dispose() {
    _scanner?.close();
    super.dispose();
  }

  Future<void> _scan() async {
    if (!Platform.isAndroid) {
      setState(() => _error = 'The document scanner is available on Android.');
      return;
    }
    setState(() {
      _scanning = true;
      _error = null;
    });
    _scanner?.close();
    final scanner = DocumentScanner(
      options: DocumentScannerOptions(
        documentFormats: const {DocumentFormat.pdf, DocumentFormat.jpeg},
        pageLimit: 100,
        mode: ScannerMode.full,
        isGalleryImport: true,
      ),
    );
    _scanner = scanner;
    try {
      final result = await scanner.scanDocument();
      if (!mounted) return;
      final pdfPath = result.pdf?.uri;
      setState(() {
        _pdf = pdfPath == null ? null : File(_toPath(pdfPath));
        _pageCount = result.pdf?.pageCount ?? result.images?.length ?? 0;
        _pages = [for (final i in result.images ?? const <String>[]) _toPath(i)];
      });
    } on PlatformException catch (e) {
      if (!mounted) return;
      // Cancelling the scanner UI is not an error.
      final cancelled = '${e.code} ${e.message}'.toLowerCase().contains('cancel');
      if (!cancelled) {
        setState(
          () => _error =
              'The scanner couldn’t start. It needs Google Play services — '
              'make sure they are up to date. (${e.message ?? e.code})',
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = 'The scanner couldn’t start: $e');
    } finally {
      if (mounted) setState(() => _scanning = false);
    }
  }

  String _toPath(String uriOrPath) =>
      uriOrPath.startsWith('file://') ? Uri.parse(uriOrPath).toFilePath() : uriOrPath;

  String get _baseName => 'scan_${DateTime.now().millisecondsSinceEpoch}';

  Future<void> _savePdf() async {
    final pdf = _pdf;
    if (pdf == null) return;
    final messenger = ScaffoldMessenger.of(context);
    final outcome = await FileUtils.saveToDownloads(
      sourcePath: pdf.path,
      fileName: _baseName,
      ext: 'pdf',
      toolId: 'doc_scanner',
    );
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          outcome == SaveOutcome.downloaded
              ? 'PDF saved to Downloads — find it in My Files'
              : 'Opened the share sheet instead',
        ),
      ),
    );
    await ref.read(adsServiceProvider).showInterstitialIfAllowed();
  }

  Future<void> _saveImages() async {
    final messenger = ScaffoldMessenger.of(context);
    var saved = 0;
    for (final (i, page) in _pages.indexed) {
      final ok = await FileUtils.saveImageToGallery(
        bytes: await File(page).readAsBytes(),
        fileName: '${_baseName}_${i + 1}.jpg',
        toolId: 'doc_scanner',
      );
      if (ok) saved++;
    }
    messenger.showSnackBar(
      SnackBar(content: Text('Saved $saved page${saved == 1 ? '' : 's'} to your gallery')),
    );
  }

  void _extractText() {
    if (_pages.isEmpty) return;
    openTool(
      context,
      ref,
      ToolRegistry.byId('ocr')!,
      input: ToolInput(paths: [_pages.first], kind: InputKind.image),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasResult = _pdf != null || _pages.isNotEmpty;

    return ToolScaffold(
      title: 'Document Scanner',
      accentColor: _accent,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (!hasResult)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Icon(Icons.document_scanner_rounded, size: 56, color: _accent),
                    const SizedBox(height: 12),
                    Text(
                      'Scan paper into a clean PDF',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Edges are found automatically. Add as many pages as you like, '
                      'crop, rotate and apply filters before saving.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FilledButton.icon(
                      style: FilledButton.styleFrom(backgroundColor: _accent),
                      onPressed: _scanning ? null : _scan,
                      icon: const Icon(Icons.camera_alt_rounded),
                      label: Text(_scanning ? 'Scanning…' : 'Start scanning'),
                    ),
                  ],
                ),
              ),
            ),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(_error!, style: TextStyle(color: theme.colorScheme.error)),
          ],
          if (hasResult) ...[
            Card(
              child: ListTile(
                leading: const Icon(Icons.picture_as_pdf_rounded, color: _accent, size: 36),
                title: Text(
                  _pdf == null ? 'Scanned pages' : p.basename(_pdf!.path),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text('$_pageCount page${_pageCount == 1 ? '' : 's'}'),
              ),
            ),
            if (_pages.isNotEmpty) ...[
              const SizedBox(height: 12),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _pages.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (_, i) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(File(_pages[i]), height: 150, cacheHeight: 300),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
            if (_pdf != null) ...[
              FilledButton.icon(
                style: FilledButton.styleFrom(backgroundColor: _accent),
                onPressed: _savePdf,
                icon: const Icon(Icons.download_rounded),
                label: const Text('Save PDF'),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => Share.shareXFiles([XFile(_pdf!.path)]),
                icon: const Icon(Icons.share_rounded),
                label: const Text('Share PDF'),
              ),
              const SizedBox(height: 8),
            ],
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pages.isEmpty ? null : _extractText,
                    icon: const Icon(Icons.text_snippet_rounded),
                    label: const Text('Copy text'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pages.isEmpty ? null : _saveImages,
                    icon: const Icon(Icons.image_rounded),
                    label: const Text('Save as JPG'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: _scanning ? null : _scan,
              icon: const Icon(Icons.add_a_photo_rounded),
              label: const Text('Scan another document'),
            ),
          ],
        ],
      ),
    );
  }
}
