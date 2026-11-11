import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

enum OcrLoadingStage { preparing, scanning }

/// Which loading label to show (the screen translates it).
final ocrLoadingStageProvider =
    StateProvider.autoDispose<OcrLoadingStage>((_) => OcrLoadingStage.preparing);

/// Remembers the OCR script choice across launches.
class OcrScriptPrefs {
  static const _key = 'ocr_script';

  /// Null when the user never picked one (the screen then suggests one
  /// from the app language).
  static Future<TextRecognitionScript?> load() async {
    try {
      final name = (await SharedPreferences.getInstance()).getString(_key);
      for (final s in TextRecognitionScript.values) {
        if (s.name == name) return s;
      }
    } catch (_) {}
    return null;
  }

  static Future<void> save(TextRecognitionScript script) async {
    try {
      await (await SharedPreferences.getInstance()).setString(_key, script.name);
    } catch (_) {}
  }
}
