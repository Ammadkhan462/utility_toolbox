import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/widgets/gradient_icon_badge.dart';

/// Standard "nothing here yet" hero used across tool screens (pick an
/// image, start a scan, etc). Matches the home screen's premium bubble +
/// glass-pill badge language so every tool's idle state feels like part
/// of the same product.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.message,
    this.title,
    this.action,
    this.gradient,
    this.badges,
  });

  final IconData icon;
  final String message;

  /// Optional bold headline shown above [message] (e.g. the tool name).
  final String? title;
  final Widget? action;
  final Gradient? gradient;

  /// Optional row of [FeatureBadge]s shown under the message, e.g.
  /// "On-device AI", "No internet".
  final List<Widget>? badges;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final badgeGradient = gradient ??
        LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withValues(alpha: 0.7),
          ],
        );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GradientIconBadge(
              icon: icon,
              gradient: badgeGradient,
              size: 76,
              iconSize: 34,
            ),
            const SizedBox(height: 22),
            if (title != null) ...[
              Text(
                title!,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 8),
            ],
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            if (badges != null && badges!.isNotEmpty) ...[
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: badges!,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: 26),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
