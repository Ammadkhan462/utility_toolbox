import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/utils/result.dart';

/// Compress by a quality slider, or to fit under a file-size limit.
enum CompressMode { quality, targetSize }

/// Target sizes offered in [CompressMode.targetSize], in kilobytes.
/// Decimal (1 KB = 1000 bytes) so the result also fits forms that count
/// 1 KB as 1024 bytes.
const kCompressTargetsKb = [100, 200, 500, 1000];

final selectedImageProvider = StateProvider.autoDispose<File?>((ref) => null);
final qualityProvider = StateProvider.autoDispose<double>((ref) => 80);
final compressModeProvider =
    StateProvider.autoDispose<CompressMode>((ref) => CompressMode.quality);
final targetKbProvider = StateProvider.autoDispose<int>((ref) => 200);
final compressionResultProvider = StateProvider.autoDispose<Result<CompressResult>>(
  (ref) => const Idle(),
);

class CompressResult {
  const CompressResult({
    required this.originalBytes,
    required this.compressedBytes,
    required this.compressedFile,
    this.targetKb,
    this.missedTarget = false,
  });

  final int originalBytes;
  final int compressedBytes;
  final File compressedFile;

  /// Set when the photo was compressed to a target size.
  final int? targetKb;

  /// The target couldn't be reached; the result is the smallest we made.
  final bool missedTarget;

  double get savedPercent {
    if (originalBytes <= 0) return 0.0;
    final diff = originalBytes - compressedBytes;
    if (diff <= 0) return 0.0;
    return (diff / originalBytes) * 100.0;
  }
}
