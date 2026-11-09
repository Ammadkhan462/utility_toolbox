import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import '../providers/compass_providers.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  static final _accent = AppColors.toolAccent('compass');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(compassProvider);
    final theme = Theme.of(context);

    return ToolScaffold(
      title: 'Compass',
      accentColor: _accent,
      body: Column(
        children: [
          const Spacer(),

          // ── Compass rose ──────────────────────────────────────────────
          Center(
            child: SizedBox(
              width: 280,
              height: 280,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer ring
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _accent.withValues(alpha: 0.3),
                        width: 2,
                      ),
                      color: theme.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: _accent.withValues(alpha: 0.1),
                          blurRadius: 20,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  // Rotating compass dial
                  AnimatedRotation(
                    turns: -state.heading / 360,
                    duration: const Duration(milliseconds: 120),
                    child: CustomPaint(
                      size: const Size(260, 260),
                      painter: _CompassDialPainter(
                        accent: _accent,
                        onSurface: theme.colorScheme.onSurface,
                        outline: theme.colorScheme.outlineVariant,
                      ),
                    ),
                  ),
                  // Fixed center needle indicator
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // North indicator (red tip points up = North)
                      Icon(Icons.navigation_rounded,
                          color: _accent, size: 32),
                      const SizedBox(height: 6),
                      Text(
                        state.cardinal,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: _accent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          // ── Heading readout ───────────────────────────────────────────
          Text(
            '${state.heading.toStringAsFixed(1)}°',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Heading (magnetic)',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 32),

          // ── Cardinal directions grid ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _DirectionBadge('N',  0,   state.heading, _accent),
                _DirectionBadge('NE', 45,  state.heading, _accent),
                _DirectionBadge('E',  90,  state.heading, _accent),
                _DirectionBadge('SE', 135, state.heading, _accent),
                _DirectionBadge('S',  180, state.heading, _accent),
                _DirectionBadge('SW', 225, state.heading, _accent),
                _DirectionBadge('W',  270, state.heading, _accent),
                _DirectionBadge('NW', 315, state.heading, _accent),
              ],
            ),
          ),

          const Spacer(),

          if (!state.isAvailable)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, color: Colors.orange),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Magnetometer not available on this device.',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _DirectionBadge extends StatelessWidget {
  final String dir;
  final double target;
  final double heading;
  final Color  accent;

  const _DirectionBadge(this.dir, this.target, this.heading, this.accent);

  @override
  Widget build(BuildContext context) {
    final diff = ((heading - target).abs()) % 360;
    final isActive = diff < 22.5 || diff > 337.5;
    final theme = Theme.of(context);

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: isActive ? accent : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Text(
        dir,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.white : theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

// ── Compass dial painter ──────────────────────────────────────────────────────

class _CompassDialPainter extends CustomPainter {
  final Color accent;
  final Color onSurface;
  final Color outline;

  _CompassDialPainter({
    required this.accent,
    required this.onSurface,
    required this.outline,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2 - 10;

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    // Draw tick marks and labels
    for (int i = 0; i < 360; i += 5) {
      final angle = (i - 90) * math.pi / 180;
      final isMajor = i % 45 == 0;
      final isCardinal = i % 90 == 0;
      final tickLen = isMajor ? 16.0 : 8.0;

      final outer = Offset(
        center.dx + r * math.cos(angle),
        center.dy + r * math.sin(angle),
      );
      final inner = Offset(
        center.dx + (r - tickLen) * math.cos(angle),
        center.dy + (r - tickLen) * math.sin(angle),
      );

      final paint = Paint()
        ..color = isCardinal ? accent : outline
        ..strokeWidth = isCardinal ? 2.5 : 1.0
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(inner, outer, paint);

      if (isMajor) {
        const labels = {0: 'N', 45: 'NE', 90: 'E', 135: 'SE',
                        180: 'S', 225: 'SW', 270: 'W', 315: 'NW'};
        final label = labels[i];
        if (label != null) {
          final labelOffset = Offset(
            center.dx + (r - 28) * math.cos(angle),
            center.dy + (r - 28) * math.sin(angle),
          );

          textPainter.text = TextSpan(
            text: label,
            style: TextStyle(
              color: isCardinal ? accent : onSurface.withValues(alpha: 0.7),
              fontSize: isCardinal ? 13 : 10,
              fontWeight: isCardinal ? FontWeight.bold : FontWeight.normal,
            ),
          );
          textPainter.layout();
          textPainter.paint(
            canvas,
            labelOffset - Offset(textPainter.width / 2, textPainter.height / 2),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(_CompassDialPainter old) =>
      old.accent != accent || old.onSurface != onSurface;
}
