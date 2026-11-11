import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:docx_to_text/docx_to_text.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';

enum WordToPdfStatus { idle, picking, converting, done, error }

class WordToPdfState {
  final WordToPdfStatus status;
  final String? inputPath;
  final String? outputPath;
  final String? error;
  final double progress;

  /// The document has non-Latin text but its font couldn't be downloaded
  /// (offline), so that text is missing from the PDF.
  final bool fontsMissing;

  const WordToPdfState({
    this.status = WordToPdfStatus.idle,
    this.inputPath,
    this.outputPath,
    this.error,
    this.progress = 0,
    this.fontsMissing = false,
  });

  WordToPdfState copyWith({
    WordToPdfStatus? status,
    String? inputPath,
    String? outputPath,
    String? error,
    double? progress,
    bool? fontsMissing,
  }) => WordToPdfState(
    status: status ?? this.status,
    inputPath: inputPath ?? this.inputPath,
    outputPath: outputPath ?? this.outputPath,
    error: error ?? this.error,
    progress: progress ?? this.progress,
    fontsMissing: fontsMissing ?? this.fontsMissing,
  );

  String? get inputFilename =>
      inputPath != null ? p.basename(inputPath!) : null;
  String? get outputFilename =>
      outputPath != null ? p.basename(outputPath!) : null;
}

class WordToPdfNotifier extends StateNotifier<WordToPdfState> {
  WordToPdfNotifier() : super(const WordToPdfState());

  /// [emptyText] is written into the PDF when the document has no text, in
  /// the app language.
  Future<void> pickAndConvert({required String emptyText}) async {
    if (_busy) return;
    state = const WordToPdfState(status: WordToPdfStatus.picking);

    final String? path;
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['docx'],
        allowMultiple: false,
      );
      path = result == null || result.files.isEmpty ? null : result.files.first.path;
    } catch (e) {
      debugPrint('Word picker failed: $e');
      if (mounted) state = const WordToPdfState();
      return;
    }
    if (!mounted) return;
    if (path == null) {
      state = const WordToPdfState();
      return;
    }
    await convertFile(path, emptyText: emptyText);
  }

  bool get _busy =>
      state.status == WordToPdfStatus.picking ||
      state.status == WordToPdfStatus.converting;

  /// Converts a .docx at [inputPath] — from the picker, the share sheet or
  /// "Open with". Text extraction and PDF layout run in a background
  /// isolate so large documents can't freeze the UI.
  Future<void> convertFile(String inputPath, {required String emptyText}) async {
    if (state.status == WordToPdfStatus.converting) return;
    state = WordToPdfState(
      status: WordToPdfStatus.converting,
      inputPath: inputPath,
      progress: 0.2,
    );
    try {
      // Read inside the isolate — no second copy of the file on the UI side.
      final text = await compute(_docxText, inputPath);
      if (!mounted) return;
      state = state.copyWith(progress: 0.4);

      // Helvetica has no Arabic, Devanagari, Bengali or Cyrillic glyphs, so
      // that text came out blank. Fetch a Noto font for each script in the
      // document (needs the network the first time; cached on disk after).
      final body = text.trim().isEmpty ? emptyText : text;
      final fonts = await _loadFontsFor(body);
      if (!mounted) return;
      state = state.copyWith(progress: 0.6, fontsMissing: fonts.missing);

      final pdfBytes = await compute(
        _buildPdf,
        (text: text, emptyText: emptyText, base: fonts.base, fallback: fonts.fallback),
      );
      if (!mounted) return;
      state = state.copyWith(progress: 0.85);

      // Own folder per run so a .docx named like an earlier output (or the
      // same name converted twice in a row) can't clobber a file that may
      // still be shared or saving.
      final outDir = await Directory(
        p.join((await getTemporaryDirectory()).path, 'word_to_pdf'),
      ).createTemp();
      final outName = '${p.basenameWithoutExtension(inputPath)}.pdf';
      final outPath = p.join(outDir.path, outName);
      await File(outPath).writeAsBytes(pdfBytes);

      if (!mounted) return;
      state = state.copyWith(
        status: WordToPdfStatus.done,
        outputPath: outPath,
        progress: 1.0,
      );
    } catch (e) {
      debugPrint('Word to PDF failed: $e');
      if (!mounted) return;
      // Raw exception text ("FormatException: …", "Null check operator…")
      // isn't useful to people; the screen shows its own message for null.
      state = WordToPdfState(status: WordToPdfStatus.error, inputPath: inputPath);
    }
  }

  Future<void> share() async {
    if (state.outputPath == null) return;
    await Share.shareXFiles([XFile(state.outputPath!)]);
  }

  bool _saving = false;

  /// Null when a save is already running (a double tap saved two copies).
  Future<SaveOutcome?> download() async {
    final outputPath = state.outputPath;
    if (outputPath == null) return SaveOutcome.sharedFallback;
    if (_saving) return null;
    _saving = true;
    try {
      return await FileUtils.saveToDownloads(
        sourcePath: outputPath,
        fileName: p.basenameWithoutExtension(outputPath),
        ext: 'pdf',
        mimeType: 'application/pdf',
        toolId: 'word_to_pdf',
      );
    } finally {
      _saving = false;
    }
  }

  void reset() => state = const WordToPdfState();
}

