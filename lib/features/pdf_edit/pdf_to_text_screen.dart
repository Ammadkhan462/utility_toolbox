import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/tools/tool_input.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/pdf_edit/logic/text_logic.dart';
import 'package:utility_toolbox/features/pdf_edit/services/pdf_edit_engine.dart';
import 'package:utility_toolbox/features/pdf_edit/services/pdf_thumbnails.dart';
import 'package:utility_toolbox/features/pdf_edit/widgets/pdf_edit_widgets.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

const _accent = Color(0xFFFFA726);

/// Pulls all text out of a PDF (background isolate, page by page) and lets
/// the user copy, share or save it. Scanned PDFs are handed to OCR.
class PdfToTextScreen extends ConsumerStatefulWidget {
  const PdfToTextScreen({super.key, this.initialPath});

  final String? initialPath;

  @override
  ConsumerState<PdfToTextScreen> createState() => _PdfToTextScreenState();
}

class _PdfToTextScreenState extends ConsumerState<PdfToTextScreen> {
  final _engine = const PdfEditEngine();

  String? _path;
  Uint8List? _bytes;
  PdfDocInfo? _info;
  bool _loading = false;
  bool _extracting = false;
  bool _done = false;
  bool _saving = false;
  bool _openingOcr = false;
  String? _error;
  int _total = 0;
  final List<String> _pages = [];
  StreamSubscription<TextExtractEvent>? _sub;
  String? _fullText;
  File? _txtFile;

