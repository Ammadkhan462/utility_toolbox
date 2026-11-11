import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;
import 'package:utility_toolbox/features/pdf_edit/logic/stamp_logic.dart';
import 'package:utility_toolbox/features/pdf_edit/services/pdf_edit_engine.dart';

/// 1×1 transparent-ish RGBA PNG.
final _png = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==',
);

/// A PDF whose pages say "Page 1", "Page 2", … with optional /Rotate and
/// sizes alternating portrait / landscape.
Future<Uint8List> makePdf(int pages, {List<int>? rotations, String? password}) async {
  final doc = sf.PdfDocument();
  doc.pageSettings.margins.all = 0;
  final font = sf.PdfStandardFont(sf.PdfFontFamily.helvetica, 18);
  for (var i = 0; i < pages; i++) {
    final page = doc.pages.add();
    page.graphics.drawString('Page ${i + 1}', font, bounds: const Rect.fromLTWH(20, 20, 300, 40));
  }
  if (password != null) {
    doc.security.userPassword = password;
    doc.security.ownerPassword = password;
  }
  var bytes = Uint8List.fromList(await doc.save());
  doc.dispose();
  if (rotations != null) {
    final loaded = sf.PdfDocument(inputBytes: bytes);
    for (var i = 0; i < rotations.length; i++) {
      loaded.pages[i].rotation = sf.PdfPageRotateAngle.values[rotations[i]];
    }
    bytes = Uint8List.fromList(await loaded.save());
    loaded.dispose();
  }
  return bytes;
}

List<String> pageTexts(Uint8List bytes) {
  final doc = sf.PdfDocument(inputBytes: bytes);
  final ex = sf.PdfTextExtractor(doc);
  final out = [
    for (var i = 0; i < doc.pages.count; i++) ex.extractText(startPageIndex: i, endPageIndex: i).trim(),
  ];
  doc.dispose();
  return out;
}

void main() {
  test('inspect reports pages, sizes and rotation', () async {
    final pdf = await makePdf(3, rotations: [0, 1, 2]);
    final info = inspectPdfBytes(pdf);
    expect(info.encrypted, isFalse);
    expect(info.pageCount, 3);
    expect(info.pages.map((p) => p.quarterTurns), [0, 1, 2]);
    expect(info.pages.first.width, greaterThan(0));
  });

  test('inspect flags password-protected files', () async {
    final pdf = await makePdf(1, password: 'secret');
    expect(inspectPdfBytes(pdf).encrypted, isTrue);
  });

  test('organize: delete + rotate keeps order and adds rotation', () async {
    final pdf = await makePdf(4, rotations: [1, 0, 0, 0]);
    final out = await organizePdfBytes(
      OrganizeJob(pdf: pdf, sources: const [0, 2, 3], turns: const [1, 0, 3]),
    );
    final info = inspectPdfBytes(out);
    expect(info.pageCount, 3);
    expect(info.pages.map((p) => p.quarterTurns), [2, 0, 3]);
    expect(pageTexts(out), ['Page 1', 'Page 3', 'Page 4']);
  });

  test('organize: reorder copies pages in the new order', () async {
    final pdf = await makePdf(3, rotations: [0, 1, 0]);
    final out = await organizePdfBytes(
      OrganizeJob(pdf: pdf, sources: const [2, 0, 1], turns: const [0, 0, 1]),
    );
    final info = inspectPdfBytes(out);
    expect(info.pageCount, 3);
    expect(pageTexts(out), ['Page 3', 'Page 1', 'Page 2']);
    // Page 2 had /Rotate 90 and got one more turn.
    expect(info.pages.map((p) => p.quarterTurns), [0, 0, 2]);
    final src = inspectPdfBytes(pdf);
    expect(info.pages[0].width, closeTo(src.pages[2].width, 0.5));
    expect(info.pages[0].height, closeTo(src.pages[2].height, 0.5));
  });

  test('sign draws on the chosen pages and keeps the rest', () async {
    final pdf = await makePdf(3, rotations: [0, 1, 0]);
    final out = await signPdfBytes(
      SignJob(
        pdf: pdf,
        png: _png,
        placements: const [
          SignPlacement(0, Rect.fromLTWH(0.6, 0.8, 0.3, 0.1)),
          SignPlacement(1, Rect.fromLTWH(0.1, 0.1, 0.3, 0.1)),
        ],
      ),
    );
    expect(out.length, greaterThan(pdf.length));
    expect(inspectPdfBytes(out).pageCount, 3);
    expect(pageTexts(out), ['Page 1', 'Page 2', 'Page 3']);
  });

  test('watermark (vector) and page numbers', () async {
    final pdf = await makePdf(2, rotations: [0, 1]);
    for (final layout in WatermarkLayout.values) {
      final out = await stampPdfBytes(
        StampJob.watermark(
          pdf: pdf,
          watermark: const TextStamp.vector('DRAFT', 48),
          layout: layout,
          colorArgb: 0xFFD32F2F,
          opacity: 0.3,
        ),
      );
      expect(pageTexts(out).first, contains('DRAFT'));
    }
    final labels = pageNumberLabels(PageNumberStyle.ofTotal, pageCount: 2);
    final numbered = await stampPdfBytes(
      StampJob.pageNumbers(
        pdf: pdf,
        pageNumbers: [for (final s in labels) TextStamp.vector(s, pageNumberFontSize)],
        position: PageNumberPosition.bottomRight,
      ),
    );
    final texts = pageTexts(numbered);
    expect(texts[0], contains('1 / 2'));
    expect(texts[1], contains('2 / 2'));
  });

  test('watermark (image stamp) works too', () async {
    final pdf = await makePdf(1);
    final out = await stampPdfBytes(
      StampJob.watermark(
        pdf: pdf,
        watermark: TextStamp.image(_png, const Size(100, 30)),
        layout: WatermarkLayout.tiled,
        colorArgb: 0xFF000000,
        opacity: 0.5,
      ),
    );
    expect(out.length, greaterThan(pdf.length));
  });

  test('text extraction streams every page from an isolate', () async {
    final pdf = await makePdf(3);
    final events = await extractTextPages(pdf).toList();
    final pages = events.whereType<TextExtractPage>().toList();
    expect(pages.length, 3);
    expect(pages.map((e) => e.text.trim()), ['Page 1', 'Page 2', 'Page 3']);
    expect(events.last, isA<TextExtractDone>());
  });
}
