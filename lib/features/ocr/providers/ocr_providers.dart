import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/features/ocr/services/ocr_service.dart';

final ocrServiceProvider = Provider<OcrService>((ref) => OcrService());

final ocrImageProvider = StateProvider<File?>((ref) => null);

final ocrResultProvider =
    StateProvider<Result<String>>((ref) => const Idle());

final ocrTextProvider = StateProvider<String>((ref) => '');