// autoDispose: a kept-alive result pointed at a temp file the OS may have
// cleared, and re-opening the tool showed the previous conversion.
final wordToPdfProvider =
    StateNotifierProvider.autoDispose<WordToPdfNotifier, WordToPdfState>(
      (_) => WordToPdfNotifier(),
    );

const _newline = '\n';

// Script detection for picking fonts and paragraph direction.
final _arabicScript = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]');
final _devanagari = RegExp(r'[\u0900-\u097F\uA8E0-\uA8FF]');
final _bengali = RegExp(r'[\u0980-\u09FF]');
final _beyondLatin1 = RegExp(r'[^\u0000-\u00FF]');

typedef _Fonts = ({ByteData? base, List<ByteData> fallback, bool missing});

/// Noto fonts for the scripts in [text]. Plain Latin-1 text keeps the
/// built-in Helvetica (works offline). Anything else gets Noto Sans as the
/// base (Latin, Greek, Cyrillic, typographic quotes…) plus a fallback per
/// script. A font that can't be loaded is skipped and reported as missing.
Future<_Fonts> _loadFontsFor(String text) async {
  if (!_beyondLatin1.hasMatch(text)) {
    return (base: null, fallback: const <ByteData>[], missing: false);
  }
  var missing = false;
  final base = await _cachedFont('NotoSans-Regular', PdfGoogleFonts.notoSansRegular);
  if (base == null) missing = true;
  final fallback = <ByteData>[];
  for (final (re, name, load) in [
    (_arabicScript, 'NotoNaskhArabic-Regular', PdfGoogleFonts.notoNaskhArabicRegular),
    (_devanagari, 'NotoSansDevanagari-Regular', PdfGoogleFonts.notoSansDevanagariRegular),
    (_bengali, 'NotoSansBengali-Regular', PdfGoogleFonts.notoSansBengaliRegular),
  ]) {
    if (!re.hasMatch(text)) continue;
    final font = await _cachedFont(name, load);
    if (font == null) {
      missing = true;
    } else {
      fallback.add(font);
    }
  }
  return (base: base, fallback: fallback, missing: missing);
}

/// Loads a Google font from the app's own disk cache, or downloads it once
/// and keeps it there (PdfGoogleFonts only caches in memory). Null when it
/// can't be fetched — PdfGoogleFonts then hands back Helvetica.
Future<ByteData?> _cachedFont(String name, Future<pw.Font> Function() download) async {
  File? file;
  try {
    final dir = Directory(p.join((await getApplicationSupportDirectory()).path, 'pdf_fonts'));
    file = File(p.join(dir.path, '$name.ttf'));
    if (await file.exists()) {
      return ByteData.sublistView(await file.readAsBytes());
    }
  } catch (e) {
    debugPrint('Font cache read failed: $e');
  }
  try {
    final font = await download().timeout(const Duration(seconds: 25));
    if (font is! pw.TtfFont) return null;
    final data = font.data;
    try {
      await file?.parent.create(recursive: true);
      await file?.writeAsBytes(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        flush: true,
      );
    } catch (e) {
      debugPrint('Font cache write failed: $e');
    }
    return data;
  } catch (e) {
    debugPrint('Font download failed ($name): $e');
    return null;
  }
}

/// Runs in a background isolate.
String _docxText(String path) => docxToText(File(path).readAsBytesSync());

/// Runs in a background isolate (see [WordToPdfNotifier.convertFile]).
Future<Uint8List> _buildPdf(
  ({String text, String emptyText, ByteData? base, List<ByteData> fallback}) args,
) async {
  final text = args.text;
  final fallback = [for (final f in args.fallback) pw.TtfFont(f)];
  final theme = args.base == null && fallback.isEmpty
      ? null
      : pw.ThemeData.withFont(
          base: args.base == null ? pw.Font.helvetica() : pw.TtfFont(args.base!),
          fontFallback: fallback,
        );
  final pdf = pw.Document(theme: theme);

  // Arabic and Urdu paragraphs run right to left (the pdf package shapes
  // Arabic letters only for RTL text).
  pw.Widget paragraph(String line, double fontSize) {
    final rtl = _arabicScript.hasMatch(line);
    return pw.Text(
      line,
      textDirection: rtl ? pw.TextDirection.rtl : pw.TextDirection.ltr,
      textAlign: rtl ? pw.TextAlign.right : pw.TextAlign.left,
      style: pw.TextStyle(fontSize: fontSize),
    );
  }

  // One widget per paragraph in a MultiPage, which flows them across pages.
  // The old fixed "50 lines per page" counted paragraphs, not wrapped
  // lines, so long paragraphs ran off the page and their text was lost.
  if (text.trim().isNotEmpty) {
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        // Default is 20 pages, which threw for longer documents.
        maxPages: 2000,
        build: (_) => [
          for (final line in text.split(_newline)) paragraph(line, 11),
        ],
      ),
    );
  }

  if (text.trim().isEmpty) {
    pdf.addPage(
      pw.Page(
        build: (_) => pw.Center(child: paragraph(args.emptyText, 14)),
      ),
    );
  }
  return pdf.save();
}
