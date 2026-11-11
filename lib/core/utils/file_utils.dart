import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/files/output_record.dart';
import 'package:utility_toolbox/core/services/notification_service.dart';

/// Outcome of [FileUtils.saveToDownloads].
enum SaveOutcome {
  /// Saved straight to the device's public Downloads folder (or gallery).
  downloaded,

  /// Write failed; the share sheet was opened as a fallback.
  sharedFallback,
}

class FileUtils {
  FileUtils._();

  static const _downloadsChannel = MethodChannel('utility_toolbox/downloads');

  /// Set once in main(): adds every saved file to My Files (and counts it as
  /// a successful job for the review prompt). Kept as a hook so these static
  /// helpers stay usable from any screen without a WidgetRef.
  static Future<void> Function(OutputRecord record)? onSaved;

  static Future<String> tempFilePath(String fileName) async {
    final dir = await getTemporaryDirectory();
    return '${dir.path}/$fileName';
  }

  /// Saves an existing file to the device's **public Downloads folder** and
  /// records it in My Files. After a successful save a local notification
  /// lets the user tap to open the file directly.
  ///
  /// Uses a native MediaStore insert (see MainActivity.kt) because
  /// `file_saver` only writes to the app's private dir and `saver_gallery`
  /// is media-only.
  static Future<SaveOutcome> saveToDownloads({
    required String sourcePath,
    required String fileName,
    required String ext,
    String mimeType = 'application/pdf',
    String toolId = 'unknown',
  }) async {
    final fullFileName = '$fileName.$ext';

    if (Platform.isAndroid) {
      try {
        // Native side stream-copies the file: no full read into Dart memory,
        // so large videos and PDFs save without running out of memory.
        final size = await File(sourcePath).length();
        final contentUri = await _downloadsChannel.invokeMethod<String>(
          'saveToDownloads',
          {'fileName': fullFileName, 'sourcePath': sourcePath, 'mimeType': mimeType},
        );

        if (contentUri == null) {
          throw StateError('Native save returned no URI');
        }

        await _record(
          name: fullFileName,
          location: contentUri,
          mimeType: mimeType,
          toolId: toolId,
          sizeBytes: size,
        );

        // Notification is a "nice to have" — never let a failure here undo
        // a save that already succeeded.
        try {
          await NotificationService.showDownloadComplete(
            fileName: fullFileName,
            savedPath: contentUri,
            mimeType: mimeType,
          );
        } catch (_) {}
        return SaveOutcome.downloaded;
      } catch (e) {
        debugPrint('saveToDownloads failed, falling back to share: $e');
      }

      await Share.shareXFiles([XFile(sourcePath)]);
      return SaveOutcome.sharedFallback;
    }

    // ── iOS ──────────────────────────────────────────────────────────────
    try {
      final docsDir = await getApplicationDocumentsDirectory();
      final destPath = p.join(docsDir.path, fullFileName);
      await File(sourcePath).copy(destPath);
      await _record(
        name: fullFileName,
        location: destPath,
        mimeType: mimeType,
        toolId: toolId,
        sizeBytes: await File(destPath).length(),
      );
      await Share.shareXFiles([XFile(destPath)]);
      return SaveOutcome.downloaded;
    } catch (_) {
      await Share.shareXFiles([XFile(sourcePath)]);
      return SaveOutcome.sharedFallback;
    }
  }

  /// Saves image bytes to the gallery (Pictures/Utility Toolbox) and records
  /// them in My Files. Returns true on success.
  ///
  /// Android: native MediaStore insert, returns a content:// URI that My
  /// Files can open/share later. Fallback (old Android without storage
  /// permission yet, iOS): `gal`, which handles the permission prompt, plus
  /// a private copy so My Files can still open it.
  static Future<bool> saveImageToGallery({
    required Uint8List bytes,
    required String fileName,
    String mimeType = 'image/jpeg',
    String toolId = 'unknown',
  }) async {
    // Native first. On Android 7–9 this throws until storage permission has
    // been granted, and the gal path below asks for it.
    if (Platform.isAndroid) {
      try {
        final uri = await _downloadsChannel.invokeMethod<String>(
          'saveToGallery',
          {'fileName': fileName, 'bytes': bytes, 'mimeType': mimeType},
        );
        if (uri != null) {
          await _record(
            name: fileName,
            location: uri,
            mimeType: mimeType,
            toolId: toolId,
            sizeBytes: bytes.length,
          );
          return true;
        }
      } catch (e) {
        debugPrint('Native gallery save failed, trying gal: $e');
      }
    }

    try {
      if (!await Gal.hasAccess(toAlbum: true)) {
        if (!await Gal.requestAccess(toAlbum: true)) return false;
      }
      await Gal.putImageBytes(bytes, album: 'Utility Toolbox', name: p.basenameWithoutExtension(fileName));
      final copy = await _privateCopy(bytes, fileName);
      await _record(
        name: fileName,
        location: copy.path,
        mimeType: mimeType,
        toolId: toolId,
        sizeBytes: bytes.length,
      );
      return true;
    } catch (e) {
      debugPrint('Gallery save failed: $e');
      return false;
    }
  }

  static Future<File> _privateCopy(Uint8List bytes, String fileName) async {
    final dir = Directory(
      p.join((await getApplicationDocumentsDirectory()).path, 'app_outputs'),
    );
    await dir.create(recursive: true);
    final file = File(
      p.join(dir.path, '${DateTime.now().millisecondsSinceEpoch}_$fileName'),
    );
    return file.writeAsBytes(bytes);
  }

  static Future<void> _record({
    required String name,
    required String location,
    required String mimeType,
    required String toolId,
    int? sizeBytes,
  }) async {
    final hook = onSaved;
    if (hook == null) return;
    try {
      await hook(
        OutputRecord(
          id: '${DateTime.now().microsecondsSinceEpoch}',
          name: name,
          location: location,
          mimeType: mimeType,
          toolId: toolId,
          createdAt: DateTime.now(),
          sizeBytes: sizeBytes,
        ),
      );
    } catch (e) {
      debugPrint('Recording output failed: $e');
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
