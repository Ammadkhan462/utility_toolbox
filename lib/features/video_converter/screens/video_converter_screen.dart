import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/gradient_icon_badge.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import '../providers/video_converter_providers.dart';

class VideoConverterScreen extends ConsumerWidget {
  const VideoConverterScreen({super.key});

  static final _accent = AppColors.toolAccent('video_converter');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state    = ref.watch(videoConverterProvider);
    final notifier = ref.read(videoConverterProvider.notifier);
    final theme    = Theme.of(context);
    final isConverting = state.status == VideoConvertStatus.converting;
    final isDone       = state.status == VideoConvertStatus.done;
    final isError      = state.status == VideoConvertStatus.error;
    final isBusy       = state.status == VideoConvertStatus.picking ||
                         state.status == VideoConvertStatus.probing || isConverting;

    return ToolScaffold(
      title: 'Video Converter',
      accentColor: _accent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── File picker zone ───────────────────────────────────────
            GestureDetector(
              onTap: isBusy || isDone ? null : notifier.pickFile,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 28),
                decoration: BoxDecoration(
                  color: state.inputPath != null
                      ? _accent.withValues(alpha: 0.08)
                      : theme.colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: _accent.withValues(alpha: state.inputPath != null ? 0.5 : 0.2),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    if (state.inputPath != null)
                      Icon(Icons.videocam_rounded, size: 44, color: _accent)
                    else
                      GradientIconBadge(
                        icon: Icons.video_file_outlined,
                        gradient: AppColors.toolGradient('video_converter'),
                        size: 56,
                        iconSize: 26,
                      ),
                    const SizedBox(height: 10),
                    Text(
                      state.inputFilename ?? 'Tap to pick a video',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: state.inputPath != null
                            ? theme.colorScheme.onSurface
                            : _accent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (state.probeInfo != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        state.probeInfo!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    if (state.inputPath == null) ...[
                      const SizedBox(height: 4),
                      Text(
                        'MP4, MKV, AVI, MOV, WebM…',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ── Output format picker ───────────────────────────────────
            Text(
              'Output Format',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: kVideoFormats.map((fmt) {
                final selected = state.outputFormat.ext == fmt.ext;
                return GestureDetector(
                  onTap: isBusy ? null : () => notifier.setFormat(fmt),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: selected
                          ? _accent
                          : theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: selected
                            ? _accent
                            : theme.colorScheme.outlineVariant,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          fmt.label,
                          style: TextStyle(
                            color: selected ? Colors.white : theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          fmt.description,
                          style: TextStyle(
                            color: selected
                                ? Colors.white70
                                : theme.colorScheme.onSurfaceVariant,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 28),

            // ── Progress bar ───────────────────────────────────────────
            if (isConverting) ...[
              Text(
                state.progress > 0
                    ? 'Converting… ${(state.progress * 100).round()}%'
                    : 'Converting… this may take a while',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                // Indeterminate until the first statistics tick (or when the
                // input duration could not be probed).
                value: state.progress > 0 ? state.progress : null,
                color: _accent,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 20),
            ],

            // ── Done card ──────────────────────────────────────────────
            if (isDone) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      color: AppColors.success.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_rounded,
                        color: AppColors.success),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Conversion complete!',
                              style: TextStyle(
                                  color: AppColors.success,
                                  fontWeight: FontWeight.bold)),
                          Text(state.outputFilename ?? '',
                              style: TextStyle(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],

            // ── Error card ─────────────────────────────────────────────
            if (isError) ...[
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.error_outline, color: AppColors.error),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        state.error ?? 'Conversion failed.',
                        style: const TextStyle(color: AppColors.error, fontSize: 12),
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],

            // ── Action buttons ─────────────────────────────────────────
            if (isDone) ...[
              PremiumButton(
                onPressed: notifier.share,
                icon: Icons.share_rounded,
                label: 'Share / Save Output',
                gradient: AppColors.toolGradient('video_converter'),
              ),
              const SizedBox(height: 10),
              PremiumOutlineButton(
                onPressed: notifier.reset,
                icon: Icons.refresh_rounded,
                label: 'Convert Another',
                accent: _accent,
              ),
            ] else ...[
              if (state.inputPath == null)
                PremiumButton(
                  onPressed: isBusy ? null : notifier.pickFile,
                  icon: isBusy ? null : Icons.video_file_rounded,
                  label: 'Pick Video File',
                  gradient: AppColors.toolGradient('video_converter'),
                )
              else if (!isConverting)
                PremiumButton(
                  onPressed: notifier.convert,
                  icon: Icons.movie_filter_rounded,
                  label: 'Convert to ${state.outputFormat.label.toUpperCase()}',
                  gradient: AppColors.toolGradient('video_converter'),
                )
              else
                PremiumOutlineButton(
                  onPressed: notifier.cancel,
                  icon: Icons.stop_circle_outlined,
                  label: 'Cancel',
                  accent: _accent,
                ),
            ],

            const SizedBox(height: 16),
            if (state.inputPath != null && !isBusy && !isDone)
              Center(
                child: TextButton.icon(
                  onPressed: notifier.reset,
                  icon: const Icon(Icons.close_rounded, size: 16),
                  label: const Text('Clear'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
