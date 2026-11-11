import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/core/widgets/feature_badge.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/ai_upscaler/providers/ai_upscaler_notifier.dart';
import 'package:utility_toolbox/features/ai_upscaler/providers/upscaler_providers.dart';
import 'package:utility_toolbox/features/ai_upscaler/services/ai_upscaler_service.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

const _accent     = Color(0xFF7C3AED);
const _accentGlow = Color(0xFFA855F7);

class AiUpscalerScreen extends ConsumerStatefulWidget {
  const AiUpscalerScreen({super.key});

  @override
  ConsumerState<AiUpscalerScreen> createState() => _AiUpscalerScreenState();
}

class _AiUpscalerScreenState extends ConsumerState<AiUpscalerScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseCtrl;
  late final Animation<double>   _pulseAnim;

  @override
  void initState() {
    super.initState();
    // Only pulses while a job runs (see build): a forever-repeating
    // controller keeps scheduling frames and drains the battery.
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _pulseAnim = CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    super.dispose();
  }

  Future<void> _pick(ImageSource src) async {
    XFile? picked;
    try {
      picked = await ImagePicker().pickImage(
        source: src,
        imageQuality: 100, // no pre-compression — let AI work on original
      );
    } on PlatformException catch (e) {
      // Camera/photos permission denied, no camera app, etc.
      debugPrint('Image pick failed: $e');
      return;
    }
    if (picked == null || !mounted) return;
    ref.read(aiUpscalerProvider.notifier).setSource(File(picked.path));
  }

  @override
  Widget build(BuildContext context) {
    final state    = ref.watch(aiUpscalerProvider);
    final notifier = ref.read(aiUpscalerProvider.notifier);
    final theme    = Theme.of(context);
    final isDark   = theme.brightness == Brightness.dark;

    final l = AppLocalizations.of(context);

    if (state.isProcessing) {
      if (!_pulseCtrl.isAnimating) _pulseCtrl.repeat(reverse: true);
    } else if (_pulseCtrl.isAnimating) {
      _pulseCtrl.stop();
    }

    // Offline on first use: the AI model couldn't be downloaded, so the
    // result came from standard upscaling. Say so clearly, once per result.
    ref.listen<UpscalerState>(aiUpscalerProvider, (prev, next) {
      final fallback = next.result?.fallback;
      if (next.status == UpscaleStatus.done &&
          prev?.status != UpscaleStatus.done &&
          fallback == UpscaleFallback.modelUnavailable) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l.upscalerFallbackModelUnavailable)),
        );
      }
    });

    return ToolScaffold(
      title: l.toolAiUpscalerTitle,
      accentColor: _accent,
      actions: [
        if (state.sourceFile != null)
          TextButton(
            onPressed: notifier.reset,
            child: Text(l.upscalerNewImage, style: const TextStyle(color: _accent)),
          ),
      ],
      body: state.sourceFile == null
          ? _PickerPage(onPick: _pick)
          : _WorkspacePage(
              state:     state,
              notifier:  notifier,
              onPick:    _pick,
              pulseAnim: _pulseAnim,
              isDark:    isDark,
            ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// PICKER PAGE
// ═══════════════════════════════════════════════════════════════════════════

class _PickerPage extends StatelessWidget {
  const _PickerPage({required this.onPick});

  final Future<void> Function(ImageSource) onPick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hero icon with glow
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  colors: [Color(0xFF7C3AED), Color(0xFF4C1D95)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: _accent.withValues(alpha: 0.4),
                    blurRadius: 32,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: const Icon(
                Icons.auto_awesome_rounded,
                size: 56,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l.toolAiUpscalerTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l.upscalerIntro,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.55,
              ),
            ),
            const SizedBox(height: 10),
            // Feature badges
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                FeatureBadge(icon: Icons.memory_rounded,  label: l.upscalerBadgeOnDevice, accent: _accent),
                FeatureBadge(icon: Icons.wifi_off_rounded, label: l.upscalerBadgeOffline, accent: _accent),
                FeatureBadge(icon: Icons.hd_rounded,       label: l.upscalerBadgeUpTo4x, accent: _accent),
                FeatureBadge(icon: Icons.speed_rounded,    label: l.upscalerBadgeGpu, accent: _accent),
              ],
            ),
            const SizedBox(height: 36),

            // Pick buttons
            PremiumButton(
              onPressed: () => onPick(ImageSource.gallery),
              icon: Icons.photo_library_rounded,
              label: l.commonChoosePhoto,
              gradient: const LinearGradient(
                colors: [_accent, _accentGlow],
              ),
            ),
            const SizedBox(height: 12),
            PremiumOutlineButton(
              onPressed: () => onPick(ImageSource.camera),
              icon: Icons.camera_alt_rounded,
              label: l.commonCamera,
              accent: _accent,
            ),
            const SizedBox(height: 28),
            Text(
              l.upscalerBestResults,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// WORKSPACE PAGE  (image selected)
// ═══════════════════════════════════════════════════════════════════════════

class _WorkspacePage extends StatelessWidget {
  const _WorkspacePage({
    required this.state,
    required this.notifier,
    required this.onPick,
    required this.pulseAnim,
    required this.isDark,
  });

  final UpscalerState state;
  final AiUpscalerNotifier notifier;
  final Future<void> Function(ImageSource) onPick;
  final Animation<double> pulseAnim;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Before/After preview ──────────────────────────────────
          _BeforeAfterPreview(state: state),
          const SizedBox(height: 20),

          // ── Processing overlay / result card ─────────────────────
          if (state.status == UpscaleStatus.loadingModel ||
              state.status == UpscaleStatus.processing)
            _ProcessingCard(
              state: state,
              pulseAnim: pulseAnim,
              onCancel: notifier.cancel,
            ),

          if (state.status == UpscaleStatus.done && state.result != null)
            _ResultCard(result: state.result!, notifier: notifier),

          if (state.status == UpscaleStatus.error)
            _ErrorCard(
              error: state.error,
              onRetry: notifier.upscale,
            ),

          const SizedBox(height: 16),

          // ── Settings (only shown when idle/done) ──────────────────
          if (!state.isProcessing) ...[
            _SettingsCard(state: state, notifier: notifier),
            const SizedBox(height: 16),
          ],

          // ── Action button ─────────────────────────────────────────
          if (!state.isProcessing)
            _UpscaleButton(
              state:    state,
              notifier: notifier,
            ),

          if (state.status == UpscaleStatus.idle) ...[
            const SizedBox(height: 12),
            PremiumOutlineButton(
              onPressed: () => onPick(ImageSource.gallery),
              icon: Icons.swap_horiz_rounded,
              label: AppLocalizations.of(context).upscalerChangeImage,
              accent: _accent,
              dense: true,
            ),
          ],
        ],
      ),
    );
  }
}

