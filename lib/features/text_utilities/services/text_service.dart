import 'dart:convert';

import 'package:flutter/widgets.dart' show StringCharacters;

class TextService {
  int wordCount(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return 0;
    return trimmed.split(RegExp(r'\s+')).length;
  }

  /// Counts user-perceived characters (grapheme clusters), so an emoji such
  /// as 👍🏽 or 👨‍👩‍👧 counts as 1 rather than its 2–8 UTF-16 code units.
  int characterCount(String text, {required bool includeSpaces}) {
    if (includeSpaces) return text.characters.length;
    return text.replaceAll(RegExp(r'\s'), '').characters.length;
  }

  String toUpperCase(String text) => text.toUpperCase();

  String toLowerCase(String text) => text.toLowerCase();

  /// Capitalises every word — including words after a newline or tab, not
  /// just after a plain space.
  String toTitleCase(String text) {
    if (text.isEmpty) return text;
    return text.replaceAllMapped(
      RegExp(r'(\S)(\S*)'),
      (m) => '${m[1]!.toUpperCase()}${m[2]!.toLowerCase()}',
    );
  }

  /// Lower-cases the text and capitalises the first letter of each sentence
  /// (start of text, after . ! ? or a line break), skipping leading spaces.
  String toSentenceCase(String text) {
    if (text.isEmpty) return text;
    return text.toLowerCase().replaceAllMapped(
      RegExp(r'(^\s*|[.!?]\s+|[\r\n]\s*)(\S)'),
      (m) => '${m[1]}${m[2]!.toUpperCase()}',
    );
  }

  String encodeBase64(String text) => base64Encode(utf8.encode(text));

  /// Accepts line-wrapped (MIME), URL-safe and unpadded Base64 too.
  String? decodeBase64(String text) {
    try {
      final compact = text.replaceAll(RegExp(r'\s'), '');
      return utf8.decode(base64Decode(base64.normalize(compact)));
    } catch (_) {
      return null;
    }
  }
}
