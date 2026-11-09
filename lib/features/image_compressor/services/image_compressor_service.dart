import 'dart:io';
import 'dart:isolate';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ImageCompressorService {
  /// Compress [source] to [quality]% (1-100). Optionally resize width.
  Future<File> compress({
    required File source,
    required int quality,
    int targetWidth = 0,
  }) async {
    final dir = await getTemporaryDirectory();
    final name = p.basenameWithoutExtension(source.path);
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final out = File('${dir.path}/${name}_${timestamp}_compressed.jpg');

    // Try native flutter_image_compress first
    try {
      final compressed = await (() async {
        if (targetWidth > 0) {
          return await FlutterImageCompress.compressAndGetFile(
            source.absolute.path,
            out.absolute.path,
            quality: quality.clamp(1, 100),
            minWidth: targetWidth,
            minHeight: targetWidth,
            format: CompressFormat.jpeg,
          );
        } else {
          return await FlutterImageCompress.compressAndGetFile(
            source.absolute.path,
            out.absolute.path,
            quality: quality.clamp(1, 100),
            format: CompressFormat.jpeg,
          );
        }
      })();

      // compressAndGetFile returns an XFile? (cross_file), not a dart:io File.
      if (compressed != null) {
        final file = File(compressed.path);
        if (await file.exists() && await file.length() > 0) {
          return file;
        }
      }
    } catch (_) {
      // Fallback to pure Dart image processing below
    }

    // Pure Dart image package fallback — guarantees compression succeeds across all platforms.
    // Decoding/encoding a 12 MP photo in pure Dart takes seconds, so it runs
    // on a background isolate instead of freezing the UI (ANR risk).
    await Isolate.run(
      _fallbackTask(source.path, out.path, quality.clamp(1, 100), targetWidth),
    );
    return out;
  }
}

// Top-level so the isolate closure captures only plain values.
Future<void> Function() _fallbackTask(
  String sourcePath,
  String outPath,
  int quality,
  int targetWidth,
) => () async {
  final bytes = await File(sourcePath).readAsBytes();
  final decoded = img.decodeImage(bytes);
  if (decoded == null) {
    throw Exception('Could not decode image for compression');
  }

  img.Image toEncode = decoded;
  if (targetWidth > 0 && decoded.width > targetWidth) {
    toEncode = img.copyResize(decoded, width: targetWidth);
  }

  final jpgBytes = img.encodeJpg(toEncode, quality: quality);
  await File(outPath).writeAsBytes(jpgBytes);
};
