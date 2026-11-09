import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/utils/result.dart';

final selectedImageProvider = StateProvider.autoDispose<File?>((ref) => null);
final qualityProvider = StateProvider.autoDispose<double>((ref) => 80);
final compressionResultProvider = StateProvider.autoDispose<Result<CompressResult>>(
  (ref) => const Idle(),
);

class CompressResult {
  const CompressResult({
    required this.originalBytes,
    required this.compressedBytes,
    required this.compressedFile,
  });

  final int originalBytes;
  final int compressedBytes;
  final File compressedFile;

  double get savedPercent {
    if (originalBytes <= 0) return 0.0;
    final diff = originalBytes - compressedBytes;
    if (diff <= 0) return 0.0;
    return (diff / originalBytes) * 100.0;
  }
}
