import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
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
    // Not run through compute(): rendering (Printing.raster) and re-encoding
    // (FlutterImageCompress) both go through platform channels, which
    // background isolates can't use without extra BackgroundIsolateBinaryMessenger
    // wiring. The native rendering/encoding work happens off the Dart main
    // thread anyway, so this stays responsive without an isolate.
    return _compressPdf(pdfPath, level);
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
  sf.PdfSection? section;

  for (final path in pdfPaths) {
    final bytes = await File(path).readAsBytes();
    final source = sf.PdfDocument(inputBytes: bytes);
    pageCount += source.pages.count;
    for (var i = 0; i < source.pages.count; i++) {
      final template = source.pages[i].createTemplate();
      // New documents default to A4 with 40pt margins, which shifted and
      // cropped every page that wasn't A4 portrait. Give each page size its
      // own margin-free section. Orientation must be set before the size,
      // otherwise Syncfusion swaps landscape sizes back to portrait.
      if (section == null || section.pageSettings.size != template.size) {
        section = merged.sections!.add();
        section.pageSettings
          ..orientation = template.size.width > template.size.height
              ? sf.PdfPageOrientation.landscape
              : sf.PdfPageOrientation.portrait
          ..size = template.size
          ..margins.all = 0;
      }
      section.pages.add().graphics.drawPdfTemplate(template, Offset.zero);
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

/// Real compression for an existing PDF.
///
/// Syncfusion's Flutter PDF binding does NOT support re-compressing images
/// already embedded in a loaded document (that's only available in their
/// .NET library via `PdfCompressionOptions`/`ImageQuality`). Just toggling
/// `PdfDocument.compressionLevel` on a loaded document barely touches the
/// output size, which is why the old implementation produced a file the
/// same size (or bigger) than the original.
///
/// To get a real size reduction we rasterize every page to an image, then
/// re-encode each one as a JPEG at a quality tied to the chosen level, and
/// rebuild the PDF from those recompressed pages. This mirrors how most
/// mobile "compress PDF" tools work and scales the effect with the level
/// (Low = light recompression/high quality, High = aggressive).
Future<PdfJobResult> _compressPdf(
  String pdfPath,
  PdfCompressionLevel level,
) async {
  final inputBytes = await File(pdfPath).readAsBytes();

  final settings = switch (level) {
    PdfCompressionLevel.low => (quality: 85, dpi: 150.0),
    PdfCompressionLevel.medium => (quality: 60, dpi: 120.0),
    PdfCompressionLevel.high => (quality: 35, dpi: 90.0),
  };

  final doc = pw.Document();
  var pageCount = 0;

  await for (final page in Printing.raster(inputBytes, dpi: settings.dpi)) {
    pageCount++;
    final pngBytes = await page.toPng();
    final jpgBytes = await FlutterImageCompress.compressWithList(
      pngBytes,
      quality: settings.quality,
      format: CompressFormat.jpeg,
      // The page size is already controlled by the raster DPI above; these
      // just need to be larger than any rendered page so compressWithList's
      // own downscaling step never kicks in and silently resizes pages.
      minWidth: 10000,
      minHeight: 10000,
    );
    final image = pw.MemoryImage(jpgBytes);
    // Convert the raster's pixel dimensions back to PDF points (72 per
    // inch) so the rebuilt page matches the original page size.
    final scale = 72.0 / settings.dpi;
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat(page.width * scale, page.height * scale),
        margin: pw.EdgeInsets.zero,
        build: (context) => pw.Image(image, fit: pw.BoxFit.contain),
      ),
    );
  }

  final outputBytes = await doc.save();

  // Rasterizing can occasionally end up larger than the original for
  // already-small or text-only PDFs (re-encoding overhead can outweigh any
  // savings). In that case just hand back the original file untouched
  // instead of a "compressed" file that's actually bigger.
  if (outputBytes.length >= inputBytes.length) {
    final fallbackPath =
        '${Directory.systemTemp.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final fallbackFile = File(fallbackPath);
    await fallbackFile.writeAsBytes(inputBytes);
    return PdfJobResult(
      filePath: fallbackPath,
      fileSizeBytes: inputBytes.length,
      pageCount: pageCount,
      createdAt: DateTime.now(),
    );
  }

  final outputPath =
      '${Directory.systemTemp.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.pdf';
  final file = File(outputPath);
  await file.writeAsBytes(outputBytes);
  return PdfJobResult(
    filePath: outputPath,
    fileSizeBytes: await file.length(),
    pageCount: pageCount,
    createdAt: DateTime.now(),
  );
}
