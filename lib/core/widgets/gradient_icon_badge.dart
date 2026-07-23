import 'package:flutter/material.dart';

/// Gradient icon badge with decorative ring — used on cards and empty states.
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
    return SizedBox(
      width: size + 16,
      height: size + 16,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size + 12,
            height: size + 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.35),
                width: 1.5,
              ),
            ),
          ),
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(size * 0.32),
              boxShadow: [
                BoxShadow(
                  color: (gradient as LinearGradient).colors.first.withValues(
                    alpha: 0.35,
                  ),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
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
