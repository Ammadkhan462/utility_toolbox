import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;
import 'package:utility_toolbox/features/pdf_edit/logic/organize_model.dart';
import 'package:utility_toolbox/features/pdf_edit/logic/pdf_geometry.dart';
import 'package:utility_toolbox/features/pdf_edit/logic/stamp_logic.dart';

/// What we learn about a PDF when it is opened.
class PdfDocInfo {
  const PdfDocInfo({required this.encrypted, this.pages = const []});

  final bool encrypted;
  final List<PageGeom> pages;

  int get pageCount => pages.length;
}

/// The file isn't a PDF we can read.
class PdfReadException implements Exception {
  const PdfReadException();
}

/// Heavy Syncfusion work for the PDF edit tools. Every method reads the
/// file on the UI isolate (async I/O) and does the parsing/saving in a
/// background isolate with plain bytes, so the UI never janks.
class PdfEditEngine {
  const PdfEditEngine();

  Future<({Uint8List bytes, PdfDocInfo info})> open(String path) async {
    final Uint8List bytes;
    try {
      bytes = await File(path).readAsBytes();
    } catch (_) {
      throw const PdfReadException();
    }
    try {
      final info = await compute(inspectPdfBytes, bytes);
      return (bytes: bytes, info: info);
    } catch (_) {
      throw const PdfReadException();
    }
  }

  Future<File> sign({
    required Uint8List pdf,
    required Uint8List signaturePng,
    required List<SignPlacement> placements,
    required String sourcePath,
  }) async {
    final out = await compute(
      signPdfBytes,
      SignJob(pdf: pdf, png: signaturePng, placements: placements),
    );
    return writeOutput(out, sourcePath, 'signed');
  }

  Future<File> organize({
    required Uint8List pdf,
    required List<OrgPage> pages,
    required String sourcePath,
  }) async {
    final out = await compute(
      organizePdfBytes,
      OrganizeJob(
        pdf: pdf,
        sources: [for (final p in pages) p.source],
        turns: [for (final p in pages) p.turns],
      ),
    );
    return writeOutput(out, sourcePath, 'organized');
  }

  Future<File> stamp({
    required StampJob job,
    required String sourcePath,
    required String suffix,
  }) async {
    final out = await compute(stampPdfBytes, job);
    return writeOutput(out, sourcePath, suffix);
  }

  /// Writes [bytes] as `<original name>_<suffix>.pdf` in a fresh temp folder,
  /// so the name the user sees in Downloads / My Files stays clean.
  static Future<File> writeOutput(
    List<int> bytes,
    String sourcePath,
    String suffix, {
    String ext = 'pdf',
  }) async {
    final dir = await Directory.systemTemp.createTemp('pdf_edit_');
    final base = p.basenameWithoutExtension(sourcePath);
    final safe = base.isEmpty ? 'document' : base;
    final file = File(p.join(dir.path, '${safe}_$suffix.$ext'));
    return file.writeAsBytes(bytes, flush: true);
  }
}

// ── Inspect ──────────────────────────────────────────────────────────────

bool _isPasswordError(Object e) => '$e'.toLowerCase().contains('password');

PdfDocInfo inspectPdfBytes(Uint8List bytes) {
  final sf.PdfDocument doc;
  try {
    doc = sf.PdfDocument(inputBytes: bytes);
  } catch (e) {
    if (_isPasswordError(e)) return const PdfDocInfo(encrypted: true);
    rethrow;
  }
  try {
    final pages = <PageGeom>[];
    for (var i = 0; i < doc.pages.count; i++) {
      final page = doc.pages[i];
      final size = page.size;
      pages.add(PageGeom(size.width, size.height, page.rotation.index));
    }
    return PdfDocInfo(encrypted: false, pages: pages);
  } finally {
    doc.dispose();
  }
}

sf.PdfPageRotateAngle _angle(int turns) =>
    sf.PdfPageRotateAngle.values[normalizeTurns(turns)];

/// Applies the transform that makes (0,0)-(visualW,visualH) the page as the
/// user sees it, whatever its /Rotate.
Size _enterVisualSpace(sf.PdfGraphics g, sf.PdfPage page) {
  final geom = PageGeom(page.size.width, page.size.height, page.rotation.index);
  final t = visualTransform(geom.size, geom.quarterTurns);
  if (geom.quarterTurns != 0) {
    g.translateTransform(t.translate.dx, t.translate.dy);
    g.rotateTransform(t.rotateDegrees);
  }
  return geom.visualSize;
}

