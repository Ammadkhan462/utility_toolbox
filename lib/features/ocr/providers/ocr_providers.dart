import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/features/ocr/services/ocr_service.dart';

export 'package:utility_toolbox/features/ocr/services/ocr_service.dart'
    show OcrResult, OcrBlock, OcrLine;

final ocrServiceProvider = Provider<OcrService>((ref) => OcrService());

final ocrImageProvider = StateProvider.autoDispose<File?>((ref) => null);

final ocrResultProvider =
    StateProvider.autoDispose<Result<String>>((ref) => const Idle());

final ocrTextProvider = StateProvider.autoDispose<String>((ref) => '');

/// Full structured result (blocks + lines + normalised rects).
final ocrDetailedResultProvider = StateProvider.autoDispose<OcrResult?>((_) => null);

/// Index of the currently highlighted block (-1 = none).
final ocrHighlightedBlockProvider = StateProvider.autoDispose<int>((_) => -1);

/// Human-readable label shown during the loading phase.
final ocrLoadingMessageProvider = StateProvider.autoDispose<String>((_) => 'Preparing image…');
