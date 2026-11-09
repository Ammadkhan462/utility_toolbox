import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/features/pdf_toolkit/models/pdf_job_result.dart';
import 'package:utility_toolbox/features/pdf_toolkit/services/pdf_service.dart';

final pdfServiceProvider = Provider<PdfService>((ref) => PdfService());

final selectedImagesProvider = StateProvider.autoDispose<List<File>>((ref) => []);

final selectedPdfsProvider = StateProvider.autoDispose<List<File>>((ref) => []);

final pdfCompressionLevelProvider =
    StateProvider.autoDispose<PdfCompressionLevel>((ref) => PdfCompressionLevel.medium);

final pdfJobStateProvider =
    StateProvider.autoDispose<Result<PdfJobResult>>((ref) => const Idle());

final selectedSinglePdfProvider = StateProvider.autoDispose<File?>((ref) => null);
