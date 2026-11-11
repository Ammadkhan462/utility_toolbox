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
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

class ImageToPdfScreen extends ConsumerWidget {
  const ImageToPdfScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(selectedImagesProvider);
    final jobState = ref.watch(pdfJobStateProvider);
    final l = AppLocalizations.of(context);

    return ToolScaffold(
      title: l.toolImageToPdfTitle,
      accentColor: AppColors.toolAccent('pdf_toolkit'),
      body: _buildBody(context, ref, images, jobState),
      bottomBar: jobState is! Success<PdfJobResult>
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: images.isEmpty || jobState is Loading<PdfJobResult>
                    ? null
                    : () => _createPdf(context, ref),
                child: Text(l.imageToPdfCreate),
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
    final l = AppLocalizations.of(context);
    return switch (jobState) {
      Loading() => LoadingIndicator(message: l.imageToPdfWorking),
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
          if (!context.mounted) return;
          ref.read(pdfJobStateProvider.notifier).state = const Idle();
        },
      ),
      Idle() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PremiumOutlineButton(
              onPressed: () => _pickImages(context, ref),
              icon: Icons.photo_library_outlined,
              label: l.imageToPdfPick,
              accent: AppColors.toolAccent('pdf_toolkit'),
              dense: true,
            ),
            const SizedBox(height: 16),
            if (images.isEmpty)
              Text(l.imageToPdfIntro)
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
                    leading: Icon(
                      Icons.drag_handle,
                      semanticLabel: l.pdfToolsDragToReorder,
                    ),
                    title: Text(
                      file.path.split(Platform.pathSeparator).last,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    };
  }

  Future<void> _pickImages(BuildContext context, WidgetRef ref) async {
    final List<XFile> picked;
    try {
      // Re-encoding to a page-sized JPEG keeps each page ~0.5 MB instead of a
      // full 12 MP original (the PDF holds every image in memory while it is
      // built, which ran low-end phones out of memory), and turns HEIC
      // photos into JPEGs the PDF encoder can read.
      picked = await ImagePicker().pickMultiImage(
        maxWidth: 2480,
        maxHeight: 2480,
        imageQuality: 85,
      );
    } catch (e) {
      debugPrint('Image picker failed: $e');
      return;
    }
    if (picked.isEmpty || !context.mounted) return;
    ref.read(selectedImagesProvider.notifier).state = [
      for (final item in picked) File(item.path),
    ];
  }

  Future<void> _createPdf(BuildContext context, WidgetRef ref) async {
    final l = AppLocalizations.of(context);
    ref.read(pdfJobStateProvider.notifier).state = const Loading();
    try {
      final paths = ref
          .read(selectedImagesProvider)
          .map((file) => file.path)
          .toList();
      final result = await ref.read(pdfServiceProvider).imagesToPdf(paths);
      // The user may have left while converting; ref is unusable then.
      if (!context.mounted) return;
      ref.read(pdfJobStateProvider.notifier).state = Success(result);
    } catch (_) {
      if (!context.mounted) return;
      ref.read(pdfJobStateProvider.notifier).state = ErrorResult(
        l.imageToPdfFailed,
      );
    }
  }

  Future<void> _download(
    BuildContext context,
    WidgetRef ref,
    PdfJobResult result,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final l = AppLocalizations.of(context);
    try {
      final outcome = await FileUtils.saveToDownloads(
        sourcePath: result.filePath,
        fileName: 'images_${DateTime.now().millisecondsSinceEpoch}',
        ext: 'pdf',
        mimeType: 'application/pdf',
        toolId: 'image_to_pdf',
      );
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            outcome == SaveOutcome.downloaded
                ? l.pdfToolsSavedNotification
                : l.pdfToolsShareToSave,
          ),
        ),
      );
      if (!context.mounted) return;
      ref.read(pdfJobStateProvider.notifier).state = const Idle();
      ref.read(selectedImagesProvider.notifier).state = [];
    } catch (e) {
      debugPrint('Saving image PDF failed: $e');
      messenger.showSnackBar(SnackBar(content: Text(l.commonSaveFailed)));
    }
  }
}

class _ResultView extends StatefulWidget {
  const _ResultView({
    required this.result,
    required this.onShare,
    required this.onDownload,
    required this.onDone,
  });

  final PdfJobResult result;
  final VoidCallback onShare;
  final Future<void> Function() onDownload;
  final VoidCallback onDone;

  @override
  State<_ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<_ResultView> {
  bool _saving = false;

  // Disabled while saving so a double tap can't save the PDF twice.
  Future<void> _download() async {
    setState(() => _saving = true);
    try {
      await widget.onDownload();
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final result = widget.result;
    final l = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l.imageToPdfReady(result.pageCount)),
          Text(l.pdfToolsSize(FileUtils.formatFileSize(result.fileSizeBytes))),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: PremiumOutlineButton(
                  onPressed: widget.onShare,
                  icon: Icons.share_rounded,
                  label: l.commonShare,
                  accent: AppColors.toolAccent('pdf_toolkit'),
                  dense: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PremiumButton(
                  onPressed: _saving ? null : _download,
                  icon: Icons.download_rounded,
                  label: l.pdfToolsDownload,
                  accent: AppColors.toolAccent('pdf_toolkit'),
                  dense: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          PremiumOutlineButton(
            onPressed: widget.onDone,
            label: l.commonDone,
            accent: AppColors.toolAccent('pdf_toolkit'),
          ),
        ],
      ),
    );
  }
}
