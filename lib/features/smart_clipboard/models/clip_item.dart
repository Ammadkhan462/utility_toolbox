// Plain Dart class — NO Hive annotations, NO part file.
// We store ClipItems as Map<String,dynamic> in a Hive Box<Map>,
// which needs zero code generation.

enum ClipType { text, url, email, phone, code }

class ClipItem {
  ClipItem({
    required this.id,
    required this.content,
    required this.typeStr,
    required this.savedAt,
    this.pinned = false,
    this.label  = '',
  });

  final String   id;
  final String   content;
  final String   typeStr;   // stored as plain string — avoids Hive enum issues
  final DateTime savedAt;
  bool   pinned;
  String label;

  ClipType get clipType => switch (typeStr) {
        'url'   => ClipType.url,
        'email' => ClipType.email,
        'phone' => ClipType.phone,
        'code'  => ClipType.code,
        _       => ClipType.text,
      };

  /// Auto-detect type from raw text.
  static String detectType(String text) {
    if (RegExp(r'^https?://', caseSensitive: false).hasMatch(text)) {
      return 'url';
    }
    if (RegExp(
      r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(text.trim())) {
      return 'email';
    }
    if (RegExp(r'^\+?[\d\s\-\(\)]{7,15}$').hasMatch(text.trim())) {
      return 'phone';
    }
    if (text.contains('\n') &&
        (text.contains('{')      ||
         text.contains('def ')   ||
         text.contains('import ') ||
         text.contains('class '))) {
      return 'code';
    }
    return 'text';
  }
}