// ── Sign ─────────────────────────────────────────────────────────────────

/// One signature on one page; [rect] is in 0..1 fractions of the page as
/// displayed (rotation applied).
class SignPlacement {
  const SignPlacement(this.page, this.rect);

  final int page;
  final Rect rect;
}

class SignJob {
  const SignJob({required this.pdf, required this.png, required this.placements});

  final Uint8List pdf;
  final Uint8List png;
  final List<SignPlacement> placements;
}

Future<Uint8List> signPdfBytes(SignJob job) async {
  final doc = sf.PdfDocument(inputBytes: job.pdf);
  try {
    final bitmap = sf.PdfBitmap(job.png);
    for (final placement in job.placements) {
      if (placement.page < 0 || placement.page >= doc.pages.count) continue;
      final page = doc.pages[placement.page];
      final g = page.graphics;
      final state = g.save();
      final visual = _enterVisualSpace(g, page);
      g.drawImage(bitmap, denormalizeRect(placement.rect, visual));
      g.restore(state);
    }
    return Uint8List.fromList(await doc.save());
  } finally {
    doc.dispose();
  }
}

// ── Organize ─────────────────────────────────────────────────────────────

class OrganizeJob {
  const OrganizeJob({required this.pdf, required this.sources, required this.turns});

  final Uint8List pdf;

  /// Original 0-based page index for each output page, in output order.
  final List<int> sources;

  /// Extra clockwise quarter turns for each output page.
  final List<int> turns;
}

Future<Uint8List> organizePdfBytes(OrganizeJob job) async {
  if (job.sources.isEmpty) throw ArgumentError('No pages left');
  if (isOrderPreserved(job.sources)) {
    // Only deletions/rotations: edit in place so links, bookmarks, forms
    // and annotations survive.
    final doc = sf.PdfDocument(inputBytes: job.pdf);
    try {
      final keep = job.sources.toSet();
      for (var i = doc.pages.count - 1; i >= 0; i--) {
        if (!keep.contains(i)) doc.pages.removeAt(i);
      }
      for (var k = 0; k < doc.pages.count; k++) {
        if (job.turns[k] == 0) continue;
        final page = doc.pages[k];
        page.rotation = _angle(page.rotation.index + job.turns[k]);
      }
      return Uint8List.fromList(await doc.save());
    } finally {
      doc.dispose();
    }
  }

  // Reordered: copy each page's content into a new document (one section
  // per page so every page keeps its own size, no margins).
  final source = sf.PdfDocument(inputBytes: job.pdf);
  final out = sf.PdfDocument();
  final finalTurns = <int>[];
  final Uint8List firstPass;
  try {
    for (var k = 0; k < job.sources.length; k++) {
      final src = source.pages[job.sources[k]];
      final size = src.size;
      final section = out.sections!.add();
      section.pageSettings = sf.PdfPageSettings(
        size,
        size.width > size.height
            ? sf.PdfPageOrientation.landscape
            : sf.PdfPageOrientation.portrait,
      )..margins.all = 0;
      final page = section.pages.add();
      page.graphics.drawPdfTemplate(src.createTemplate(), Offset.zero, size);
      finalTurns.add(normalizeTurns(src.rotation.index + job.turns[k]));
    }
    firstPass = Uint8List.fromList(await out.save());
  } finally {
    out.dispose();
    source.dispose();
  }
  if (finalTurns.every((t) => t == 0)) return firstPass;

  // New pages can only get a /Rotate once they are "loaded" pages, so
  // reopen the result and set it.
  final doc = sf.PdfDocument(inputBytes: firstPass);
  try {
    for (var k = 0; k < doc.pages.count && k < finalTurns.length; k++) {
      if (finalTurns[k] != 0) doc.pages[k].rotation = _angle(finalTurns[k]);
    }
    return Uint8List.fromList(await doc.save());
  } finally {
    doc.dispose();
  }
}

// ── Watermark / page numbers ─────────────────────────────────────────────

/// A piece of text to stamp: either drawn with a standard PDF font
/// ([text] + [fontSize]) or, for scripts the standard fonts can't show,
/// as a pre-rendered transparent PNG ([png], [sizePt] in points).
class TextStamp {
  const TextStamp.vector(String this.text, this.fontSize)
    : png = null,
      sizePt = null;

