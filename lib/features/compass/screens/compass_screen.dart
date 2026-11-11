import 'dart:math' as math;
import 'package:flutter/foundation.dart' show listEquals;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';
import '../providers/compass_providers.dart';

/// Short direction labels N, NE, E … NW in the app language.
List<String> _shortDirs(AppLocalizations l) => [
      l.compassN, l.compassNE, l.compassE, l.compassSE,
      l.compassS, l.compassSW, l.compassW, l.compassNW,
    ];

/// Spoken direction names for screen readers.
List<String> _longDirs(AppLocalizations l) => [
      l.compassNorth, l.compassNortheast, l.compassEast, l.compassSoutheast,
      l.compassSouth, l.compassSouthwest, l.compassWest, l.compassNorthwest,
    ];

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  static final _accent = AppColors.toolAccent('compass');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(compassProvider);
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    final dirs = _shortDirs(l);
    final heading =
        NumberFormat('0.0', l.localeName).format(state.heading);

    return ToolScaffold(
      title: l.toolCompassTitle,
      accentColor: _accent,
      body: Column(
        children: [
          const Spacer(),

          // ── Compass rose ──────────────────────────────────────────────
          Center(
            child: Semantics(
              label: l.compassSemantics(
                NumberFormat('0', l.localeName).format(state.heading),
                _longDirs(l)[state.cardinalIndex],
              ),
              excludeSemantics: true,
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
                      // Unwrapped value: crossing North turns the short way.
                      turns: -state.rotation / 360,
                      duration: const Duration(milliseconds: 120),
                      // Cache the dial so rotating it doesn't repaint 72 ticks
                      // and 8 labels every frame.
                      child: RepaintBoundary(
                        child: CustomPaint(
                          size: const Size(260, 260),
                          painter: _CompassDialPainter(
                            labels: dirs,
                            textDirection: Directionality.of(context),
                            accent: _accent,
                            onSurface: theme.colorScheme.onSurface,
                            outline: theme.colorScheme.outlineVariant,
                          ),
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
                          dirs[state.cardinalIndex],
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
          ),

          const SizedBox(height: 32),

          // ── Heading readout ───────────────────────────────────────────
          Text(
            '$heading°',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l.compassHeadingMagnetic,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 32),

          // ── Cardinal directions grid ──────────────────────────────────
          ExcludeSemantics(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                // Fixed N → NW order, like the dial, in either text direction.
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var i = 0; i < 8; i++)
                    _DirectionBadge(dirs[i], i * 45.0, state.heading, _accent),
                ],
              ),
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
                child: Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded, color: Colors.orange),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l.compassUnavailable,
                        style: const TextStyle(color: Colors.orange),
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
      width: 34,
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: isActive ? accent : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      // Some scripts' abbreviations are wider than "NE"; shrink to fit.
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          dir,
          maxLines: 1,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

// ── Compass dial painter ──────────────────────────────────────────────────────

class _CompassDialPainter extends CustomPainter {
  /// N, NE, E … NW in the app language.
  final List<String> labels;
  final TextDirection textDirection;
  final Color accent;
  final Color onSurface;
  final Color outline;

  _CompassDialPainter({
    required this.labels,
    required this.textDirection,
    required this.accent,
    required this.onSurface,
    required this.outline,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2 - 10;

    final textPainter = TextPainter(textDirection: textDirection);

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
        final label = labels[i ~/ 45];
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

  @override
  bool shouldRepaint(_CompassDialPainter old) =>
      !listEquals(old.labels, labels) ||
      old.textDirection != textDirection ||
      old.accent != accent ||
      old.onSurface != onSurface ||
      old.outline != outline;
}
