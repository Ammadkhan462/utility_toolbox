import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';

/// Decorative gradient background with soft floating orbs.
class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child, this.orbs = true});

  final Widget child;
  final bool orbs;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: AppColors.screenBackgroundGradient(context),
          ),
        ),
        if (orbs) ...[
          _Orb(
            top: -40,
            right: -30,
            size: 220,
            color: isDark
                ? AppColors.brandLight.withValues(alpha: 0.18)
                : AppColors.brand.withValues(alpha: 0.22),
          ),
          _Orb(
            top: 120,
            left: -60,
            size: 180,
            color: isDark
                ? AppColors.accentCyan.withValues(alpha: 0.12)
                : AppColors.accentPink.withValues(alpha: 0.14),
          ),
          _Orb(
            bottom: 80,
            right: -20,
            size: 160,
            color: isDark
                ? AppColors.accentPink.withValues(alpha: 0.1)
                : AppColors.accentCyan.withValues(alpha: 0.16),
          ),
        ],
        child,
      ],
    );
  }
}

class _Orb extends StatelessWidget {
  const _Orb({
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.size,
    required this.color,
  });

  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 48, sigmaY: 48),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}
