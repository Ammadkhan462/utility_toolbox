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
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

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
  bool _saving = false;
  /// Built at render time so it follows the app language.
  String Function(AppLocalizations l)? _error;
  File? _pdf;
  int _pageCount = 0;
  List<String> _pages = const [];

  /// One name per scan, so the PDF and its JPG pages match and the names
  /// don't shift between saves.
  String _baseName = '';

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
      setState(() => _error = (l) => l.docScanAndroidOnly);
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
        _baseName = 'scan_${DateTime.now().millisecondsSinceEpoch}';
        _pdf = pdfPath == null ? null : File(_toPath(pdfPath));
        _pageCount = result.pdf?.pageCount ?? result.images?.length ?? 0;
        _pages = [for (final i in result.images ?? const <String>[]) _toPath(i)];
      });
    } on PlatformException catch (e) {
      if (!mounted) return;
      // Cancelling the scanner UI is not an error.
      final cancelled = '${e.code} ${e.message}'.toLowerCase().contains('cancel');
      if (!cancelled) {
        final details = e.message ?? e.code;
        setState(() => _error = (l) => l.docScanNeedsPlayServices(details));
      }
    } catch (e) {
      if (!mounted) return;
      debugPrint('Document scanner failed: $e');
      setState(() => _error = (l) => l.docScanStartFailed);
    } finally {
      if (mounted) setState(() => _scanning = false);
    }
  }

  String _toPath(String uriOrPath) =>
      uriOrPath.startsWith('file://') ? Uri.parse(uriOrPath).toFilePath() : uriOrPath;

  Future<void> _savePdf() async {
    final pdf = _pdf;
    if (pdf == null || _saving) return;
    final messenger = ScaffoldMessenger.of(context);
    final l = AppLocalizations.of(context);
    // Read before the await: ref can't be used once the screen is gone.
    final ads = ref.read(adsServiceProvider);
    setState(() => _saving = true);
    final SaveOutcome outcome;
    try {
      outcome = await FileUtils.saveToDownloads(
        sourcePath: pdf.path,
        fileName: _baseName,
        ext: 'pdf',
        toolId: 'doc_scanner',
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          outcome == SaveOutcome.downloaded
              ? l.docScanPdfSaved
              : l.pdfToolsSharedInstead,
        ),
      ),
    );
    await ads.showInterstitialIfAllowed();
  }

  Future<void> _saveImages() async {
    if (_saving) return;
    final messenger = ScaffoldMessenger.of(context);
    final l = AppLocalizations.of(context);
    // Snapshot: a new scan replaces _pages and _baseName.
    final pages = _pages;
    final baseName = _baseName;
    setState(() => _saving = true);
    var saved = 0;
    for (final (i, page) in pages.indexed) {
      try {
        final ok = await FileUtils.saveImageToGallery(
          bytes: await File(page).readAsBytes(),
          fileName: '${baseName}_${i + 1}.jpg',
          toolId: 'doc_scanner',
        );
        if (ok) saved++;
      } catch (e) {
        debugPrint('Saving scanned page failed: $e');
      }
    }
    if (mounted) setState(() => _saving = false);
    messenger.showSnackBar(
      SnackBar(content: Text(l.docScanPagesSaved(saved))),
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
    final l = AppLocalizations.of(context);
    final hasResult = _pdf != null || _pages.isNotEmpty;

    return ToolScaffold(
      title: l.toolDocScannerTitle,
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
                      l.docScanHeadline,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l.docScanIntro,
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
                      label: Text(_scanning ? l.docScanScanning : l.docScanStart),
                    ),
                  ],
                ),
              ),
            ),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(_error!(l), style: TextStyle(color: theme.colorScheme.error)),
          ],
          if (hasResult) ...[
            Card(
              child: ListTile(
                leading: const Icon(Icons.picture_as_pdf_rounded, color: _accent, size: 36),
                title: Text(
                  _pdf == null ? l.docScanScannedPages : p.basename(_pdf!.path),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text(l.docScanPageCount(_pageCount)),
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
                    child: Image.file(
                      File(_pages[i]),
                      height: 150,
                      cacheHeight: 300,
                      semanticLabel: l.pdfToolsPageN(i + 1),
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
            if (_pdf != null) ...[
              FilledButton.icon(
                style: FilledButton.styleFrom(backgroundColor: _accent),
                onPressed: _saving ? null : _savePdf,
                icon: const Icon(Icons.download_rounded),
                label: Text(l.docScanSavePdf),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => Share.shareXFiles([XFile(_pdf!.path)]),
                icon: const Icon(Icons.share_rounded),
                label: Text(l.docScanSharePdf),
              ),
              const SizedBox(height: 8),
            ],
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pages.isEmpty ? null : _extractText,
                    icon: const Icon(Icons.text_snippet_rounded),
                    label: Text(l.docScanCopyText, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pages.isEmpty || _saving ? null : _saveImages,
                    icon: const Icon(Icons.image_rounded),
                    label: Text(l.docScanSaveJpg, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: _scanning || _saving ? null : _scan,
              icon: const Icon(Icons.add_a_photo_rounded),
              label: Text(l.docScanAnother),
            ),
          ],
        ],
      ),
    );
  }
}
