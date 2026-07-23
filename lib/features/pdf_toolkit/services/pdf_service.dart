import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;
import 'package:utility_toolbox/features/pdf_toolkit/models/pdf_job_result.dart';

class PdfService {
  Future<PdfJobResult> imagesToPdf(List<String> imagePaths) async {
    return compute(_imagesToPdfIsolate, imagePaths);
  }

  Future<PdfJobResult> mergePdfs(List<String> pdfPaths) async {
    return compute(_mergePdfsIsolate, pdfPaths);
  }

  Future<PdfJobResult> compressPdf(
    String pdfPath,
    PdfCompressionLevel level,
  ) async {
    return compute(_compressPdfIsolate, [pdfPath, level.index]);
  }
}

enum PdfCompressionLevel { low, medium, high }

Future<PdfJobResult> _imagesToPdfIsolate(List<String> imagePaths) async {
  final doc = pw.Document();

  for (final path in imagePaths) {
    final bytes = await File(path).readAsBytes();
    final image = pw.MemoryImage(bytes);
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) =>
            pw.Center(child: pw.Image(image, fit: pw.BoxFit.contain)),
      ),
    );
  }

  final outputPath =
      '${Directory.systemTemp.path}/images_${DateTime.now().millisecondsSinceEpoch}.pdf';
  final file = File(outputPath);
  await file.writeAsBytes(await doc.save());
  return PdfJobResult(
    filePath: outputPath,
    fileSizeBytes: await file.length(),
    pageCount: imagePaths.length,
    createdAt: DateTime.now(),
  );
}

Future<PdfJobResult> _mergePdfsIsolate(List<String> pdfPaths) async {
  final merged = sf.PdfDocument();
  var pageCount = 0;

  for (final path in pdfPaths) {
    final bytes = await File(path).readAsBytes();
    final source = sf.PdfDocument(inputBytes: bytes);
    pageCount += source.pages.count;
    for (var i = 0; i < source.pages.count; i++) {
      final template = source.pages[i].createTemplate();
      merged.pages.add().graphics.drawPdfTemplate(template, const Offset(0, 0));
    }
    source.dispose();
  }

  final outputPath =
      '${Directory.systemTemp.path}/merged_${DateTime.now().millisecondsSinceEpoch}.pdf';
  final outputBytes = Uint8List.fromList(await merged.save());
  merged.dispose();

  final file = File(outputPath);
  await file.writeAsBytes(outputBytes);
  return PdfJobResult(
    filePath: outputPath,
    fileSizeBytes: await file.length(),
    pageCount: pageCount,
    createdAt: DateTime.now(),
  );
}

Future<PdfJobResult> _compressPdfIsolate(List<Object> args) async {
  final pdfPath = args[0] as String;
  final levelIndex = args[1] as int;
  final level = PdfCompressionLevel.values[levelIndex];

  final inputBytes = await File(pdfPath).readAsBytes();
  final document = sf.PdfDocument(inputBytes: inputBytes);
  final pageCount = document.pages.count;

  document.compressionLevel = switch (level) {
    PdfCompressionLevel.low => sf.PdfCompressionLevel.none,
    PdfCompressionLevel.medium => sf.PdfCompressionLevel.normal,
    PdfCompressionLevel.high => sf.PdfCompressionLevel.best,
  };

  final outputPath =
      '${Directory.systemTemp.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.pdf';
  final outputBytes = Uint8List.fromList(await document.save());
  document.dispose();

  final file = File(outputPath);
  await file.writeAsBytes(outputBytes);
  return PdfJobResult(
    filePath: outputPath,
    fileSizeBytes: await file.length(),
    pageCount: pageCount,
    createdAt: DateTime.now(),
  );
}
