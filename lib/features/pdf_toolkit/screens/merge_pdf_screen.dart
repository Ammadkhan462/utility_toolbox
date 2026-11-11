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
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/pdf_toolkit/models/pdf_job_result.dart';
import 'package:utility_toolbox/features/pdf_toolkit/providers/pdf_providers.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

class MergePdfScreen extends ConsumerWidget {
  const MergePdfScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfs = ref.watch(selectedPdfsProvider);
    final jobState = ref.watch(pdfJobStateProvider);
    final l = AppLocalizations.of(context);

    return ToolScaffold(
      title: l.toolMergePdfTitle,
      accentColor: AppColors.toolAccent('pdf_toolkit'),
      body: _buildBody(context, ref, pdfs, jobState),
      bottomBar: jobState is! Success<PdfJobResult>
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: pdfs.length < 2 || jobState is Loading<PdfJobResult>
                    ? null
                    : () => _merge(context, ref),
                child: Text(l.pdfMergeButton),
              ),
            )
          : null,
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    List<File> pdfs,
    Result<PdfJobResult> jobState,
  ) {
    final l = AppLocalizations.of(context);
    return switch (jobState) {
      Loading() => LoadingIndicator(message: l.pdfMergeWorking),
      ErrorResult(message: final msg) => ErrorState(
        message: msg,
        onRetry: () =>
            ref.read(pdfJobStateProvider.notifier).state = const Idle(),
      ),
      Success(data: final result) => _MergeResultView(result: result, ref: ref),
      Idle() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PremiumOutlineButton(
              onPressed: () => _pickPdfs(context, ref),
              icon: Icons.upload_file,
              label: l.pdfMergePick,
              accent: AppColors.toolAccent('pdf_toolkit'),
              dense: true,
            ),
            const SizedBox(height: 16),
            if (pdfs.isEmpty)
              Text(l.pdfMergeIntro)
            else
              ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pdfs.length,
                onReorderItem: (oldIndex, newIndex) {
                  final list = [...ref.read(selectedPdfsProvider)];
                  final item = list.removeAt(oldIndex);
                  list.insert(newIndex, item);
                  ref.read(selectedPdfsProvider.notifier).state = list;
                },
                itemBuilder: (context, index) {
                  final file = pdfs[index];
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

  Future<void> _pickPdfs(BuildContext context, WidgetRef ref) async {
    final FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: true,
      );
    } catch (e) {
      debugPrint('PDF picker failed: $e');
      return;
    }
    if (result == null || !context.mounted) return;

    final existing = ref.read(selectedPdfsProvider);
    final existingPaths = existing.map((f) => f.path).toSet();
    final newFiles = [
      for (final file in result.files)
        if (file.path != null && existingPaths.add(file.path!))
          File(file.path!),
    ];
    ref.read(selectedPdfsProvider.notifier).state = [...existing, ...newFiles];
  }

  Future<void> _merge(BuildContext context, WidgetRef ref) async {
    final l = AppLocalizations.of(context);
    ref.read(pdfJobStateProvider.notifier).state = const Loading();
    try {
      final paths = ref.read(selectedPdfsProvider).map((f) => f.path).toList();
      final result = await ref.read(pdfServiceProvider).mergePdfs(paths);
      // The user may have left while merging; ref is unusable then.
      if (!context.mounted) return;
      ref.read(pdfJobStateProvider.notifier).state = Success(result);
    } catch (_) {
      if (!context.mounted) return;
      ref.read(pdfJobStateProvider.notifier).state = ErrorResult(
        l.pdfMergeFailed,
      );
    }
  }
}

class _MergeResultView extends StatefulWidget {
  const _MergeResultView({required this.result, required this.ref});

  final PdfJobResult result;
  final WidgetRef ref;

  @override
  State<_MergeResultView> createState() => _MergeResultViewState();
}

class _MergeResultViewState extends State<_MergeResultView> {
  bool _saving = false;

  WidgetRef get ref => widget.ref;

  @override
  Widget build(BuildContext context) {
    final result = widget.result;
    final l = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l.pdfMergeResult(result.pageCount)),
          Text(l.pdfToolsSize(FileUtils.formatFileSize(result.fileSizeBytes))),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: PremiumOutlineButton(
                  onPressed: () => Share.shareXFiles([XFile(result.filePath)]),
                  icon: Icons.share_rounded,
                  label: l.commonShare,
                  accent: AppColors.toolAccent('pdf_toolkit'),
                  dense: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PremiumButton(
                  onPressed: _saving ? null : () => _download(context, result),
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
            onPressed: () async {
              await ref.read(adsServiceProvider).showInterstitialIfAllowed();
              if (!mounted) return;
              ref.read(pdfJobStateProvider.notifier).state = const Idle();
            },
            label: l.commonDone,
            accent: AppColors.toolAccent('pdf_toolkit'),
          ),
        ],
      ),
    );
  }

  Future<void> _download(BuildContext context, PdfJobResult result) async {
    final messenger = ScaffoldMessenger.of(context);
    final l = AppLocalizations.of(context);
    setState(() => _saving = true);
    try {
      final outcome = await FileUtils.saveToDownloads(
        sourcePath: result.filePath,
        fileName: 'merged_${DateTime.now().millisecondsSinceEpoch}',
        ext: 'pdf',
        mimeType: 'application/pdf',
        toolId: 'merge_pdf',
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
      if (!mounted) return;
      ref.read(pdfJobStateProvider.notifier).state = const Idle();
      ref.read(selectedPdfsProvider.notifier).state = [];
    } catch (e) {
      debugPrint('Saving merged PDF failed: $e');
      messenger.showSnackBar(SnackBar(content: Text(l.commonSaveFailed)));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}
