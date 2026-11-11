import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

/// Output of [ImageCompressorService.compressToTarget].
class TargetCompressOutput {
  const TargetCompressOutput(this.file, {required this.fits});
  final File file;

  /// False when even the smallest attempt stayed above the target; [file]
  /// is then the smallest version we could make.
  final bool fits;
}

/// Short-side sizes tried (largest first) when a photo can't reach the
/// target size at a decent quality. `null` = the native default size.
const _targetShortSides = <int?>[null, 1080, 900, 720, 600, 480, 360, 240];

/// Below this JPEG quality we would rather shrink the photo than keep
/// lowering quality (blocky artefacts look worse than fewer pixels).
const _minGoodQuality = 40;
const _maxTargetQuality = 92;

/// Highest quality in [minQ]..[maxQ] whose output fits [maxBytes], found by
/// binary search over [encode]. Returns null when even [minQ] is too big.
Future<Uint8List?> searchQualityForTarget(
  Future<Uint8List?> Function(int quality) encode,
  int maxBytes, {
  int minQ = _minGoodQuality,
  int maxQ = _maxTargetQuality,
}) async {
  Uint8List? best;
  var lo = minQ, hi = maxQ;
  while (lo <= hi) {
    final mid = (lo + hi) ~/ 2;
    final out = await encode(mid);
    if (out != null && out.isNotEmpty && out.length <= maxBytes) {
      best = out;
      lo = mid + 1;
    } else {
      hi = mid - 1;
    }
  }
  return best;
}

class ImageCompressorService {
  Future<File> _newOutFile(File source) async {
    final dir = await getTemporaryDirectory();
    final name = p.basenameWithoutExtension(source.path);
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return File('${dir.path}/${name}_${timestamp}_compressed.jpg');
  }

  /// Compress [source] to [quality]% (1-100). Optionally resize width.
  Future<File> compress({
    required File source,
    required int quality,
    int targetWidth = 0,
  }) async {
    final out = await _newOutFile(source);

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

  /// Makes a JPEG no bigger than [maxBytes] (for form uploads with a size
  /// limit): keeps the highest quality that fits, and only shrinks the
  /// photo when quality alone can't get there.
  Future<TargetCompressOutput> compressToTarget({
    required File source,
    required int maxBytes,
  }) async {
    final out = await _newOutFile(source);
    Uint8List? best;
    var fits = false;
    try {
      Uint8List? smallest;
      for (var i = 0; i < _targetShortSides.length; i++) {
        final side = _targetShortSides[i];
        final last = i == _targetShortSides.length - 1;
        // Decode + resize the original once per size, then re-encode the
        // (much smaller) result for each quality step.
        final base = side == null
            ? await FlutterImageCompress.compressWithFile(
                source.absolute.path,
                quality: 95,
                format: CompressFormat.jpeg,
              )
            : await FlutterImageCompress.compressWithFile(
                source.absolute.path,
                quality: 95,
                minWidth: side,
                minHeight: side,
                format: CompressFormat.jpeg,
              );
        if (base == null || base.isEmpty) {
          throw StateError('native encode failed');
        }
        Future<Uint8List?> encode(int q) =>
            FlutterImageCompress.compressWithList(
              base,
              quality: q,
              // A huge floor means "never scale": base is already sized.
              minWidth: 1 << 14,
              minHeight: 1 << 14,
              format: CompressFormat.jpeg,
            );
        best = await searchQualityForTarget(
          encode,
          maxBytes,
          minQ: last ? 10 : _minGoodQuality,
        );
        if (best != null) {
          fits = true;
          break;
        }
        if (last) smallest = await encode(10);
      }
      best ??= smallest;
    } catch (_) {
      best = null; // native codec unavailable: pure Dart below
    }

    if (best != null && best.isNotEmpty) {
      await out.writeAsBytes(best);
      return TargetCompressOutput(out, fits: fits);
    }
    final dartFits = await Isolate.run(
      _targetFallbackTask(source.path, out.path, maxBytes),
    );
    return TargetCompressOutput(out, fits: dartFits);
  }
}

/// Decodes [path] and applies what a JPEG without EXIF needs: the rotation
/// baked into the pixels and transparency flattened onto white.
img.Image _decodeForJpeg(String path) {
  final bytes = File(path).readAsBytesSync();
  final decoded = img.decodeImage(bytes, frame: 0);
  if (decoded == null) {
    throw Exception('Could not decode image for compression');
  }

  // The JPEG we write carries no EXIF, so apply the rotation to the pixels
  // (otherwise portrait photos come out sideways). Only when needed:
  // bakeOrientation always copies the whole bitmap.
  final ifd = decoded.exif.imageIfd;
  img.Image toEncode = (ifd.hasOrientation && ifd.orientation != 1)
      ? img.bakeOrientation(decoded)
      : decoded;
  // JPEG has no alpha: flatten transparent PNG/WEBP onto white, not black.
  if (toEncode.hasAlpha) {
    final flat = img.Image(width: toEncode.width, height: toEncode.height)
      ..clear(img.ColorRgb8(255, 255, 255));
    toEncode = img.compositeImage(flat, toEncode);
  }
  return toEncode;
}

// Top-level so the isolate closure captures only plain values.
Future<void> Function() _fallbackTask(
  String sourcePath,
  String outPath,
  int quality,
  int targetWidth,
) => () async {
  var toEncode = _decodeForJpeg(sourcePath);
  if (targetWidth > 0 && toEncode.width > targetWidth) {
    toEncode = img.copyResize(toEncode, width: targetWidth);
  }

  final jpgBytes = img.encodeJpg(toEncode, quality: quality);
  await File(outPath).writeAsBytes(jpgBytes);
};

/// Pure-Dart version of [ImageCompressorService.compressToTarget]. Returns
/// whether the written file fits [maxBytes].
Future<bool> Function() _targetFallbackTask(
  String sourcePath,
  String outPath,
  int maxBytes,
) => () async {
  final original = _decodeForJpeg(sourcePath);
  final portrait = original.width < original.height;
  final shortSide = portrait ? original.width : original.height;
  Uint8List? smallest;
  for (var i = 0; i < _targetShortSides.length; i++) {
    final side = _targetShortSides[i] ?? 1080;
    final last = i == _targetShortSides.length - 1;
    final sized = shortSide <= side
        ? original
        : portrait
        ? img.copyResize(original, width: side)
        : img.copyResize(original, height: side);
    Future<Uint8List?> encode(int q) async => img.encodeJpg(sized, quality: q);
    final best = await searchQualityForTarget(
      encode,
      maxBytes,
      minQ: last ? 10 : _minGoodQuality,
    );
    if (best != null) {
      await File(outPath).writeAsBytes(best);
      return true;
    }
    if (last) smallest = await encode(10);
  }
  await File(outPath).writeAsBytes(smallest!);
  return false;
};
