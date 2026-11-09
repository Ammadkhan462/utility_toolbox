import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';

/// ─────────────────────────────────────────────────────────────────────────────
///  GlassCard  –  Universal glassmorphic card
///
///  Light mode: frosted white glass with soft neumorphic shadow +
///              subtle gradient border, backdrop blur effect
///  Dark mode:  deep navy translucent glass with accent glow +
///              frosted border
/// ─────────────────────────────────────────────────────────────────────────────
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.accentColor,
    this.blurSigma = 12.0,
    this.fillOpacity,
    this.border,
    this.shadows,
    this.gradient,
    this.height,
    this.width,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Color? accentColor;
  final double blurSigma;
  final double? fillOpacity;
  final BoxBorder? border;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final radius = borderRadius ?? 20.0;
    final accent = accentColor ?? AppColors.brand;

    final lightFill = AppColors.lightSurface.withValues(
      alpha: fillOpacity ?? 0.85,
    );
    final darkFill = AppColors.darkGlassFill.withValues(
      alpha: fillOpacity ?? 0.6,
    );

    return Container(
      height: height,
      width: width,
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(
            height: height,
            width: width,
            padding: padding ?? const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: gradient,
              color: gradient == null
                  ? (isDark ? darkFill : lightFill)
                  : null,
              borderRadius: BorderRadius.circular(radius),
              border: border ??
                  Border.all(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.12)
                        : Colors.white.withValues(alpha: 0.7),
                    width: 1.2,
                  ),
              boxShadow: shadows ??
                  (isDark
                      ? [
                          BoxShadow(
                            color: accent.withValues(alpha: 0.15),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.30),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: AppColors.lightShadowDark.withValues(
                              alpha: 0.7,
                            ),
                            blurRadius: 16,
                            offset: const Offset(6, 6),
                          ),
                          BoxShadow(
                            color: AppColors.lightShadowLight,
                            blurRadius: 16,
                            offset: const Offset(-6, -6),
                          ),
                          BoxShadow(
                            color: accent.withValues(alpha: 0.06),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ]),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// A lighter glass panel — no backdrop blur, just a frosted surface.
/// Use for inner sections / nested cards within a GlassCard.
class FrostPanel extends StatelessWidget {
  const FrostPanel({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.accentColor,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final radius = borderRadius ?? 16.0;
    final accent = accentColor ?? AppColors.brand;

    return Container(
      padding: padding ?? const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.white.withValues(alpha: 0.60),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : accent.withValues(alpha: 0.10),
          width: 1.0,
        ),
      ),
      child: child,
    );
  }
}
