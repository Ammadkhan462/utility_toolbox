import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:gal/gal.dart';
import 'package:utility_toolbox/core/widgets/feature_badge.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/ai_upscaler/providers/ai_upscaler_notifier.dart';
import 'package:utility_toolbox/features/ai_upscaler/providers/upscaler_providers.dart';
import 'package:utility_toolbox/features/ai_upscaler/services/ai_upscaler_service.dart';

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
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _pulseAnim = CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    super.dispose();
  }

  Future<void> _pick(ImageSource src) async {
    final picked = await ImagePicker().pickImage(
      source: src,
      imageQuality: 100, // no pre-compression — let AI work on original
    );
    if (picked == null) return;
    ref.read(aiUpscalerProvider.notifier).setSource(File(picked.path));
  }

  @override
  Widget build(BuildContext context) {
    final state    = ref.watch(aiUpscalerProvider);
    final notifier = ref.read(aiUpscalerProvider.notifier);
    final theme    = Theme.of(context);
    final isDark   = theme.brightness == Brightness.dark;

    return ToolScaffold(
      title: 'AI Image Upscaler',
      accentColor: _accent,
      actions: [
        if (state.sourceFile != null)
          TextButton(
            onPressed: notifier.reset,
            child: const Text('New Image', style: TextStyle(color: _accent)),
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

    return Center(
      child: Padding(
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
              'AI Image Upscaler',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Enlarge your photos up to 4× using on-device AI.\nWorks offline by default — optional cloud mode for faces.',
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
              children: const [
                FeatureBadge(icon: Icons.memory_rounded,  label: 'On-device AI', accent: _accent),
                FeatureBadge(icon: Icons.wifi_off_rounded, label: 'Offline by default', accent: _accent),
                FeatureBadge(icon: Icons.hd_rounded,       label: 'Up to 4× bigger', accent: _accent),
                FeatureBadge(icon: Icons.speed_rounded,    label: 'NNAPI accelerated', accent: _accent),
              ],
            ),
            const SizedBox(height: 36),

            // Pick buttons
            PremiumButton(
              onPressed: () => onPick(ImageSource.gallery),
              icon: Icons.photo_library_rounded,
              label: 'Choose from Gallery',
              gradient: const LinearGradient(
                colors: [_accent, _accentGlow],
              ),
            ),
            const SizedBox(height: 12),
            PremiumOutlineButton(
              onPressed: () => onPick(ImageSource.camera),
              icon: Icons.camera_alt_rounded,
              label: 'Take a Photo',
              accent: _accent,
            ),
            const SizedBox(height: 28),
            Text(
              'Best results: low-res photos, old scanned images,\nthumbnails, compressed JPEGs.',
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
            _ProcessingCard(state: state, pulseAnim: pulseAnim),

          if (state.status == UpscaleStatus.done && state.result != null)
            _ResultCard(result: state.result!, notifier: notifier),

          if (state.status == UpscaleStatus.error)
            _ErrorCard(
              message: state.errorMessage,
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
              label: 'Change Image',
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
                  label: 'Original',
                  selected: !_showAfter,
                  onTap: () => setState(() => _showAfter = false),
                ),
                _PreviewTab(
                  label: 'AI Upscaled ✨',
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
                      )
                    : Image.file(
                        widget.state.sourceFile!,
                        key: const ValueKey('before'),
                        width: double.infinity,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
              ),
              // Label badge
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    hasDone && _showAfter ? 'AI Upscaled' : 'Original',
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
  const _ProcessingCard({required this.state, required this.pulseAnim});
  final UpscalerState     state;
  final Animation<double> pulseAnim;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                          state.progressLabel.isEmpty
                              ? 'Initialising…'
                              : state.progressLabel,
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: _accent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (state.status == UpscaleStatus.loadingModel)
                          Text(
                            'Loading Real-ESRGAN model (first time only)',
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
                  alignment: Alignment.centerRight,
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
                    ? '4× upscale may take 15–60s depending on image size.'
                    : '2× upscale typically takes 5–20s.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
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
    try {
      final hasAccess = await Gal.hasAccess(toAlbum: true);
      if (!hasAccess) {
        final granted = await Gal.requestAccess(toAlbum: true);
        if (!granted) {
          messenger.showSnackBar(const SnackBar(
            content: Text('Photos permission is needed to save to your gallery.'),
          ));
          return;
        }
      }
      await Gal.putImage(result.outputFile.path, album: 'UtilityBox');
      messenger.showSnackBar(const SnackBar(
        content: Text('Saved to gallery'),
        backgroundColor: Color(0xFF22C55E),
      ));
    } on GalException catch (e) {
      messenger.showSnackBar(SnackBar(
        content: Text('Could not save: ${e.type.message}'),
      ));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('Could not save: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secs  = (result.processingMs / 1000).toStringAsFixed(1);

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
              Text(
                'Upscaled in ${secs}s ✨',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: const Color(0xFF22C55E),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Stats row
          Row(
            children: [
              _StatCol(
                label: 'Resolution',
                before: result.originalRes,
                after:  result.outputRes,
              ),
              _StatCol(
                label: 'File size',
                before: _fmtBytes(result.originalBytes),
                after:  _fmtBytes(result.outputBytes),
              ),
              _StatCol(
                label: 'Upscale',
                before: '1×',
                after:  '${result.outputWidth ~/ (result.originalWidth == 0 ? 1 : result.originalWidth)}×',
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
                    subject: 'AI Upscaled Image',
                  ),
                  icon:  const Icon(Icons.share_rounded),
                  label: const Text('Share'),
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
                  label: const Text('Download'),
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
          Text('AI Settings',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(height: 16),

          // ── Upscale factor ──────────────────────────────────────
          Text('Upscale factor',
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
                    margin: EdgeInsets.only(
                        right: f == UpscaleFactor.x2 ? 8 : 0),
                    padding: const EdgeInsets.symmetric(vertical: 14),
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
                          f.description,
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
          Text('Optimise for',
              style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: EnhanceMode.values.map((m) {
              final sel = m == state.mode;
              return ChoiceChip(
                label: Text(m.label),
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
            label: 'Pre-denoise',
            icon: Icons.blur_circular_rounded,
            tooltip: 'Reduces JPEG noise before upscaling',
            value: state.denoise,
            onChanged: notifier.setDenoise,
          ),
          const SizedBox(height: 8),

          // ── Sharpen slider ───────────────────────────────────────
          _Slider(
            label: 'Post-sharpen',
            icon: Icons.adjust_rounded,
            tooltip: 'Adds crispness after upscaling',
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
                'Cloud face enhancement',
                style: theme.textTheme.labelLarge,
              ),
              subtitle: Text(
                state.useCloud
                    ? 'Your photo is uploaded to our server for processing.'
                    : 'Off — photos stay on this device.',
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
    final accepted = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Send photos to the cloud?'),
        content: const Text(
          'Cloud mode uploads the photo you selected to our upscaling server '
          'over an encrypted connection so it can be processed with a larger '
          'AI model (GFPGAN + Real-ESRGAN).\n\n'
          '• Only the image you choose to upscale is sent.\n'
          '• The image is processed in memory and is not kept after the '
          'result is returned.\n'
          '• No account or personal details are sent with it.\n\n'
          'You can turn this off at any time. On-device mode works fully '
          'offline.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Keep on-device'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: _accent),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Enable cloud'),
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
          child: Text(label, style: theme.textTheme.bodySmall),
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
          width: 32,
          child: Text(
            '${(value * 100).round()}%',
            textAlign: TextAlign.right,
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
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.auto_awesome_rounded,
                    color: Colors.white, size: 22),
                const SizedBox(width: 10),
                Text(
                  isDone
                      ? 'Upscale Again with New Settings'
                      : 'Upscale with AI  ✨',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
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
  const _ErrorCard({required this.message, required this.onRetry});
  final String     message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                'Upscale failed',
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
            label: const Text('Retry'),
            style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFEF4444)),
          ),
        ],
      ),
    );
  }
}

// ── Small helpers ──────────────────────────────────────────────────────────

String _fmtBytes(int b) {
  if (b < 1024) return '${b}B';
  if (b < 1024 * 1024) return '${(b / 1024).toStringAsFixed(0)}KB';
  return '${(b / (1024 * 1024)).toStringAsFixed(1)}MB';
}
