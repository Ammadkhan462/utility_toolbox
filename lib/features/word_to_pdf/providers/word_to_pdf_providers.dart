import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:docx_to_text/docx_to_text.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';

enum WordToPdfStatus { idle, picking, converting, done, error }

class WordToPdfState {
  final WordToPdfStatus status;
  final String? inputPath;
  final String? outputPath;
  final String? error;
  final double progress;

  const WordToPdfState({
    this.status = WordToPdfStatus.idle,
    this.inputPath,
    this.outputPath,
    this.error,
    this.progress = 0,
  });

  WordToPdfState copyWith({
    WordToPdfStatus? status,
    String? inputPath,
    String? outputPath,
    String? error,
    double? progress,
  }) => WordToPdfState(
    status: status ?? this.status,
    inputPath: inputPath ?? this.inputPath,
    outputPath: outputPath ?? this.outputPath,
    error: error ?? this.error,
    progress: progress ?? this.progress,
  );

  String? get inputFilename =>
      inputPath != null ? p.basename(inputPath!) : null;
  String? get outputFilename =>
      outputPath != null ? p.basename(outputPath!) : null;
}

class WordToPdfNotifier extends StateNotifier<WordToPdfState> {
  WordToPdfNotifier() : super(const WordToPdfState());

  Future<void> pickAndConvert() async {
    state = const WordToPdfState(status: WordToPdfStatus.picking);

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['docx'],
        allowMultiple: false,
      );

      if (result == null || result.files.isEmpty) {
        state = const WordToPdfState();
        return;
      }

      final inputPath = result.files.first.path!;
      state = state.copyWith(
        status: WordToPdfStatus.converting,
        inputPath: inputPath,
        progress: 0.2,
      );

      // ── Extract text from .docx ─────────────────────────────────
      final bytes = await File(inputPath).readAsBytes();
      state = state.copyWith(progress: 0.4);

      final text = docxToText(bytes);
      state = state.copyWith(progress: 0.6);

      // ── Build PDF ───────────────────────────────────────────────
      final pdf = pw.Document();
      final lines = text.split('\n');

      // Split into pages ~50 lines each
      const linesPerPage = 50;
      for (var i = 0; i < lines.length; i += linesPerPage) {
        final chunk = lines.skip(i).take(linesPerPage).join('\n');
        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            margin: const pw.EdgeInsets.all(40),
            build: (_) =>
                pw.Text(chunk, style: const pw.TextStyle(fontSize: 11)),
          ),
        );
      }

      // If no text extracted, add placeholder page
      if (lines.isEmpty || text.trim().isEmpty) {
        pdf.addPage(
          pw.Page(
            build: (_) => pw.Center(
              child: pw.Text(
                'No extractable text found in this document.',
                style: const pw.TextStyle(fontSize: 14),
              ),
            ),
          ),
        );
      }

      state = state.copyWith(progress: 0.85);

      // ── Save output ─────────────────────────────────────────────
      final outDir = await getTemporaryDirectory();
      final outName = '${p.basenameWithoutExtension(inputPath)}.pdf';
      final outPath = p.join(outDir.path, outName);
      final pdfBytes = await pdf.save();
      await File(outPath).writeAsBytes(pdfBytes);

      state = state.copyWith(
        status: WordToPdfStatus.done,
        outputPath: outPath,
        progress: 1.0,
      );
    } catch (e) {
      state = state.copyWith(
        status: WordToPdfStatus.error,
        error: e.toString(),
      );
    }
  }

  Future<void> share() async {
    if (state.outputPath == null) return;
    await Share.shareXFiles([XFile(state.outputPath!)]);
  }

  Future<SaveOutcome> download() async {
    if (state.outputPath == null) return SaveOutcome.sharedFallback;
    final baseName = p.basenameWithoutExtension(state.outputPath!);
    return FileUtils.saveToDownloads(
      sourcePath: state.outputPath!,
      fileName: baseName,
      ext: 'pdf',
      mimeType: 'application/pdf',
    );
  }

  void reset() => state = const WordToPdfState();
}

final wordToPdfProvider =
    StateNotifierProvider<WordToPdfNotifier, WordToPdfState>(
      (_) => WordToPdfNotifier(),
    );
