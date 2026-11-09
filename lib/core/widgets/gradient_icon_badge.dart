import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';

/// ─────────────────────────────────────────────────────────────────────────────
///  GradientIconBadge  –  Neumorphic / Glassmorphism icon bubble
///
///  Same visual language as the home-screen ToolCard icon:
///   • Light: soft "dish" behind the icon with dual neumorphic shadow
///   • Dark:  frosted glass dish with a coloured glow
///   • Inner circle: gradient fill + icon, with its own drop shadow
///
///  Used by EmptyState, FeatureTile and any tool screen that wants its
///  hero icon to match the home screen's premium bubble treatment.
/// ─────────────────────────────────────────────────────────────────────────────
class GradientIconBadge extends StatelessWidget {
  const GradientIconBadge({
    super.key,
    required this.icon,
    required this.gradient,
    this.size = 56,
    this.iconSize = 28,
  });

  final IconData icon;
  final Gradient gradient;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = (gradient as LinearGradient).colors.first;
    final dishSize = size + 16;
    final innerSize = size * 0.78;

    return SizedBox(
      width: dishSize,
      height: dishSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ── Outer dish ─────────────────────────────────────────────
          Container(
            width: dishSize,
            height: dishSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? AppColors.darkSurfaceVariant
                  : const Color(0xFFEFF1FA),
              border: isDark
                  ? Border.all(color: AppColors.darkGlassBorder, width: 1)
                  : null,
              boxShadow: isDark
                  ? [
                      BoxShadow(
                        color: accent.withValues(alpha: 0.30),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: AppColors.lightShadowDark.withValues(alpha: 0.70),
                        blurRadius: 10,
                        offset: const Offset(5, 5),
                      ),
                      BoxShadow(
                        color: AppColors.lightShadowLight,
                        blurRadius: 10,
                        offset: const Offset(-5, -5),
                      ),
                    ],
            ),
          ),
          // ── Decorative ring ────────────────────────────────────────
          Container(
            width: dishSize - 6,
            height: dishSize - 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.white.withValues(alpha: 0.6),
                width: 1.5,
              ),
            ),
          ),
          // ── Gradient icon core ─────────────────────────────────────
          Container(
            width: innerSize,
            height: innerSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: gradient,
              boxShadow: [
                BoxShadow(
                  color: accent.withValues(alpha: isDark ? 0.45 : 0.35),
                  blurRadius: 14,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(icon, size: iconSize, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
