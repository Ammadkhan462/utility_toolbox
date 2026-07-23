import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileUtils {
  FileUtils._();

  static Future<String> tempFilePath(String fileName) async {
    final dir = await getTemporaryDirectory();
    return '${dir.path}/$fileName';
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