// ── Before / After preview ─────────────────────────────────────────────────

class _BeforeAfterPreview extends StatefulWidget {
  const _BeforeAfterPreview({required this.state});
  final UpscalerState state;

  @override
  State<_BeforeAfterPreview> createState() => _BeforeAfterPreviewState();
}

class _BeforeAfterPreviewState extends State<_BeforeAfterPreview> {
  bool _showAfter = false;

  @override
  Widget build(BuildContext context) {
    final hasDone = widget.state.result != null &&
        widget.state.status == UpscaleStatus.done;
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    // Decode at preview size, not the full 12–50 MP source / 4× output.
    final cacheW = (MediaQuery.sizeOf(context).width *
            MediaQuery.devicePixelRatioOf(context))
        .round();

    return Column(
      children: [
        // Toggle tabs (shown only after upscale)
        if (hasDone)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.4)),
            ),
            child: Row(
              children: [
                _PreviewTab(
                  label: l.upscalerTabOriginal,
                  selected: !_showAfter,
                  onTap: () => setState(() => _showAfter = false),
                ),
                _PreviewTab(
                  label: '${l.upscalerTabUpscaled} ✨',
                  selected: _showAfter,
                  onTap: () => setState(() => _showAfter = true),
                ),
              ],
            ),
          ),

        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: hasDone && _showAfter
                    ? Image.file(
                        widget.state.result!.outputFile,
                        key: const ValueKey('after'),
                        width: double.infinity,
                        height: 240,
                        fit: BoxFit.cover,
                        cacheWidth: cacheW,
                      )
                    : Image.file(
                        widget.state.sourceFile!,
                        key: const ValueKey('before'),
                        width: double.infinity,
                        height: 240,
                        fit: BoxFit.cover,
                        cacheWidth: cacheW,
                        errorBuilder: (_, _, _) => const SizedBox(
                          height: 240,
                          child: Center(
                            child: Icon(Icons.broken_image_outlined, size: 48),
                          ),
                        ),
                      ),
              ),
              // Label badge
              PositionedDirectional(
                bottom: 10,
                start: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    hasDone && _showAfter
                        ? l.upscalerTabUpscaled
                        : l.upscalerTabOriginal,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PreviewTab extends StatelessWidget {
  const _PreviewTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final String   label;
  final bool     selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? _accent : Colors.transparent,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: selected
                  ? Colors.white
                  : Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Processing card ────────────────────────────────────────────────────────

class _ProcessingCard extends StatelessWidget {
  const _ProcessingCard({
    required this.state,
    required this.pulseAnim,
    required this.onCancel,
  });
  final UpscalerState     state;
  final Animation<double> pulseAnim;
  final VoidCallback      onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    final step = state.step;

    return AnimatedBuilder(
      animation: pulseAnim,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _accent.withValues(alpha: 0.06 + pulseAnim.value * 0.04),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _accent.withValues(alpha: 0.3 + pulseAnim.value * 0.2),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              // AI neural network animation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(
                      value: state.progress > 0 ? state.progress : null,
                      color: _accent,
                      strokeWidth: 3,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step == null
                              ? l.upscalerStageStarting
                              : _stepLabel(l, step),
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: _accent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (state.status == UpscaleStatus.loadingModel)
                          Text(
                            l.upscalerLoadingModelHint,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              // Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: state.progress > 0 ? state.progress : null,
                  minHeight: 6,
                  backgroundColor:
                      _accent.withValues(alpha: 0.15),
                  valueColor:
                      const AlwaysStoppedAnimation(_accent),
                ),
              ),
              if (state.progress > 0) ...[
                const SizedBox(height: 6),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    '${(state.progress * 100).round()}%',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: _accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 10),
              Text(
                state.factor == UpscaleFactor.x4
                    ? l.upscalerTime4x
                    : l.upscalerTime2x,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              // cancel() existed but nothing called it: a 60 s job could
              // only be stopped by leaving (and it kept running then).
              TextButton(
                onPressed: onCancel,
                style: TextButton.styleFrom(foregroundColor: _accent),
                child: Text(AppLocalizations.of(context).commonCancel),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ── Result card ────────────────────────────────────────────────────────────

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.result, required this.notifier});
  final UpscaleResult      result;
  final AiUpscalerNotifier notifier;

  Future<void> _saveToGallery(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final l = AppLocalizations.of(context);
    // On-device output is PNG, cloud output JPEG: saving the PNG as
    // "….jpg" / image/jpeg broke it in My Files and other apps.
    final isPng =
        p.extension(result.outputFile.path).toLowerCase() == '.png';
    var ok = false;
    try {
      ok = await FileUtils.saveImageToGallery(
        bytes: await result.outputFile.readAsBytes(),
        fileName:
            'upscaled_${DateTime.now().millisecondsSinceEpoch}.${isPng ? 'png' : 'jpg'}',
        mimeType: isPng ? 'image/png' : 'image/jpeg',
        toolId: 'ai_upscaler',
      );
    } catch (e) {
      debugPrint('Saving upscaled image failed: $e');
    }
    messenger.showSnackBar(SnackBar(
      content: Text(ok ? l.commonSavedToGallery : l.commonSaveFailed),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    final secs  = (result.processingMs / 1000).toStringAsFixed(1);
    final fallbackNote = switch (result.fallback) {
      UpscaleFallback.modelUnavailable => l.upscalerFallbackModelUnavailable,
      UpscaleFallback.modelFailed => l.upscalerFallbackModelFailed,
      UpscaleFallback.cloudUnavailable => l.upscalerFallbackCloud,
      null => null,
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF22C55E).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: const Color(0xFF22C55E).withValues(alpha: 0.35)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome_rounded,
                  color: Color(0xFF22C55E), size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '${l.upscalerDoneIn(secs)} ✨',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: const Color(0xFF22C55E),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          if (fallbackNote != null) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF59E0B).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.wifi_off_rounded,
                      color: Color(0xFFB45309), size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      fallbackNote,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 14),
          // Stats row
          Row(
            children: [
              _StatCol(
                label: l.upscalerStatResolution,
                before: result.originalRes,
                after:  result.outputRes,
              ),
              _StatCol(
                label: l.upscalerStatFileSize,
                before: _fmtBytes(result.originalBytes),
                after:  _fmtBytes(result.outputBytes),
              ),
              _StatCol(
                label: l.upscalerStatScale,
                before: '1×',
                after: result.originalWidth == 0
                    ? '–'
                    : '${(result.outputWidth / result.originalWidth).toStringAsFixed(1)}×',
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Action buttons
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => Share.shareXFiles(
                    [XFile(result.outputFile.path)],
                    subject: l.upscalerShareSubject,
                  ),
                  icon:  const Icon(Icons.share_rounded),
                  label: Text(l.commonShare),
                  style: FilledButton.styleFrom(
                    backgroundColor: _accent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _saveToGallery(context),
                  icon:  const Icon(Icons.download_rounded),
                  label: Text(l.commonSave),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _accent,
                    side: const BorderSide(color: _accent),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCol extends StatelessWidget {
  const _StatCol({
    required this.label,
    required this.before,
    required this.after,
  });
  final String label, before, after;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            before,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Text(
            after,
            style: theme.textTheme.titleSmall?.copyWith(
              color: const Color(0xFF22C55E),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Settings card ──────────────────────────────────────────────────────────

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.state, required this.notifier});
  final UpscalerState      state;
  final AiUpscalerNotifier notifier;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.45)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l.upscalerSettings,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(height: 16),

          // ── Upscale factor ──────────────────────────────────────
          Text(l.upscalerFactorLabel,
              style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Row(
            children: UpscaleFactor.values.map((f) {
              final sel = f == state.factor;
              return Expanded(
                child: GestureDetector(
                  onTap: () => notifier.setFactor(f),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsetsDirectional.only(
                        end: f == UpscaleFactor.x2 ? 8 : 0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 14),
                    decoration: BoxDecoration(
                      color: sel
                          ? _accent.withValues(alpha: 0.12)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: sel
                            ? _accent
                            : theme.colorScheme.outline
                                .withValues(alpha: 0.4),
                        width: sel ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          f.label,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: sel ? _accent : null,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          f == UpscaleFactor.x4
                              ? l.upscalerFactor4xDesc
                              : l.upscalerFactor2xDesc,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          // ── Enhancement mode ────────────────────────────────────
          Text(l.upscalerOptimiseFor,
              style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: EnhanceMode.values.map((m) {
              final sel = m == state.mode;
              return ChoiceChip(
                label: Text(switch (m) {
                  EnhanceMode.auto => l.upscalerModeAuto,
                  EnhanceMode.photo => l.upscalerModePhoto,
                  EnhanceMode.illustration => l.upscalerModeIllustration,
                  EnhanceMode.face => l.upscalerModeFace,
                }),
                selected: sel,
                selectedColor: _accent.withValues(alpha: 0.14),
                checkmarkColor: _accent,
                labelStyle: TextStyle(
                  color: sel
                      ? _accent
                      : theme.colorScheme.onSurfaceVariant,
                  fontWeight:
                      sel ? FontWeight.w700 : FontWeight.w400,
                ),
                side: BorderSide(
                  color: sel
                      ? _accent.withValues(alpha: 0.6)
                      : theme.colorScheme.outline.withValues(alpha: 0.3),
                ),
                onSelected: (_) => notifier.setMode(m),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          // ── Denoise slider ───────────────────────────────────────
          _Slider(
            label: l.upscalerDenoise,
            icon: Icons.blur_circular_rounded,
            tooltip: l.upscalerDenoiseTip,
            value: state.denoise,
            onChanged: notifier.setDenoise,
          ),
          const SizedBox(height: 8),

          // ── Sharpen slider ───────────────────────────────────────
          _Slider(
            label: l.upscalerSharpen,
            icon: Icons.adjust_rounded,
            tooltip: l.upscalerSharpenTip,
            value: state.sharpen,
            onChanged: notifier.setSharpen,
          ),

          // ── Cloud processing opt-in ──────────────────────────────
          if (AiUpscalerService.cloudAvailable) ...[
            const SizedBox(height: 12),
            Divider(color: theme.colorScheme.outline.withValues(alpha: 0.3)),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              dense: true,
              activeThumbColor: _accent,
              value: state.useCloud,
              title: Text(
                l.upscalerCloudTitle,
                style: theme.textTheme.labelLarge,
              ),
              subtitle: Text(
                state.useCloud ? l.upscalerCloudOn : l.upscalerCloudOff,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              onChanged: state.isProcessing
                  ? null
                  : (enabled) => _toggleCloud(context, enabled),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _toggleCloud(BuildContext context, bool enabled) async {
    if (!enabled) {
      await notifier.setUseCloud(false);
      return;
    }
    final l = AppLocalizations.of(context);
    final accepted = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.upscalerCloudDialogTitle),
        content: SingleChildScrollView(
          child: Text(l.upscalerCloudDialogBody),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l.upscalerCloudKeepLocal),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: _accent),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l.upscalerCloudEnable),
          ),
        ],
      ),
    );
    if (accepted == true) await notifier.setUseCloud(true);
  }
}

class _Slider extends StatelessWidget {
  const _Slider({
    required this.label,
    required this.icon,
    required this.tooltip,
    required this.value,
    required this.onChanged,
  });
  final String   label;
  final IconData icon;
  final String   tooltip;
  final double   value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Tooltip(
          message: tooltip,
          child: Icon(icon, size: 18,
              color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 88,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(label, style: theme.textTheme.bodySmall),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3,
              thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 7),
            ),
            child: Slider(
              value: value,
              min: 0,
              max: 1,
              activeColor: _accent,
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(
          width: 36,
          child: Text(
            '${(value * 100).round()}%',
            textAlign: TextAlign.end,
            style: theme.textTheme.labelSmall?.copyWith(
              fontFamily: 'monospace',
              color: _accent,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Upscale button ─────────────────────────────────────────────────────────

class _UpscaleButton extends StatelessWidget {
  const _UpscaleButton({required this.state, required this.notifier});
  final UpscalerState      state;
  final AiUpscalerNotifier notifier;

  @override
  Widget build(BuildContext context) {
    final isDone = state.status == UpscaleStatus.done;
    final l = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFFA855F7)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: _accent.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: isDone
              ? () => notifier.upscale() // re-upscale with new settings
              : notifier.upscale,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.auto_awesome_rounded,
                    color: Colors.white, size: 22),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                  isDone ? l.upscalerUpscaleAgain : '${l.upscalerUpscale}  ✨',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Error card ─────────────────────────────────────────────────────────────

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({required this.error, required this.onRetry});
  final UpscaleErrorKind? error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    final message = switch (error) {
      UpscaleErrorKind.tooLarge => l.upscalerErrorTooLarge,
      UpscaleErrorKind.unreadable => l.upscalerErrorUnreadable,
      UpscaleErrorKind.network => l.upscalerErrorNetwork,
      UpscaleErrorKind.generic || null => l.commonErrorGeneric,
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEF4444).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: const Color(0xFFEF4444).withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.error_outline_rounded,
                  color: Color(0xFFEF4444), size: 20),
              const SizedBox(width: 8),
              Text(
                l.upscalerFailed,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: const Color(0xFFEF4444),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(message,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              )),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh_rounded, size: 18),
            label: Text(l.commonRetry),
            style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFEF4444)),
          ),
        ],
      ),
    );
  }
}

// ── Small helpers ──────────────────────────────────────────────────────────

/// Localized text for a pipeline progress step.
String _stepLabel(AppLocalizations l, UpscaleStep step) {
  String arg(int i) => i < step.args.length ? '${step.args[i]}' : '';
  return switch (step.stage) {
    UpscaleStage.starting => l.upscalerStageStarting,
    UpscaleStage.connecting => l.upscalerStageConnecting,
    UpscaleStage.onDevice => l.upscalerStageOnDevice,
    UpscaleStage.cloudUnavailable => l.upscalerStageCloudUnavailable,
    UpscaleStage.uploading => l.upscalerStageUploading,
    UpscaleStage.restoringFaces => l.upscalerStageRestoringFaces,
    UpscaleStage.preparing => l.upscalerStagePreparing,
    UpscaleStage.loadingModel => l.upscalerStageLoadingModel,
    UpscaleStage.downloadingModel => l.upscalerStageDownloadingModel,
    UpscaleStage.fallback => l.upscalerStageFallback,
    UpscaleStage.decoding => l.upscalerStageDecoding,
    UpscaleStage.resizingInput => l.upscalerStageResizing(arg(0), arg(1)),
    UpscaleStage.denoising => l.upscalerStageDenoising,
    UpscaleStage.upscaling => l.upscalerStageUpscaling(arg(0)),
    UpscaleStage.aiTiles => l.upscalerStageAiTiles(arg(0), arg(1)),
    UpscaleStage.sharpening => l.upscalerStageSharpening,
    UpscaleStage.colourGrading => l.upscalerStageColour,
    UpscaleStage.saving => l.upscalerStageSaving,
    UpscaleStage.done => l.upscalerStageDone,
  };
}

String _fmtBytes(int b) {
  if (b < 1024) return '${b}B';
  if (b < 1024 * 1024) return '${(b / 1024).toStringAsFixed(0)}KB';
  return '${(b / (1024 * 1024)).toStringAsFixed(1)}MB';
}
