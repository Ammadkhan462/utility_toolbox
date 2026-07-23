import 'dart:convert';

class TextService {
  int wordCount(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return 0;
    return trimmed.split(RegExp(r'\s+')).length;
  }

  int characterCount(String text, {required bool includeSpaces}) {
    if (includeSpaces) return text.length;
    return text.replaceAll(RegExp(r'\s'), '').length;
  }

  String toUpperCase(String text) => text.toUpperCase();

  String toLowerCase(String text) => text.toLowerCase();

  String toTitleCase(String text) {
    if (text.isEmpty) return text;
    return text
        .split(' ')
        .map(
          (word) => word.isEmpty
              ? word
              : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  String encodeBase64(String text) => base64Encode(utf8.encode(text));

  String? decodeBase64(String text) {
    try {
      return utf8.decode(base64Decode(text.trim()));
    } catch (_) {
      return null;
    }
  }
}
