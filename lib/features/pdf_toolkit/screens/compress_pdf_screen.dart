import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/core/widgets/error_state.dart';
import 'package:utility_toolbox/core/widgets/loading_indicator.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/pdf_toolkit/models/pdf_job_result.dart';
import 'package:utility_toolbox/features/pdf_toolkit/providers/pdf_providers.dart';
import 'package:utility_toolbox/features/pdf_toolkit/services/pdf_service.dart';

class CompressPdfScreen extends ConsumerWidget {
  const CompressPdfScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdf = ref.watch(selectedSinglePdfProvider);
    final level = ref.watch(pdfCompressionLevelProvider);
    final jobState = ref.watch(pdfJobStateProvider);
    final originalSize = pdf != null ? pdf.lengthSync() : 0;

    return ToolScaffold(
      title: 'Compress PDF',
      body: _buildBody(context, ref, pdf, level, jobState, originalSize),
      bottomBar: jobState is! Success<PdfJobResult>
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: pdf == null || jobState is Loading<PdfJobResult>
                    ? null
                    : () => _compress(ref, pdf.path),
                child: const Text('Compress'),
              ),
            )
          : null,
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    File? pdf,
    PdfCompressionLevel level,
    Result<PdfJobResult> jobState,
    int originalSize,
  ) {
    return switch (jobState) {
      Loading() => const LoadingIndicator(message: 'Compressing PDF…'),
      ErrorResult(message: final msg) => ErrorState(
          message: msg,
          onRetry: () =>
              ref.read(pdfJobStateProvider.notifier).state = const Idle(),
        ),
      Success(data: final result) => _CompressResultView(
          result: result,
          originalSize: originalSize,
          ref: ref,
        ),
      Idle() => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton.icon(
                onPressed: () => _pickPdf(ref),
                icon: const Icon(Icons.picture_as_pdf_outlined),
                label: const Text('Pick a PDF'),
              ),
              const SizedBox(height: 16),
              if (pdf != null)
                Text(
                  'Selected: ${pdf.path.split(Platform.pathSeparator).last}\n'
                  'Original size: ${FileUtils.formatFileSize(originalSize)}',
                )
              else
                const Text(
                  'Choose a PDF file. Compression works best on image-heavy documents.',
                ),
              const SizedBox(height: 16),
              SegmentedButton<PdfCompressionLevel>(
                segments: const [
                  ButtonSegment(value: PdfCompressionLevel.low, label: Text('Low')),
                  ButtonSegment(value: PdfCompressionLevel.medium, label: Text('Medium')),
                  ButtonSegment(value: PdfCompressionLevel.high, label: Text('High')),
                ],
                selected: {level},
                onSelectionChanged: (values) {
                  ref.read(pdfCompressionLevelProvider.notifier).state =
                      values.first;
                },
              ),
            ],
          ),
        ),
    };
  }

  Future<void> _pickPdf(WidgetRef ref) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result?.files.single.path == null) return;
    ref.read(selectedSinglePdfProvider.notifier).state =
        File(result!.files.single.path!);
  }

  Future<void> _compress(WidgetRef ref, String path) async {
    ref.read(pdfJobStateProvider.notifier).state = const Loading();
    try {
      final level = ref.read(pdfCompressionLevelProvider);
      final result =
          await ref.read(pdfServiceProvider).compressPdf(path, level);
      ref.read(pdfJobStateProvider.notifier).state = Success(result);
    } catch (_) {
      ref.read(pdfJobStateProvider.notifier).state = const ErrorResult(
        'Could not compress this PDF.',
      );
    }
  }
}

class _CompressResultView extends ConsumerWidget {
  const _CompressResultView({
    required this.result,
    required this.originalSize,
    required this.ref,
  });

  final PdfJobResult result;
  final int originalSize;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Before: ${FileUtils.formatFileSize(originalSize)}'),
          Text('After: ${FileUtils.formatFileSize(result.fileSizeBytes)}'),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => Share.shareXFiles([XFile(result.filePath)]),
            child: const Text('Share'),
          ),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: () async {
              await this.ref.read(adsServiceProvider).showInterstitialIfAllowed();
              this.ref.read(pdfJobStateProvider.notifier).state = const Idle();
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