  const TextStamp.image(Uint8List this.png, Size this.sizePt)
    : text = null,
      fontSize = 0;

  final String? text;
  final double fontSize;
  final Uint8List? png;
  final Size? sizePt;
}

class StampJob {
  const StampJob.watermark({
    required this.pdf,
    required TextStamp this.watermark,
    required this.layout,
    required this.colorArgb,
    required this.opacity,
  }) : pageNumbers = null,
       position = PageNumberPosition.bottomCenter;

  const StampJob.pageNumbers({
    required this.pdf,
    required List<TextStamp> this.pageNumbers,
    required this.position,
    this.colorArgb = 0xFF333333,
  }) : watermark = null,
       layout = WatermarkLayout.center,
       opacity = 1;

  final Uint8List pdf;
  final TextStamp? watermark;
  final WatermarkLayout layout;
  final int colorArgb;
  final double opacity;
  final List<TextStamp>? pageNumbers;
  final PageNumberPosition position;
}

/// Margin (points) between page numbers and the page edge (~1 cm).
const double pageNumberMargin = 28;

/// Font size (points) used for page numbers.
const double pageNumberFontSize = 11;

Future<Uint8List> stampPdfBytes(StampJob job) async {
  final doc = sf.PdfDocument(inputBytes: job.pdf);
  try {
    final c = job.colorArgb;
    final color = sf.PdfColor((c >> 16) & 0xFF, (c >> 8) & 0xFF, c & 0xFF);
    final brush = sf.PdfSolidBrush(color);
    final font = sf.PdfStandardFont(
      sf.PdfFontFamily.helvetica,
      job.watermark?.fontSize ?? pageNumberFontSize,
      style: job.watermark == null ? sf.PdfFontStyle.regular : sf.PdfFontStyle.bold,
    );
    final images = <Uint8List, sf.PdfBitmap>{};
    sf.PdfBitmap bitmapFor(Uint8List png) =>
        images.putIfAbsent(png, () => sf.PdfBitmap(png));

    for (var i = 0; i < doc.pages.count; i++) {
      final page = doc.pages[i];
      final g = page.graphics;
      final state = g.save();
      final visual = _enterVisualSpace(g, page);
      final wm = job.watermark;
      if (wm != null) {
        if (wm.png == null) g.setTransparency(job.opacity.clamp(0.05, 1.0));
        _drawWatermark(g, visual, wm, job.layout, font, brush, bitmapFor);
      } else if (job.pageNumbers != null && i < job.pageNumbers!.length) {
        final stamp = job.pageNumbers![i];
        final size = _stampSize(stamp, font);
        final center = pageNumberCenter(visual, size, job.position);
        _drawStamp(g, stamp, center, size, font, brush, bitmapFor);
      }
      g.restore(state);
    }
    return Uint8List.fromList(await doc.save());
  } finally {
    doc.dispose();
  }
}

Size _stampSize(TextStamp s, sf.PdfFont font) {
  if (s.sizePt != null) return s.sizePt!;
  final m = font.measureString(s.text!);
  return Size(m.width + 1, m.height);
}

void _drawStamp(
  sf.PdfGraphics g,
  TextStamp s,
  Offset center,
  Size size,
  sf.PdfFont font,
  sf.PdfBrush brush,
  sf.PdfBitmap Function(Uint8List) bitmapFor,
) {
  final rect = Rect.fromCenter(center: center, width: size.width, height: size.height);
  if (s.png != null) {
    g.drawImage(bitmapFor(s.png!), rect);
  } else {
    g.drawString(
      s.text!,
      font,
      brush: brush,
      bounds: rect,
      format: sf.PdfStringFormat(
        alignment: sf.PdfTextAlignment.center,
        lineAlignment: sf.PdfVerticalAlignment.middle,
      ),
    );
  }
}

/// Centre of the page-number label on a page of [visual] size.
Offset pageNumberCenter(Size visual, Size label, PageNumberPosition position) {
  const m = pageNumberMargin;
  switch (position) {
    case PageNumberPosition.bottomCenter:
      return Offset(visual.width / 2, visual.height - m - label.height / 2);
    case PageNumberPosition.bottomRight:
      return Offset(visual.width - m - label.width / 2, visual.height - m - label.height / 2);
    case PageNumberPosition.topRight:
      return Offset(visual.width - m - label.width / 2, m + label.height / 2);
  }
}

