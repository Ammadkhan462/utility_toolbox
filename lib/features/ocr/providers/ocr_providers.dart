import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/features/ocr/services/ocr_service.dart';

export 'package:utility_toolbox/features/ocr/services/ocr_service.dart'
    show OcrResult, OcrBlock, OcrLine;

final ocrServiceProvider = Provider<OcrService>((ref) => OcrService());

final ocrImageProvider = StateProvider<File?>((ref) => null);

final ocrResultProvider =
    StateProvider<Result<String>>((ref) => const Idle());

final ocrTextProvider = StateProvider<String>((ref) => '');

/// Full structured result (blocks + lines + normalised rects).
final ocrDetailedResultProvider = StateProvider<OcrResult?>((_) => null);

/// Index of the currently highlighted block (-1 = none).
final ocrHighlightedBlockProvider = StateProvider<int>((_) => -1);

/// Human-readable label shown during the loading phase.
final ocrLoadingMessageProvider = StateProvider<String>((_) => 'Preparing image…');
