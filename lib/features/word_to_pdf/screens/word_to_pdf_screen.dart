import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import '../providers/word_to_pdf_providers.dart';

class WordToPdfScreen extends ConsumerWidget {
  const WordToPdfScreen({super.key});

  /// Router entry that converts a shared/opened .docx immediately.
  static Widget withInput(String? path) => path == null
      ? const WordToPdfScreen()
      : _AutoConvert(path: path, child: const WordToPdfScreen());

  static final _accent = AppColors.toolAccent('word_to_pdf');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wordToPdfProvider);
    final notifier = ref.read(wordToPdfProvider.notifier);
    final theme = Theme.of(context);
    final isConverting =
        state.status == WordToPdfStatus.converting ||
        state.status == WordToPdfStatus.picking;
    final isDone = state.status == WordToPdfStatus.done;
    final isError = state.status == WordToPdfStatus.error;

    return ToolScaffold(
      title: 'Word to PDF',
      accentColor: _accent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
        child: Column(
          children: [
            // ── Info banner ────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _accent.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: _accent.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline_rounded, color: _accent),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Converts .docx files to PDF. Text formatting is preserved; '
                      'complex layouts (tables, images) may vary.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // ── Drop zone / file picked ────────────────────────────────
            GestureDetector(
              onTap: isConverting ? null : notifier.pickAndConvert,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: isDone
                      ? AppColors.success.withValues(alpha: 0.08)
                      : _accent.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDone
                        ? AppColors.success
                        : _accent.withValues(alpha: 0.4),
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isConverting)
                      CircularProgressIndicator(
                        value: state.progress,
                        color: _accent,
                      )
                    else
                      Icon(
                        isDone
                            ? Icons.check_circle_rounded
                            : Icons.upload_file_rounded,
                        size: 48,
                        color: isDone ? AppColors.success : _accent,
                      ),
                    const SizedBox(height: 12),
                    if (isConverting)
                      Text(
                        state.status == WordToPdfStatus.picking
                            ? 'Opening file picker…'
                            : 'Converting… ${(state.progress * 100).toStringAsFixed(0)}%',
                        style: theme.textTheme.bodyMedium,
                      )
                    else if (isDone) ...[
                      Text(
                        '✓ Conversion complete!',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.outputFilename ?? '',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ] else ...[
                      Text(
                        'Tap to pick a .docx file',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: _accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Supports .docx format',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            if (isError) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline, color: AppColors.error),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        state.error ?? 'Conversion failed.',
                        style: const TextStyle(color: AppColors.error),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 28),

            // ── Actions ────────────────────────────────────────────────
            if (isDone) ...[
              // File size info row
              _FileSizeRow(path: state.outputPath, accent: _accent),
              const SizedBox(height: 16),

              // Share + Download side-by-side (matches pdf_toolkit pattern)
              Row(
                children: [
                  Expanded(
                    child: PremiumOutlineButton(
                      onPressed: notifier.share,
                      icon: Icons.share_rounded,
                      label: 'Share',
                      accent: _accent,
                      dense: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: PremiumButton(
                      onPressed: () => _download(context, notifier),
                      icon: Icons.download_rounded,
                      label: 'Download',
                      accent: _accent,
                      dense: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              PremiumOutlineButton(
                onPressed: notifier.reset,
                icon: Icons.refresh_rounded,
                label: 'Convert Another',
                accent: _accent,
              ),
            ] else if (!isConverting)
              PremiumButton(
                onPressed: notifier.pickAndConvert,
                icon: Icons.upload_file_rounded,
                label: 'Pick .docx File',
                gradient: AppColors.toolGradient('word_to_pdf'),
              ),

            const SizedBox(height: 40),

            // ── Steps ─────────────────────────────────────────────────
            _StepCard(
              step: 1,
              icon: Icons.upload_file_rounded,
              title: 'Pick your Word file',
              desc: 'Select a .docx file from your device storage.',
              accent: _accent,
            ),
            const SizedBox(height: 10),
            _StepCard(
              step: 2,
              icon: Icons.picture_as_pdf_rounded,
              title: 'Auto-convert',
              desc: 'Text is extracted and laid out as A4 PDF pages.',
              accent: _accent,
            ),
            const SizedBox(height: 10),
            _StepCard(
              step: 3,
              icon: Icons.share_rounded,
              title: 'Share or save',
              desc: 'Share the PDF to any app, email, or cloud storage.',
              accent: _accent,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Download helper ───────────────────────────────────────────────────────────

Future<void> _download(BuildContext context, WordToPdfNotifier notifier) async {
  final messenger = ScaffoldMessenger.of(context);
  try {
    final outcome = await notifier.download();
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          outcome == SaveOutcome.downloaded
              ? 'PDF saved to Downloads — tap the notification to open it.'
              : 'Opened share sheet — choose where to save the file.',
        ),
      ),
    );
  } catch (e) {
    messenger.showSnackBar(SnackBar(content: Text('Download failed: $e')));
  }
}

// ── File size row ─────────────────────────────────────────────────────────────

class _FileSizeRow extends StatefulWidget {
  const _FileSizeRow({required this.path, required this.accent});

  final String? path;
  final Color accent;

  @override
  State<_FileSizeRow> createState() => _FileSizeRowState();
}

class _FileSizeRowState extends State<_FileSizeRow> {
  int? _bytes;

  @override
  void initState() {
    super.initState();
    _loadSize();
  }

  Future<void> _loadSize() async {
    if (widget.path == null) return;
    try {
      final bytes = await File(widget.path!).length();
      if (mounted) setState(() => _bytes = bytes);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(Icons.picture_as_pdf_rounded, size: 16, color: widget.accent),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            _bytes != null
                ? 'PDF ready · ${FileUtils.formatFileSize(_bytes!)}'
                : 'PDF ready',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Step card ─────────────────────────────────────────────────────────────────

class _StepCard extends StatelessWidget {
  final int step;
  final IconData icon;
  final String title;
  final String desc;
  final Color accent;

  const _StepCard({
    required this.step,
    required this.icon,
    required this.title,
    required this.desc,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '$step',
              style: TextStyle(
                color: accent,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Icon(icon, color: accent, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AutoConvert extends ConsumerStatefulWidget {
  const _AutoConvert({required this.path, required this.child});

  final String path;
  final Widget child;

  @override
  ConsumerState<_AutoConvert> createState() => _AutoConvertState();
}

class _AutoConvertState extends ConsumerState<_AutoConvert> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) ref.read(wordToPdfProvider.notifier).convertFile(widget.path);
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
