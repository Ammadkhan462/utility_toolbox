import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/core/widgets/error_state.dart';
import 'package:utility_toolbox/core/widgets/loading_indicator.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/pdf_toolkit/models/pdf_job_result.dart';
import 'package:utility_toolbox/features/pdf_toolkit/providers/pdf_providers.dart';

class ImageToPdfScreen extends ConsumerWidget {
  const ImageToPdfScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(selectedImagesProvider);
    final jobState = ref.watch(pdfJobStateProvider);

    return ToolScaffold(
      title: 'Image to PDF',
      accentColor: AppColors.toolAccent('pdf_toolkit'),
      body: _buildBody(context, ref, images, jobState),
      bottomBar: jobState is! Success<PdfJobResult>
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: images.isEmpty || jobState is Loading<PdfJobResult>
                    ? null
                    : () => _createPdf(ref),
                child: const Text('Create PDF'),
              ),
            )
          : null,
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    List<File> images,
    Result<PdfJobResult> jobState,
  ) {
    return switch (jobState) {
      Loading() => const LoadingIndicator(message: 'Creating PDF…'),
      ErrorResult(message: final msg) => ErrorState(
        message: msg,
        onRetry: () =>
            ref.read(pdfJobStateProvider.notifier).state = const Idle(),
      ),
      Success(data: final result) => _ResultView(
        result: result,
        onShare: () => Share.shareXFiles([XFile(result.filePath)]),
        onDownload: () => _download(context, ref, result),
        onDone: () async {
          await ref.read(adsServiceProvider).showInterstitialIfAllowed();
          ref.read(pdfJobStateProvider.notifier).state = const Idle();
        },
      ),
      Idle() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PremiumOutlineButton(
              onPressed: () => _pickImages(ref),
              icon: Icons.photo_library_outlined,
              label: 'Pick images',
              accent: AppColors.toolAccent('pdf_toolkit'),
              dense: true,
            ),
            const SizedBox(height: 16),
            if (images.isEmpty)
              const Text('Select one or more images to convert.')
            else
              ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: images.length,
                onReorderItem: (oldIndex, newIndex) {
                  final list = [...ref.read(selectedImagesProvider)];
                  final item = list.removeAt(oldIndex);
                  list.insert(newIndex, item);
                  ref.read(selectedImagesProvider.notifier).state = list;
                },
                itemBuilder: (context, index) {
                  final file = images[index];
                  return ListTile(
                    key: ValueKey(file.path),
                    leading: const Icon(Icons.drag_handle),
                    title: Text(file.path.split(Platform.pathSeparator).last),
                  );
                },
              ),
          ],
        ),
      ),
    };
  }

  Future<void> _pickImages(WidgetRef ref) async {
    final picker = ImagePicker();
    final picked = await picker.pickMultiImage();
    if (picked.isEmpty) return;
    ref.read(selectedImagesProvider.notifier).state = [
      for (final item in picked) File(item.path),
    ];
  }

  Future<void> _createPdf(WidgetRef ref) async {
    ref.read(pdfJobStateProvider.notifier).state = const Loading();
    try {
      final paths = ref
          .read(selectedImagesProvider)
          .map((file) => file.path)
          .toList();
      final result = await ref.read(pdfServiceProvider).imagesToPdf(paths);
      ref.read(pdfJobStateProvider.notifier).state = Success(result);
    } catch (_) {
      ref.read(pdfJobStateProvider.notifier).state = const ErrorResult(
        'Could not create PDF. Please try different images.',
      );
    }
  }

  Future<void> _download(
    BuildContext context,
    WidgetRef ref,
    PdfJobResult result,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final outcome = await FileUtils.saveToDownloads(
        sourcePath: result.filePath,
        fileName: 'images_${DateTime.now().millisecondsSinceEpoch}',
        ext: 'pdf',
        mimeType: 'application/pdf',
      );
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            outcome == SaveOutcome.downloaded
                ? 'Saved to Downloads — check your notification to open it.'
                : 'Opened share sheet — choose where to save the file.',
          ),
        ),
      );
      ref.read(pdfJobStateProvider.notifier).state = const Idle();
      ref.read(selectedImagesProvider.notifier).state = [];
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('Download failed: $e')));
    }
  }
}

class _ResultView extends StatelessWidget {
  const _ResultView({
    required this.result,
    required this.onShare,
    required this.onDownload,
    required this.onDone,
  });

  final PdfJobResult result;
  final VoidCallback onShare;
  final VoidCallback onDownload;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('PDF ready (${result.pageCount} pages)'),
          Text('Size: ${FileUtils.formatFileSize(result.fileSizeBytes)}'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: PremiumOutlineButton(
                  onPressed: onShare,
                  icon: Icons.share_rounded,
                  label: 'Share',
                  accent: AppColors.toolAccent('pdf_toolkit'),
                  dense: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PremiumButton(
                  onPressed: onDownload,
                  icon: Icons.download_rounded,
                  label: 'Download',
                  accent: AppColors.toolAccent('pdf_toolkit'),
                  dense: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          PremiumOutlineButton(
            onPressed: onDone,
            label: 'Done',
            accent: AppColors.toolAccent('pdf_toolkit'),
          ),
        ],
      ),
    );
  }
}
