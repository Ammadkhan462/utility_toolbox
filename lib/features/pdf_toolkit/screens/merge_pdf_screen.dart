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
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/pdf_toolkit/models/pdf_job_result.dart';
import 'package:utility_toolbox/features/pdf_toolkit/providers/pdf_providers.dart';

class MergePdfScreen extends ConsumerWidget {
  const MergePdfScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfs = ref.watch(selectedPdfsProvider);
    final jobState = ref.watch(pdfJobStateProvider);

    return ToolScaffold(
      title: 'Merge PDFs',
      accentColor: AppColors.toolAccent('pdf_toolkit'),
      body: _buildBody(context, ref, pdfs, jobState),
      bottomBar: jobState is! Success<PdfJobResult>
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: pdfs.length < 2 || jobState is Loading<PdfJobResult>
                    ? null
                    : () => _merge(ref),
                child: const Text('Merge'),
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
    return switch (jobState) {
      Loading() => const LoadingIndicator(message: 'Merging PDFs…'),
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
            OutlinedButton.icon(
              onPressed: () => _pickPdfs(ref),
              icon: const Icon(Icons.upload_file),
              label: const Text('Pick PDF files'),
            ),
            const SizedBox(height: 16),
            if (pdfs.isEmpty)
              const Text('Select at least two PDF files to merge.')
            else
              ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pdfs.length,
                onReorder: (oldIndex, newIndex) {
                  final list = [...ref.read(selectedPdfsProvider)];
                  if (newIndex > oldIndex) newIndex -= 1;
                  final item = list.removeAt(oldIndex);
                  list.insert(newIndex, item);
                  ref.read(selectedPdfsProvider.notifier).state = list;
                },
                itemBuilder: (context, index) {
                  final file = pdfs[index];
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

  Future<void> _pickPdfs(WidgetRef ref) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );
    if (result == null) return;
    ref.read(selectedPdfsProvider.notifier).state = [
      for (final file in result.files)
        if (file.path != null) File(file.path!),
    ];
  }

  Future<void> _merge(WidgetRef ref) async {
    ref.read(pdfJobStateProvider.notifier).state = const Loading();
    try {
      final paths = ref.read(selectedPdfsProvider).map((f) => f.path).toList();
      final result = await ref.read(pdfServiceProvider).mergePdfs(paths);
      ref.read(pdfJobStateProvider.notifier).state = Success(result);
    } catch (_) {
      ref.read(pdfJobStateProvider.notifier).state = const ErrorResult(
        'Could not merge PDFs. One of the files may be unreadable.',
      );
    }
  }
}

class _MergeResultView extends ConsumerWidget {
  const _MergeResultView({required this.result, required this.ref});

  final PdfJobResult result;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Merged PDF (${result.pageCount} pages)'),
          Text('Size: ${FileUtils.formatFileSize(result.fileSizeBytes)}'),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => Share.shareXFiles([XFile(result.filePath)]),
            child: const Text('Share'),
          ),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: () async {
              await this.ref
                  .read(adsServiceProvider)
                  .showInterstitialIfAllowed();
              this.ref.read(pdfJobStateProvider.notifier).state = const Idle();
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
