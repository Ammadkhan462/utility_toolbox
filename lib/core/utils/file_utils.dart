import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/services/notification_service.dart';

/// Outcome of [FileUtils.saveToDownloads].
enum SaveOutcome {
  /// Saved straight to the device's public Downloads folder.
  downloaded,

  /// Write failed; the share sheet was opened as a fallback.
  sharedFallback,
}

class FileUtils {
  FileUtils._();

  static const _downloadsChannel = MethodChannel('utility_toolbox/downloads');

  static Future<String> tempFilePath(String fileName) async {
    final dir = await getTemporaryDirectory();
    return '${dir.path}/$fileName';
  }

  /// Saves an existing file to the device's **public Downloads folder**.
  /// After a successful save it fires a local notification so the user
  /// can tap it to open the file directly.
  ///
  /// NOTE: this deliberately does NOT use `saver_gallery` (media-only,
  /// crashes on non-image MIME types) or `file_saver`'s `saveFile()`
  /// (silently writes to the app's *private* external-files dir, not the
  /// public Downloads folder, so nothing else — including a tap-to-open
  /// notification — can ever access the result). Instead this calls a
  /// small native MethodChannel (see MainActivity.kt) that does a real
  /// MediaStore.Downloads insert and hands back a content:// URI that any
  /// app can open.
  static Future<SaveOutcome> saveToDownloads({
    required String sourcePath,
    required String fileName,
    required String ext,
    String mimeType = 'application/pdf',
  }) async {
    final fullFileName = '$fileName.$ext';

    if (Platform.isAndroid) {
      try {
        final bytes = await File(sourcePath).readAsBytes();
        final contentUri = await _downloadsChannel.invokeMethod<String>(
          'saveToDownloads',
          {'fileName': fullFileName, 'bytes': bytes, 'mimeType': mimeType},
        );

        if (contentUri == null) {
          throw StateError('Native save returned no URI');
        }

        // Notification is a "nice to have" — never let a failure here
        // undo a save that already succeeded, or crash the app. Pass the
        // content:// URI (not the private sourcePath) so tapping the
        // notification can actually open the file in another app.
        try {
          await NotificationService.showDownloadComplete(
            fileName: fullFileName,
            savedPath: contentUri,
            mimeType: mimeType,
          );
        } catch (_) {
          // Save already succeeded — ignore notification errors.
        }
        return SaveOutcome.downloaded;
      } catch (_) {
        // Any error falls back gracefully to the share sheet.
      }

      await Share.shareXFiles([XFile(sourcePath)]);
      return SaveOutcome.sharedFallback;
    }

    // ── iOS ──────────────────────────────────────────────────────────────────
    try {
      final docsDir = await getApplicationDocumentsDirectory();
      final destPath = p.join(docsDir.path, fullFileName);
      await File(sourcePath).copy(destPath);
      await Share.shareXFiles([XFile(destPath)]);
      await NotificationService.showDownloadComplete(
        fileName: fullFileName,
        savedPath: destPath,
        mimeType: mimeType,
      );
      return SaveOutcome.downloaded;
    } catch (_) {
      await Share.shareXFiles([XFile(sourcePath)]);
      return SaveOutcome.sharedFallback;
    }
  }

  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  static Future<int> fileSizeBytes(String path) async {
    return File(path).length();
  }
}
