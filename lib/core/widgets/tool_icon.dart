import 'package:flutter/material.dart';

/// Lightweight rounded-square gradient icon used across the home grid,
/// search results and sheets. Deliberately simple (one decorated box, no
/// shadows/blur) so a screen with 30+ of them stays cheap to paint.
class ToolIcon extends StatelessWidget {
  const ToolIcon({
    super.key,
    required this.icon,
    required this.colors,
    this.size = 48,
  });

  final IconData icon;
  final List<Color> colors;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.3),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: Icon(icon, color: Colors.white, size: size * 0.52),
    );
  }
}
