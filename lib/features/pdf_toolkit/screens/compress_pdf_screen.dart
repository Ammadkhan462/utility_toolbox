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
import 'package:utility_toolbox/features/pdf_toolkit/services/pdf_service.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

class CompressPdfScreen extends ConsumerWidget {
  const CompressPdfScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdf = ref.watch(selectedSinglePdfProvider);
    final level = ref.watch(pdfCompressionLevelProvider);
    final jobState = ref.watch(pdfJobStateProvider);
    final originalSize = _sizeOf(pdf);
    final l = AppLocalizations.of(context);

    return ToolScaffold(
      title: l.toolCompressPdfTitle,
      accentColor: AppColors.toolAccent('pdf_toolkit'),
      body: _buildBody(context, ref, pdf, level, jobState, originalSize),
      bottomBar: jobState is! Success<PdfJobResult>
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: pdf == null || jobState is Loading<PdfJobResult>
                    ? null
                    : () => _compress(context, ref, pdf.path),
                child: Text(l.pdfCompressButton),
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
    final l = AppLocalizations.of(context);
    return switch (jobState) {
      Loading() => LoadingIndicator(message: l.pdfCompressWorking),
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
            PremiumOutlineButton(
              onPressed: () => _pickPdf(context, ref),
              icon: Icons.picture_as_pdf_outlined,
              label: l.pdfToolsChoosePdf,
              accent: AppColors.toolAccent('pdf_toolkit'),
              dense: true,
            ),
            const SizedBox(height: 16),
            if (pdf != null)
              Text(
                '${l.pdfToolsSelectedFile(pdf.path.split(Platform.pathSeparator).last)}\n'
                '${l.pdfCompressOriginalSize(FileUtils.formatFileSize(originalSize))}',
              )
            else
              Text(l.pdfCompressIntro),
            const SizedBox(height: 16),
            SegmentedButton<PdfCompressionLevel>(
              segments: [
                for (final (value, label) in [
                  (PdfCompressionLevel.low, l.pdfCompressLow),
                  (PdfCompressionLevel.medium, l.pdfCompressMedium),
                  (PdfCompressionLevel.high, l.pdfCompressHigh),
                ])
                  ButtonSegment(
                    value: value,
                    label: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
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

  /// Never throws: a shared/cached file can disappear while the screen is
  /// open, and a sync IO error here would break the whole build.
  static int _sizeOf(File? file) {
    if (file == null) return 0;
    try {
      return file.lengthSync();
    } catch (_) {
      return 0;
    }
  }

  Future<void> _pickPdf(BuildContext context, WidgetRef ref) async {
    final String? path;
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      final files = result?.files;
      path = files == null || files.isEmpty ? null : files.first.path;
    } catch (e) {
      debugPrint('PDF picker failed: $e');
      return;
    }
    if (path == null || !context.mounted) return;
    ref.read(selectedSinglePdfProvider.notifier).state = File(path);
  }

  Future<void> _compress(BuildContext context, WidgetRef ref, String path) async {
    final l = AppLocalizations.of(context);
    ref.read(pdfJobStateProvider.notifier).state = const Loading();
    try {
      final level = ref.read(pdfCompressionLevelProvider);
      final result = await ref
          .read(pdfServiceProvider)
          .compressPdf(path, level);
      // The user may have left while compressing; ref is unusable then.
      if (!context.mounted) return;
      ref.read(pdfJobStateProvider.notifier).state = Success(result);
    } catch (_) {
      if (!context.mounted) return;
      ref.read(pdfJobStateProvider.notifier).state = ErrorResult(
        l.pdfCompressFailed,
      );
    }
  }
}

class _CompressResultView extends StatefulWidget {
  const _CompressResultView({
    required this.result,
    required this.originalSize,
    required this.ref,
  });

  final PdfJobResult result;
  final int originalSize;
  final WidgetRef ref;

  @override
  State<_CompressResultView> createState() => _CompressResultViewState();
}

class _CompressResultViewState extends State<_CompressResultView> {
  bool _saving = false;

  WidgetRef get ref => widget.ref;

  @override
  Widget build(BuildContext context) {
    final result = widget.result;
    final originalSize = widget.originalSize;
    final l = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l.pdfCompressBefore(FileUtils.formatFileSize(originalSize))),
          Text(l.pdfCompressAfter(FileUtils.formatFileSize(result.fileSizeBytes))),
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
        fileName: 'compressed_${DateTime.now().millisecondsSinceEpoch}',
        ext: 'pdf',
        mimeType: 'application/pdf',
        toolId: 'compress_pdf',
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
      ref.read(selectedSinglePdfProvider.notifier).state = null;
    } catch (e) {
      debugPrint('Saving compressed PDF failed: $e');
      messenger.showSnackBar(SnackBar(content: Text(l.commonSaveFailed)));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}
