/// Pure helpers for the Watermark & Page Numbers tool.
library;

import 'dart:math' as math;

enum WatermarkLayout { diagonal, center, tiled }

enum PageNumberStyle {
  /// "1"
  plain,

  /// "Page 1" (localised word)
  word,

  /// "1 / N"
  ofTotal,
}

enum PageNumberPosition { bottomCenter, bottomRight, topRight }

/// The label for the page at 0-based [index] of a [pageCount]-page file
/// whose first page is numbered [start]. [pageWord] turns a number into the
/// localised "Page 1" text.
String formatPageNumber(
  PageNumberStyle style, {
  required int index,
  required int pageCount,
  int start = 1,
  String Function(String number)? pageWord,
}) {
  final n = start + index;
  final last = start + pageCount - 1;
  switch (style) {
    case PageNumberStyle.plain:
      return '$n';
    case PageNumberStyle.word:
      return pageWord == null ? 'Page $n' : pageWord('$n');
    case PageNumberStyle.ofTotal:
      return '$n / $last';
  }
}

/// All labels for a document, ready to stamp.
List<String> pageNumberLabels(
  PageNumberStyle style, {
  required int pageCount,
  int start = 1,
  String Function(String number)? pageWord,
}) => [
  for (var i = 0; i < pageCount; i++)
    formatPageNumber(
      style,
      index: i,
      pageCount: pageCount,
      start: start,
      pageWord: pageWord,
    ),
];

/// True when every character can be drawn with the PDF standard fonts
/// (WinAnsi / Latin-1). Anything else — Arabic, Cyrillic, Devanagari,
/// Bengali, Turkish ğ/ş/ı, emoji — is rendered as an image instead so it is
/// always shaped correctly.
bool isStandardFontSafe(String text) {
  for (final c in text.runes) {
    final printableAscii = c >= 0x20 && c <= 0x7E;
    final latin1 = c >= 0xA0 && c <= 0xFF;
    if (!printableAscii && !latin1) return false;
  }
  return true;
}

/// Angle (degrees, counter-clockwise positive) of the bottom-left →
/// top-right diagonal for a page of the given visual size.
double diagonalAngleDegrees(double width, double height) {
  if (width <= 0 || height <= 0) return 45;
  return math.atan2(height, width) * 180 / math.pi;
}
