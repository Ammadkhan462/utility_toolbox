import 'dart:io';

import 'package:utility_toolbox/core/platform/system_bridge.dart';
import 'package:utility_toolbox/core/tools/tool_input.dart';

/// A launch request from outside the app, already normalised by
/// MainActivity.kt and parsed here into something the UI can act on.
sealed class IncomingIntent {
  const IncomingIntent();

  /// Parses the raw channel map. Returns null for anything unrecognised.
  static Future<IncomingIntent?> parse(RawIntent? raw) async {
    if (raw == null) return null;
    switch (raw['kind']) {
      case 'deeplink':
        final id = raw['toolId'];
        return id is String && id.isNotEmpty ? DeepLinkIntent(id) : null;
      case 'text':
        final text = (raw['text'] as String?)?.trim() ?? '';
        if (text.isEmpty) return null;
        return TextIntent(text, fromSelection: raw['source'] == 'process_text');
      case 'files':
        final paths = (raw['paths'] as List?)?.whereType<String>().toList() ?? [];
        if (paths.isEmpty) return null;
        final mime = (raw['mimeType'] as String?) ?? '';
        final kind = kindForMime(mime, paths.first);
        // A shared .txt file is just text.
        if (kind == InputKind.text) {
          final text = await _readSmallText(paths.first);
          return text == null ? const UnsupportedIntent() : TextIntent(text);
        }
        if (kind == null) return const UnsupportedIntent();
        return FilesIntent(kind: kind, paths: paths);
      case 'error':
        return FailedIntent(raw['message']?.toString() ?? '');
    }
    return null;
  }

  static InputKind? kindForMime(String mime, String path) {
    final m = mime.toLowerCase();
    final ext = path.toLowerCase().split('.').last;
    if (m.startsWith('image/') || const {'jpg', 'jpeg', 'png', 'webp', 'heic', 'bmp', 'gif'}.contains(ext)) {
      return InputKind.image;
    }
    if (m == 'application/pdf' || ext == 'pdf') return InputKind.pdf;
    if (m.contains('wordprocessingml') || ext == 'docx') return InputKind.docx;
    if (m.startsWith('video/') || const {'mp4', 'mkv', 'mov', 'webm', '3gp', 'avi'}.contains(ext)) {
      return InputKind.video;
    }
    if (m.startsWith('text/') || ext == 'txt') return InputKind.text;
    return null;
  }

  static Future<String?> _readSmallText(String path) async {
    try {
      final file = File(path);
      if (await file.length() > 200 * 1024) return null;
      final text = (await file.readAsString()).trim();
      return text.isEmpty ? null : text;
    } catch (_) {
      return null;
    }
  }
}

/// `utilitytoolbox://tool/<id>` from a launcher shortcut, pinned shortcut or
/// the Quick Settings tile.
class DeepLinkIntent extends IncomingIntent {
  const DeepLinkIntent(this.toolId);
  final String toolId;
}

class TextIntent extends IncomingIntent {
  const TextIntent(this.text, {this.fromSelection = false});
  final String text;

  /// True when it came from the text-selection "Translate" action, which
  /// should open the translator directly instead of asking.
  final bool fromSelection;
}

class FilesIntent extends IncomingIntent {
  const FilesIntent({required this.kind, required this.paths});
  final InputKind kind;
  final List<String> paths;
}

class UnsupportedIntent extends IncomingIntent {
  const UnsupportedIntent();
}

class FailedIntent extends IncomingIntent {
  const FailedIntent(this.message);
  final String message;
}
