import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/gradient_icon_badge.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';
import '../providers/video_converter_providers.dart';

/// Localized one-line description for an output format (names stay as is).
String _formatDescription(AppLocalizations l, String ext) => switch (ext) {
  'mp4' => l.videoFmtMostCompatible,
  'mov' => l.videoFmtApple,
  'mkv' => l.videoFmtFlexible,
  'avi' => l.videoFmtLegacy,
  'gif' => l.videoFmtGif,
  'mp3' => l.videoFmtAudioOnly,
  'm4a' => l.videoFmtAudioAac,
  'aac' => l.videoFmtAudioRaw,
  'wav' => l.videoFmtWav,
  _ => '',
};

/// m:ss (or h:mm:ss) — digits only, so it reads the same in every language.
String _formatDuration(double secs) {
  final total = secs.round();
  final h = total ~/ 3600;
  final m = (total % 3600) ~/ 60;
  final s = (total % 60).toString().padLeft(2, '0');
  return h > 0 ? '$h:${m.toString().padLeft(2, '0')}:$s' : '$m:$s';
}

class VideoConverterScreen extends ConsumerWidget {
  const VideoConverterScreen({super.key});

  static final _accent = AppColors.toolAccent('video_converter');

  Future<void> _save(BuildContext context, VideoConverterNotifier notifier) async {
    final messenger = ScaffoldMessenger.of(context);
    final l = AppLocalizations.of(context);
    final ok = await notifier.saveToDownloads();
    if (ok == null) return; // fell back to the share sheet
    messenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              ok ? Icons.check_circle_rounded : Icons.error_outline_rounded,
              color: ok ? AppColors.success : AppColors.error,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(ok ? l.commonSavedToDownloads : l.commonSaveFailed),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state    = ref.watch(videoConverterProvider);
    final notifier = ref.read(videoConverterProvider.notifier);
    final theme    = Theme.of(context);
    final l        = AppLocalizations.of(context);
    final isConverting = state.status == VideoConvertStatus.converting;
    final isDone       = state.status == VideoConvertStatus.done;
    final isError      = state.status == VideoConvertStatus.error;
    final isBusy       = state.status == VideoConvertStatus.picking ||
                         state.status == VideoConvertStatus.probing || isConverting;

    return ToolScaffold(
      title: l.toolVideoConverterTitle,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                      state.inputFilename ?? l.videoPickHint,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: state.inputPath != null
                            ? theme.colorScheme.onSurface
                            : _accent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ),
                    if (state.probeFormat != null ||
                        state.probeDurationSec != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        l.videoProbeInfo(
                          state.probeFormat ?? '?',
                          state.probeDurationSec == null
                              ? '?'
                              : _formatDuration(state.probeDurationSec!),
                        ),
                        textAlign: TextAlign.center,
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
              l.videoOutputFormat,
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
                          _formatDescription(l, fmt.ext),
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
                    ? l.videoConvertingPercent((state.progress * 100).round())
                    : l.videoConvertingWait,
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
                          Text(l.videoDone,
                              style: const TextStyle(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.errorKind == VideoErrorKind.unsupported
                                ? l.videoErrorUnsupported
                                : l.commonErrorGeneric,
                            style: const TextStyle(
                              color: AppColors.error,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if ((state.error ?? '').isNotEmpty) ...[
                            const SizedBox(height: 6),
                            // Technical FFmpeg detail: always left-to-right.
                            Text(
                              state.error!,
                              textDirection: TextDirection.ltr,
                              style: const TextStyle(
                                color: AppColors.error,
                                fontSize: 11,
                              ),
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],

            // ── Action buttons ─────────────────────────────────────────
            if (isDone) ...[
              Row(
                children: [
                  // Saves to Downloads + My Files; sharing alone never
                  // registered the output anywhere.
                  Expanded(
                    child: PremiumButton(
                      onPressed: () => _save(context, notifier),
                      icon: Icons.download_rounded,
                      label: l.commonSave,
                      gradient: AppColors.toolGradient('video_converter'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: PremiumOutlineButton(
                      onPressed: notifier.share,
                      icon: Icons.share_rounded,
                      label: l.commonShare,
                      accent: _accent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              PremiumOutlineButton(
                onPressed: notifier.reset,
                icon: Icons.refresh_rounded,
                label: l.videoConvertAnother,
                accent: _accent,
              ),
            ] else ...[
              if (state.inputPath == null)
                PremiumButton(
                  onPressed: isBusy ? null : notifier.pickFile,
                  icon: isBusy ? null : Icons.video_file_rounded,
                  label: l.videoPickButton,
                  gradient: AppColors.toolGradient('video_converter'),
                )
              else if (!isConverting)
                PremiumButton(
                  onPressed: notifier.convert,
                  icon: Icons.movie_filter_rounded,
                  label: l.videoConvertTo(state.outputFormat.label.toUpperCase()),
                  gradient: AppColors.toolGradient('video_converter'),
                )
              else
                PremiumOutlineButton(
                  onPressed: notifier.cancel,
                  icon: Icons.stop_circle_outlined,
                  label: l.commonCancel,
                  accent: _accent,
                ),
            ],

            const SizedBox(height: 16),
            if (state.inputPath != null && !isBusy && !isDone)
              Center(
                child: TextButton.icon(
                  onPressed: notifier.reset,
                  icon: const Icon(Icons.close_rounded, size: 16),
                  label: Text(l.commonClear),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