  @override
  void initState() {
    super.initState();
    if (widget.initialPath != null) _load(widget.initialPath!);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> _pick() async {
    final path = await pickPdfFile();
    if (path != null && mounted) await _load(path);
  }

  Future<void> _load(String path) async {
    await _sub?.cancel();
    _sub = null;
    if (!mounted) return;
    setState(() {
      _path = path;
      _bytes = null;
      _info = null;
      _pages.clear();
      _total = 0;
      _done = false;
      _extracting = false;
      _fullText = null;
      _txtFile = null;
      _error = null;
      _loading = true;
    });
    try {
      final opened = await _engine.open(path);
      if (!mounted) return;
      setState(() {
        _bytes = opened.bytes;
        _info = opened.info;
      });
      if (!opened.info.encrypted) _extract(opened.bytes, opened.info.pageCount);
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = AppLocalizations.of(context).pdfEditInvalidPdf);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _extract(Uint8List bytes, int pageCount) {
    setState(() {
      _extracting = true;
      _total = pageCount;
    });
    _sub = extractTextPages(bytes).listen(
      (event) {
        if (!mounted) return;
        switch (event) {
          case TextExtractPage(:final total, :final text):
            setState(() {
              _total = total;
              _pages.add(cleanPageText(text));
            });
          case TextExtractDone():
            setState(() {
              _extracting = false;
              _done = true;
              _fullText = joinPages(_pages);
            });
        }
      },
      onError: (Object e) {
        if (!mounted) return;
        final l = AppLocalizations.of(context);
        setState(() {
          _extracting = false;
          _error = e == 'password' ? l.pdfEditLocked : l.pdfToTextFailed;
        });
      },
    );
  }

  Future<void> _copy() async {
    final text = _fullText;
    if (text == null) return;
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    messenger.showSnackBar(SnackBar(content: Text(l.pdfToTextCopied)));
  }

  Future<File?> _ensureTxt() async {
    final text = _fullText;
    final path = _path;
    if (text == null || path == null) return null;
    return _txtFile ??= await PdfEditEngine.writeOutput(
      utf8.encode(text),
      path,
      'text',
      ext: 'txt',
    );
  }

  Future<void> _share() async {
    final text = _fullText;
    if (text == null) return;
    // Short text shares nicely into chat apps; long text goes as a file.
    if (text.length <= 20000) {
      await Share.share(text);
      return;
    }
    final file = await _ensureTxt();
    if (file == null || !mounted) return;
    await Share.shareXFiles([XFile(file.path, mimeType: 'text/plain')]);
  }

  Future<void> _saveTxt() async {
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final ads = ref.read(adsServiceProvider);
    setState(() => _saving = true);
    try {
      final file = await _ensureTxt();
      if (file == null) return;
      final outcome = await FileUtils.saveToDownloads(
        sourcePath: file.path,
        fileName: p.basenameWithoutExtension(file.path),
        ext: 'txt',
        mimeType: 'text/plain',
        toolId: 'pdf_to_text',
      );
      if (!mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            outcome == SaveOutcome.downloaded ? l.pdfEditSavedToDownloads : l.pdfEditSharedInstead,
          ),
        ),
      );
      await ads.showInterstitialIfAllowed();
    } catch (_) {
      if (mounted) messenger.showSnackBar(SnackBar(content: Text(l.pdfEditSaveFailed)));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  /// Renders page 1 to a PNG and opens Image to Text with it.
  Future<void> _openOcr() async {
    final bytes = _bytes;
    if (bytes == null) return;
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _openingOcr = true);
    try {
      final img = await renderPagePreview(bytes, 0, dpi: 200);
      if (img == null) throw StateError('render failed');
      final data = await img.toByteData(format: ui.ImageByteFormat.png);
      img.dispose();
      final file = await PdfEditEngine.writeOutput(
        data!.buffer.asUint8List(),
        _path ?? 'page',
        'page1',
        ext: 'png',
      );
      if (!mounted) return;
      await context.push(
        AppRoutes.ocr,
        extra: ToolInput(paths: [file.path], kind: InputKind.image),
      );
    } catch (_) {
      if (mounted) messenger.showSnackBar(SnackBar(content: Text(l.pdfEditPreviewFailed)));
    } finally {
      if (mounted) setState(() => _openingOcr = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final info = _info;
    final full = _fullText;
    final scanned = _done && looksScanned(_pages);
    final emptyPages = _pages.where((t) => t.trim().isEmpty).length;
    final hasText = _done && !scanned && full != null;

    final header = <Widget>[
      const SizedBox(height: 8),
      PdfPickCard(
        path: _path,
        pageCount: info?.pageCount,
        loading: _loading,
        locked: info?.encrypted ?? false,
        onPick: _pick,
        accent: _accent,
      ),
      if (info != null && info.encrypted && _path != null) PdfLockedNotice(path: _path!),
      if (_extracting) ...[
        const SizedBox(height: 16),
        LinearProgressIndicator(
          value: _total == 0 ? null : _pages.length / _total,
          color: _accent,
          minHeight: 6,
          borderRadius: BorderRadius.circular(3),
        ),
        const SizedBox(height: 8),
        Text(
          l.pdfToTextReading(_pages.length, _total),
          style: theme.textTheme.bodyMedium,
        ),
      ],
      if (scanned) _scannedCard(l),
      if (hasText) ...[
        const SizedBox(height: 16),
        Text(
          '${l.pdfEditPageCount(_pages.length)} · ${l.pdfToTextWords(countWords(full))}',
          style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            FilledButton.icon(
              onPressed: _copy,
              icon: const Icon(Icons.copy_all_rounded),
              label: Text(l.pdfToTextCopyAll),
            ),
            OutlinedButton.icon(
              onPressed: _share,
              icon: const Icon(Icons.share_rounded),
              label: Text(l.pdfEditShare),
            ),
            OutlinedButton.icon(
              onPressed: _saving ? null : _saveTxt,
              icon: _saving
                  ? const SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.download_rounded),
              label: Text(l.pdfToTextSaveTxt),
            ),
          ],
        ),
        if (emptyPages > 0) ...[
          const SizedBox(height: 8),
          Text(
            l.pdfToTextPartlyScanned(emptyPages),
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
        ],
      ],
      if (_error != null) PdfInlineError(message: _error!),
      const SizedBox(height: 12),
    ];

    return ToolScaffold(
      title: l.toolPdfToTextTitle,
      accentColor: _accent,
      body: SelectionArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
              sliver: SliverList(delegate: SliverChildListDelegate(header)),
            ),
            if (hasText || (_extracting && _pages.isNotEmpty))
              SliverPadding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => _pageBlock(l, i),
                    childCount: _pages.length,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _scannedCard(AppLocalizations l) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.document_scanner_rounded, size: 44, color: _accent),
              const SizedBox(height: 8),
              Text(
                l.pdfToTextScannedTitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(l.pdfToTextScannedBody, textAlign: TextAlign.center),
              const SizedBox(height: 14),
              PdfActionButton(
                label: l.pdfToTextOpenOcr(l.toolOcrTitle),
                icon: Icons.text_snippet_rounded,
                busy: _openingOcr,
                onPressed: _openOcr,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageBlock(AppLocalizations l, int i) {
    final theme = Theme.of(context);
    final text = _pages[i];
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l.pdfEditPageN(i + 1),
                style: theme.textTheme.labelLarge?.copyWith(color: _accent, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              if (text.trim().isEmpty)
                Text(
                  l.pdfToTextEmptyPage,
                  style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
                )
              else
                Text(text, style: theme.textTheme.bodyMedium?.copyWith(height: 1.45)),
            ],
          ),
        ),
      ),
    );
  }
}
