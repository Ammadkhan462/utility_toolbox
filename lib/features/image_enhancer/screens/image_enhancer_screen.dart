import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/core/widgets/empty_state.dart';
import 'package:utility_toolbox/core/widgets/feature_badge.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/image_enhancer/providers/image_enhancer_providers.dart';
import 'package:utility_toolbox/features/image_enhancer/services/image_enhancer_service.dart';

const _accent = Color(0xFFDB2777); // Pink — image/creative tool
const _accentGlow = Color(0xFFF472B6);
final _enhancerService = ImageEnhancerService();

class ImageEnhancerScreen extends ConsumerWidget {
  const ImageEnhancerScreen({super.key});

  Future<void> _pickImage(WidgetRef ref, ImageSource src) async {
    final picked = await ImagePicker().pickImage(source: src, imageQuality: 95);
    if (picked == null) return;
    ref.read(sourceImageProvider.notifier).state = File(picked.path);
    ref.read(enhancerSettingsProvider.notifier).state =
        const EnhancementSettings();
    ref.read(enhancerResultProvider.notifier).state = const Idle();
  }

  Future<void> _applyEnhancements(WidgetRef ref, File source) async {
    ref.read(enhancerResultProvider.notifier).state = const Loading();
    try {
      final settings = ref.read(enhancerSettingsProvider);
      final originalSize = await source.length();
      final enhanced = await _enhancerService.enhance(
        source: source,
        settings: settings,
      );
      final enhancedSize = await enhanced.length();
      ref.read(enhancerResultProvider.notifier).state = Success(
        EnhancerResult(
          file: enhanced,
          originalBytes: originalSize,
          enhancedBytes: enhancedSize,
        ),
      );
    } catch (e) {
      ref.read(enhancerResultProvider.notifier).state = ErrorResult(
        'Enhancement failed: $e',
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = ref.watch(sourceImageProvider);
    final settings = ref.watch(enhancerSettingsProvider);
    final result = ref.watch(enhancerResultProvider);
    final isLoading = result is Loading<EnhancerResult>;
    final theme = Theme.of(context);

    return ToolScaffold(
      title: 'Image Enhancer',
      accentColor: _accent,
      body: source == null
          ? _EmptyPicker(onPick: (src) => _pickImage(ref, src))
          : Column(
              children: [
                // ── Preview ────────────────────────────────────────────
                Expanded(
                  flex: 5,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Show enhanced result if available
                      result is Success<EnhancerResult>
                          ? Image.file((result).data.file, fit: BoxFit.contain)
                          : _PreviewWithFilter(
                              source: source,
                              settings: settings,
                            ),
                      // Loading overlay
                      if (isLoading)
                        Container(
                          color: Colors.black54,
                          child: const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(color: Colors.white),
                                SizedBox(height: 12),
                                Text(
                                  'Enhancing…',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      // Change / Reset buttons
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Row(
                          children: [
                            _PreviewButton(
                              icon: Icons.refresh_rounded,
                              label: 'Reset',
                              onTap: () {
                                ref
                                        .read(enhancerSettingsProvider.notifier)
                                        .state =
                                    const EnhancementSettings();
                                ref
                                        .read(enhancerResultProvider.notifier)
                                        .state =
                                    const Idle();
                              },
                            ),
                            const SizedBox(width: 6),
                            _PreviewButton(
                              icon: Icons.photo_library_rounded,
                              label: 'Change',
                              onTap: () => _pickImage(ref, ImageSource.gallery),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Controls ───────────────────────────────────────────
                Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Result info
                        if (result is Success<EnhancerResult>)
                          _ResultBadge(result: (result).data),
                        if (result is ErrorResult<EnhancerResult>)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              (result).message,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.red,
                              ),
                            ),
                          ),

                        // ── Presets ──────────────────────────────────
                        _SectionLabel('Presets'),
                        const SizedBox(height: 8),
                        _PresetRow(
                          source: source,
                          current: settings.preset,
                          onSelect: (p) {
                            ref.read(enhancerSettingsProvider.notifier).state =
                                settings.copyWith(preset: p);
                            ref.read(enhancerResultProvider.notifier).state =
                                const Idle();
                          },
                        ),
                        const SizedBox(height: 14),

                        // ── Transform ────────────────────────────────
                        _SectionLabel('Transform'),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _TransformBtn(
                              icon: Icons.rotate_right_rounded,
                              label: 'Rotate',
                              onTap: () {
                                final newRot = (settings.rotation + 90) % 360;
                                ref
                                    .read(enhancerSettingsProvider.notifier)
                                    .state = settings.copyWith(
                                  rotation: newRot,
                                );
                                ref
                                        .read(enhancerResultProvider.notifier)
                                        .state =
                                    const Idle();
                              },
                            ),
                            const SizedBox(width: 8),
                            _TransformBtn(
                              icon: Icons.flip_rounded,
                              label: 'Flip H',
                              onTap: () {
                                ref
                                    .read(enhancerSettingsProvider.notifier)
                                    .state = settings.copyWith(
                                  flipH: !settings.flipH,
                                );
                                ref
                                        .read(enhancerResultProvider.notifier)
                                        .state =
                                    const Idle();
                              },
                              active: settings.flipH,
                            ),
                            const SizedBox(width: 8),
                            _TransformBtn(
                              icon: Icons.flip_rounded,
                              label: 'Flip V',
                              onTap: () {
                                ref
                                    .read(enhancerSettingsProvider.notifier)
                                    .state = settings.copyWith(
                                  flipV: !settings.flipV,
                                );
                                ref
                                        .read(enhancerResultProvider.notifier)
                                        .state =
                                    const Idle();
                              },
                              active: settings.flipV,
                              rotated: true,
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),

                        // ── Adjustments ──────────────────────────────
                        _SectionLabel('Adjustments'),
                        const SizedBox(height: 4),
                        _SliderRow(
                          label: 'Brightness',
                          icon: Icons.brightness_6_rounded,
                          value: settings.brightness,
                          min: -1,
                          max: 1,
                          onChanged: (v) {
                            ref.read(enhancerSettingsProvider.notifier).state =
                                settings.copyWith(brightness: v);
                            ref.read(enhancerResultProvider.notifier).state =
                                const Idle();
                          },
                        ),
                        _SliderRow(
                          label: 'Contrast',
                          icon: Icons.contrast_rounded,
                          value: settings.contrast,
                          min: -1,
                          max: 1,
                          onChanged: (v) {
                            ref.read(enhancerSettingsProvider.notifier).state =
                                settings.copyWith(contrast: v);
                            ref.read(enhancerResultProvider.notifier).state =
                                const Idle();
                          },
                        ),
                        _SliderRow(
                          label: 'Saturation',
                          icon: Icons.color_lens_rounded,
                          value: settings.saturation,
                          min: -1,
                          max: 1,
                          onChanged: (v) {
                            ref.read(enhancerSettingsProvider.notifier).state =
                                settings.copyWith(saturation: v);
                            ref.read(enhancerResultProvider.notifier).state =
                                const Idle();
                          },
                        ),
                        _SliderRow(
                          label: 'Sharpen',
                          icon: Icons.blur_off_rounded,
                          value: settings.sharpness,
                          min: 0,
                          max: 1,
                          onChanged: (v) {
                            ref.read(enhancerSettingsProvider.notifier).state =
                                settings.copyWith(sharpness: v);
                            ref.read(enhancerResultProvider.notifier).state =
                                const Idle();
                          },
                        ),
                        _SliderRow(
                          label: 'Blur',
                          icon: Icons.blur_on_rounded,
                          value: settings.blur,
                          min: 0,
                          max: 1,
                          onChanged: (v) {
                            ref.read(enhancerSettingsProvider.notifier).state =
                                settings.copyWith(blur: v);
                            ref.read(enhancerResultProvider.notifier).state =
                                const Idle();
                          },
                        ),
                        _SliderRow(
                          label: 'Quality',
                          icon: Icons.high_quality_rounded,
                          value: settings.outputQuality.toDouble(),
                          min: 20,
                          max: 100,
                          showInt: true,
                          suffix: '%',
                          onChanged: (v) {
                            ref.read(enhancerSettingsProvider.notifier).state =
                                settings.copyWith(outputQuality: v.round());
                            ref.read(enhancerResultProvider.notifier).state =
                                const Idle();
                          },
                        ),
                        const SizedBox(height: 16),

                        // ── Action buttons ───────────────────────────
                        Row(
                          children: [
                            Expanded(
                              child: PremiumButton(
                                onPressed: isLoading
                                    ? null
                                    : () => _applyEnhancements(ref, source),
                                icon: isLoading
                                    ? null
                                    : Icons.auto_fix_high_rounded,
                                label: isLoading ? 'Enhancing…' : 'Apply',
                                gradient: const LinearGradient(
                                  colors: [_accent, _accentGlow],
                                ),
                                dense: true,
                              ),
                            ),
                            if (result is Success<EnhancerResult>) ...[
                              const SizedBox(width: 10),
                              Expanded(
                                child: PremiumOutlineButton(
                                  onPressed: () => Share.shareXFiles([
                                    XFile((result).data.file.path),
                                  ]),
                                  icon: Icons.share_rounded,
                                  label: 'Share',
                                  accent: _accent,
                                  dense: true,
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

// ── Empty picker ───────────────────────────────────────────────────────────

class _EmptyPicker extends StatelessWidget {
  const _EmptyPicker({required this.onPick});

  final void Function(ImageSource) onPick;

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.photo_camera_rounded,
      gradient: const LinearGradient(colors: [_accent, _accentGlow]),
      title: 'Enhance Your Photos',
      message:
          'Adjust brightness, contrast, saturation, sharpness, apply artistic presets, rotate, and flip — all on-device.',
      badges: const [
        FeatureBadge(
          icon: Icons.auto_fix_high_rounded,
          label: 'Presets',
          accent: _accent,
        ),
        FeatureBadge(
          icon: Icons.tune_rounded,
          label: 'Fine controls',
          accent: _accent,
        ),
      ],
      action: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PremiumButton(
            onPressed: () => onPick(ImageSource.gallery),
            icon: Icons.photo_library_rounded,
            label: 'Pick from Gallery',
            gradient: const LinearGradient(colors: [_accent, _accentGlow]),
          ),
          const SizedBox(height: 12),
          PremiumOutlineButton(
            onPressed: () => onPick(ImageSource.camera),
            icon: Icons.camera_alt_rounded,
            label: 'Take a Photo',
            accent: _accent,
          ),
        ],
      ),
    );
  }
}

// ── Preview with ColorFiltered overlay ────────────────────────────────────

class _PreviewWithFilter extends StatelessWidget {
  const _PreviewWithFilter({required this.source, required this.settings});

  final File source;
  final EnhancementSettings settings;

  @override
  Widget build(BuildContext context) {
    // Use ColorFiltered for a lightweight live preview.
    // Actual pixel processing happens only on "Apply".
    final saturation =
        settings.saturation + (settings.presetDeltas['saturation'] ?? 0.0);
    final isMono = saturation <= -0.95;

    Widget child = Image.file(source, fit: BoxFit.contain);

    // Grayscale overlay for noir/mono
    if (isMono) {
      child = ColorFiltered(
        colorFilter: const ColorFilter.matrix([
          0.213,
          0.715,
          0.072,
          0,
          0,
          0.213,
          0.715,
          0.072,
          0,
          0,
          0.213,
          0.715,
          0.072,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
        ]),
        child: child,
      );
    } else if (saturation.abs() > 0.01) {
      final s = (saturation + 1.0).clamp(0.0, 2.0);
      final sr = 0.213 * (1 - s), sg = 0.715 * (1 - s), sb = 0.072 * (1 - s);
      child = ColorFiltered(
        colorFilter: ColorFilter.matrix([
          sr + s,
          sg,
          sb,
          0,
          0,
          sr,
          sg + s,
          sb,
          0,
          0,
          sr,
          sg,
          sb + s,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
        ]),
        child: child,
      );
    }

    // Warm tint overlay
    if (settings.preset == EnhancementPreset.warm) {
      child = ColorFiltered(
        colorFilter: const ColorFilter.matrix([
          1.1,
          0,
          0,
          0,
          8,
          0,
          1.0,
          0,
          0,
          0,
          0,
          0,
          0.9,
          0,
          -8,
          0,
          0,
          0,
          1,
          0,
        ]),
        child: child,
      );
    } else if (settings.preset == EnhancementPreset.cool) {
      child = ColorFiltered(
        colorFilter: const ColorFilter.matrix([
          0.9,
          0,
          0,
          0,
          -8,
          0,
          1.0,
          0,
          0,
          0,
          0,
          0,
          1.1,
          0,
          8,
          0,
          0,
          0,
          1,
          0,
        ]),
        child: child,
      );
    }

    // Apply rotation transform
    if (settings.rotation != 0) {
      child = RotatedBox(quarterTurns: settings.rotation ~/ 90, child: child);
    }

    // Apply flip
    if (settings.flipH || settings.flipV) {
      child = Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          settings.flipH ? -1.0 : 1.0,
          settings.flipV ? -1.0 : 1.0,
          1.0,
        ),
        child: child,
      );
    }

    return child;
  }
}

// ── Preset row ─────────────────────────────────────────────────────────────

class _PresetRow extends StatelessWidget {
  const _PresetRow({
    required this.source,
    required this.current,
    required this.onSelect,
  });

  final File source;
  final EnhancementPreset current;
  final ValueChanged<EnhancementPreset> onSelect;

  static const _presets = [
    (p: EnhancementPreset.original, label: 'Original', emoji: '📷'),
    (p: EnhancementPreset.vivid, label: 'Vivid', emoji: '🌈'),
    (p: EnhancementPreset.cool, label: 'Cool', emoji: '❄️'),
    (p: EnhancementPreset.warm, label: 'Warm', emoji: '🌅'),
    (p: EnhancementPreset.dramatic, label: 'Dramatic', emoji: '🎭'),
    (p: EnhancementPreset.fade, label: 'Fade', emoji: '🌫️'),
    (p: EnhancementPreset.vintage, label: 'Vintage', emoji: '📸'),
    (p: EnhancementPreset.noir, label: 'Noir', emoji: '🎞️'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _presets.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final preset = _presets[i];
          final selected = preset.p == current;
          return GestureDetector(
            onTap: () => onSelect(preset.p),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selected
                          ? _accent
                          : theme.colorScheme.outline.withValues(alpha: 0.4),
                      width: selected ? 2.5 : 1.5,
                    ),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color: _accent.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ]
                        : null,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(source, fit: BoxFit.cover),
                        // Tint overlay to hint at the filter
                        if (preset.p == EnhancementPreset.noir)
                          Container(color: Colors.black38),
                        if (preset.p == EnhancementPreset.warm)
                          Container(
                            color: const Color(
                              0xFFF97316,
                            ).withValues(alpha: 0.25),
                          ),
                        if (preset.p == EnhancementPreset.cool)
                          Container(
                            color: const Color(
                              0xFF06B6D4,
                            ).withValues(alpha: 0.25),
                          ),
                        if (preset.p == EnhancementPreset.dramatic)
                          Container(color: Colors.black26),
                        if (preset.p == EnhancementPreset.fade)
                          Container(color: Colors.white24),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  preset.label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: selected
                        ? _accent
                        : theme.colorScheme.onSurfaceVariant,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ── Small helper widgets ───────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: Theme.of(context).textTheme.labelLarge?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: 0.3,
    ),
  );
}

class _SliderRow extends StatelessWidget {
  const _SliderRow({
    required this.label,
    required this.icon,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.showInt = false,
    this.suffix = '',
  });

  final String label;
  final IconData icon;
  final double value;
  final double min;
  final double max;
  final bool showInt;
  final String suffix;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayV = showInt
        ? '${value.round()}$suffix'
        : '${(value * 100).round()}$suffix';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 8),
          SizedBox(
            width: 76,
            child: Text(label, style: theme.textTheme.bodySmall),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 3,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
              ),
              child: Slider(
                value: value.clamp(min, max),
                min: min,
                max: max,
                activeColor: _accent,
                onChanged: onChanged,
              ),
            ),
          ),
          SizedBox(
            width: 38,
            child: Text(
              displayV,
              textAlign: TextAlign.right,
              style: theme.textTheme.labelSmall?.copyWith(
                fontFamily: 'monospace',
                color: _accent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewButton extends StatelessWidget {
  const _PreviewButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}

class _TransformBtn extends StatelessWidget {
  const _TransformBtn({
    required this.icon,
    required this.label,
    required this.onTap,
    this.active = false,
    this.rotated = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool active;
  final bool rotated;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: active
                ? _accent.withValues(alpha: 0.15)
                : theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: active
                  ? _accent.withValues(alpha: 0.5)
                  : theme.colorScheme.outline.withValues(alpha: 0.4),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RotatedBox(
                quarterTurns: rotated ? 1 : 0,
                child: Icon(
                  icon,
                  size: 20,
                  color: active ? _accent : theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: active ? _accent : theme.colorScheme.onSurfaceVariant,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultBadge extends StatelessWidget {
  const _ResultBadge({required this.result});
  final EnhancerResult result;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final delta = result.deltaPercent;
    final saved = delta < 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF22C55E).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF22C55E).withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: Color(0xFF22C55E),
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Enhanced! ${_formatBytes(result.originalBytes)} → '
              '${_formatBytes(result.enhancedBytes)} '
              '(${saved ? '-' : '+'}${delta.abs().toStringAsFixed(1)}%)',
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF22C55E),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatBytes(int b) {
    if (b < 1024) return '${b}B';
    if (b < 1024 * 1024) return '${(b / 1024).toStringAsFixed(0)}KB';
    return '${(b / (1024 * 1024)).toStringAsFixed(1)}MB';
  }
}
