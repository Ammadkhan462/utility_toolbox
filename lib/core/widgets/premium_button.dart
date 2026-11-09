import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';

/// ─────────────────────────────────────────────────────────────────────────────
///  PremiumButton  –  gradient CTA matching the home-screen hero/card language
///
///  Use as the primary action on any tool screen (start scan, pick image,
///  generate, upscale, etc.) instead of the flat FilledButton so every tool's
///  main call-to-action shares the same glow + gradient treatment as the
///  home screen's hero banner and tool cards.
/// ─────────────────────────────────────────────────────────────────────────────
class PremiumButton extends StatelessWidget {
  const PremiumButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.gradient,
    this.accent,
    this.expanded = true,
    this.dense = false,
  }) : assert(gradient != null || accent != null,
            'Provide either a gradient or an accent colour');

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  /// Explicit gradient. If omitted, built from [accent].
  final Gradient? gradient;

  /// Single accent colour — a two-stop gradient is derived from it.
  final Color? accent;

  final bool expanded;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final resolvedGradient = gradient ??
        LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [accent!, accent!.withValues(alpha: 0.75)],
        );
    final gradientColors = resolvedGradient is LinearGradient
        ? resolvedGradient.colors
        : const <Color>[];
    final glowColor = gradientColors.isNotEmpty
        ? gradientColors.first
        : (accent ?? AppColors.brand);
    final disabled = onPressed == null;

    final button = Container(
      width: expanded ? double.infinity : null,
      decoration: BoxDecoration(
        gradient: disabled
            ? LinearGradient(colors: [
                glowColor.withValues(alpha: 0.35),
                glowColor.withValues(alpha: 0.25),
              ])
            : resolvedGradient,
        borderRadius: BorderRadius.circular(18),
        boxShadow: disabled
            ? []
            : [
                BoxShadow(
                  color: glowColor.withValues(alpha: 0.38),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: dense ? 12 : 17,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: Colors.white, size: dense ? 18 : 21),
                  const SizedBox(width: 10),
                ],
                Flexible(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: dense ? 14 : 15.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return expanded ? button : IntrinsicWidth(child: button);
  }
}

/// Secondary/outlined counterpart to [PremiumButton] — tinted glass fill
/// with an accent-coloured border, used for secondary actions that sit
/// next to a PremiumButton (e.g. "Take a Photo" next to "Choose from
/// Gallery", or "Change Image").
class PremiumOutlineButton extends StatelessWidget {
  const PremiumOutlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.accent,
    this.icon,
    this.expanded = true,
    this.dense = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color accent;
  final IconData? icon;
  final bool expanded;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final button = Container(
      width: expanded ? double.infinity : null,
      decoration: BoxDecoration(
        color: accent.withValues(alpha: isDark ? 0.14 : 0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withValues(alpha: 0.55), width: 1.4),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: dense ? 12 : 17,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: accent, size: dense ? 18 : 21),
                  const SizedBox(width: 10),
                ],
                Flexible(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: accent,
                      fontSize: dense ? 14 : 15.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return expanded ? button : IntrinsicWidth(child: button);
  }
}