void _drawWatermark(
  sf.PdfGraphics g,
  Size visual,
  TextStamp wm,
  WatermarkLayout layout,
  sf.PdfFont font,
  sf.PdfBrush brush,
  sf.PdfBitmap Function(Uint8List) bitmapFor,
) {
  final size = _stampSize(wm, font);
  final centre = Offset(visual.width / 2, visual.height / 2);
  switch (layout) {
    case WatermarkLayout.center:
      _drawStamp(g, wm, centre, size, font, brush, bitmapFor);
    case WatermarkLayout.diagonal:
      g.translateTransform(centre.dx, centre.dy);
      g.rotateTransform(-diagonalAngleDegrees(visual.width, visual.height));
      _drawStamp(g, wm, Offset.zero, size, font, brush, bitmapFor);
    case WatermarkLayout.tiled:
      g.translateTransform(centre.dx, centre.dy);
      g.rotateTransform(-tiledAngleDegrees);
      for (final c in tilePositions(visual, size)) {
        _drawStamp(g, wm, c, size, font, brush, bitmapFor);
      }
  }
}

/// Tilt of tiled watermarks (degrees, counter-clockwise).
const double tiledAngleDegrees = 30;

/// Centres (relative to the page centre, in the rotated frame) of tiled
/// copies of a stamp of [stamp] size, covering a page of [visual] size.
List<Offset> tilePositions(Size visual, Size stamp) {
  final half = math.sqrt(visual.width * visual.width + visual.height * visual.height) / 2;
  final stepX = math.max(stamp.width * 1.6, 60.0);
  final stepY = math.max(stamp.height * 3.5, 50.0);
  final nx = (half / stepX).ceil() + 1;
  final ny = (half / stepY).ceil() + 1;
  return [
    for (var row = -ny; row <= ny; row++)
      for (var col = -nx; col <= nx; col++)
        Offset(col * stepX + (row.isOdd ? stepX / 2 : 0), row * stepY),
  ];
}

// ── Text extraction (with progress) ──────────────────────────────────────

/// Progress events from [extractTextPages].
sealed class TextExtractEvent {
  const TextExtractEvent();
}

class TextExtractPage extends TextExtractEvent {
  const TextExtractPage(this.index, this.total, this.text);

  final int index;
  final int total;
  final String text;
}

class TextExtractDone extends TextExtractEvent {
  const TextExtractDone();
}

/// Extracts the text of every page in a background isolate, one event per
/// page. Cancelling the subscription kills the isolate.
Stream<TextExtractEvent> extractTextPages(Uint8List pdf) {
  late StreamController<TextExtractEvent> controller;
  Isolate? isolate;
  final port = ReceivePort();
  final errors = ReceivePort();

  void close() {
    port.close();
    errors.close();
    isolate?.kill(priority: Isolate.immediate);
    isolate = null;
  }

  controller = StreamController<TextExtractEvent>(
    onListen: () async {
      port.listen((msg) {
        if (msg is List && msg.length == 3) {
          controller.add(TextExtractPage(msg[0] as int, msg[1] as int, msg[2] as String));
        } else if (msg == 'done') {
          controller.add(const TextExtractDone());
          close();
          controller.close();
        } else if (msg is String) {
          controller.addError(msg);
          close();
          controller.close();
        }
      });
      errors.listen((e) {
        if (controller.isClosed) return;
        controller.addError(e is List && e.isNotEmpty ? '${e.first}' : '$e');
        close();
        controller.close();
      });
      try {
        isolate = await Isolate.spawn(
          _extractEntry,
          [port.sendPort, pdf],
          onError: errors.sendPort,
        );
        if (controller.isClosed) close();
      } catch (e) {
        controller.addError(e);
        close();
        await controller.close();
      }
    },
    onCancel: close,
  );
  return controller.stream;
}

void _extractEntry(List<Object> args) {
  final send = args[0] as SendPort;
  final bytes = args[1] as Uint8List;
  sf.PdfDocument? doc;
  try {
    doc = sf.PdfDocument(inputBytes: bytes);
    final extractor = sf.PdfTextExtractor(doc);
    final total = doc.pages.count;
    for (var i = 0; i < total; i++) {
      String text;
      try {
        text = extractor.extractText(startPageIndex: i, endPageIndex: i);
      } catch (_) {
        text = '';
      }
      send.send([i, total, text]);
    }
    send.send('done');
  } catch (e) {
    send.send(_isPasswordError(e) ? 'password' : 'error');
  } finally {
    doc?.dispose();
  }
}
