import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:utility_toolbox/features/pdf_edit/logic/stamp_logic.dart';
import 'package:utility_toolbox/features/pdf_edit/services/pdf_edit_engine.dart';

/// Turns text into a [TextStamp]. Latin text stays real (vector,
/// searchable) PDF text; any other script is drawn by Flutter's text engine
/// into a transparent PNG so Arabic, Urdu, Hindi, Bengali, Cyrillic, etc.
/// are always shaped correctly — the PDF standard fonts can't show them.
///
/// Runs on the UI isolate (dart:ui), so callers should keep it to a handful
/// of short strings per frame.
Future<TextStamp> buildTextStamp(
  String text, {
  required double fontSizePt,
  required Color color,
  bool bold = true,
  double opacity = 1,
  TextDirection? direction,
}) async {
  if (isStandardFontSafe(text)) return TextStamp.vector(text, fontSizePt);

  // Render at ~4 px per point (≈ 288 dpi) but keep images a sane size.
  final probe = _painter(text, fontSizePt, color, bold, direction)..layout();
  final scale = math.min(4.0, 3000 / math.max(probe.width, 1));
  probe.dispose();

  final painter = _painter(
    text,
    fontSizePt * scale,
    color.withValues(alpha: color.a * opacity.clamp(0.05, 1.0)),
    bold,
    direction,
  )..layout();
  final w = painter.width.ceil().clamp(1, 4096);
  final h = painter.height.ceil().clamp(1, 4096);
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  painter.paint(canvas, Offset.zero);
  final picture = recorder.endRecording();
  final image = await picture.toImage(w, h);
  picture.dispose();
  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
  painter.dispose();
  return TextStamp.image(
    data!.buffer.asUint8List(),
    Size(w / scale, h / scale),
  );
}

TextPainter _painter(
  String text,
  double size,
  Color color,
  bool bold,
  TextDirection? direction,
) => TextPainter(
  text: TextSpan(
    text: text,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
      height: 1.15,
    ),
  ),
  textDirection: direction ?? _guessDirection(text),
  maxLines: 1,
);

TextDirection _guessDirection(String text) {
  for (final c in text.runes) {
    // Hebrew, Arabic, Syriac, Thaana, NKo, Arabic presentation forms.
    if ((c >= 0x0590 && c <= 0x08FF) || (c >= 0xFB1D && c <= 0xFDFF) || (c >= 0xFE70 && c <= 0xFEFF)) {
      return TextDirection.rtl;
    }
  }
  return TextDirection.ltr;
}
