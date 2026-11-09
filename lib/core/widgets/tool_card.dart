import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';

/// ─────────────────────────────────────────────────────────────────────────────
///  ToolCard  –  Neumorphic / Glassmorphism redesign
///
///  Visual language (matches reference screenshot):
///   • Light: soft white card with dual neumorphic shadow (dark + highlight)
///            + colourful gradient icon bubble (circular)
///   • Dark:  deep navy card with frosted-glass border + glow shadow
///            + same colourful gradient icon bubble
///   • Layout: icon top-center → label → subtitle (portrait-stack)
///   • No gradient blob; clean, minimal padding
/// ─────────────────────────────────────────────────────────────────────────────
class ToolCard extends StatefulWidget {
  const ToolCard({
    super.key,
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
    required this.gradient,
  });

  final IconData icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;
  final Gradient gradient;

  @override
  State<ToolCard> createState() => _ToolCardState();
}

class _ToolCardState extends State<ToolCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _press;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _press = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      reverseDuration: const Duration(milliseconds: 200),
      lowerBound: 0,
      upperBound: 1,
    );
    _scale = Tween<double>(begin: 1.0, end: 0.94).animate(
      CurvedAnimation(parent: _press, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _press.dispose();
    super.dispose();
  }

  Color get _accentColor =>
      (widget.gradient as LinearGradient).colors.first;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accent = _accentColor;

    return GestureDetector(
      onTapDown: (_) => _press.forward(),
      onTapUp: (_) {
        _press.reverse();
        widget.onTap();
      },
      onTapCancel: () => _press.reverse(),
      child: AnimatedBuilder(
        animation: _scale,
        builder: (context, child) => Transform.scale(
          scale: _scale.value,
          child: child,
        ),
        child: _CardBody(
          isDark: isDark,
          accent: accent,
          gradient: widget.gradient,
          icon: widget.icon,
          label: widget.label,
          subtitle: widget.subtitle,
        ),
      ),
    );
  }
}

// ── Card Body ─────────────────────────────────────────────────────────────────

class _CardBody extends StatelessWidget {
  const _CardBody({
    required this.isDark,
    required this.accent,
    required this.gradient,
    required this.icon,
    required this.label,
    required this.subtitle,
  });

  final bool isDark;
  final Color accent;
  final Gradient gradient;
  final IconData icon;
  final String label;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        // ── Light: soft white neumorphic base ──
        // ── Dark:  deep navy glass ──
        color: isDark
            ? AppColors.darkSurface
            : AppColors.lightSurface,
        border: Border.all(
          color: isDark
              ? AppColors.darkGlassBorder
              : accent.withValues(alpha: 0.10),
          width: 1.2,
        ),
        boxShadow: isDark
            ? AppColors.glowShadow(accent, blur: 22, opacity: 0.22)
            : [
                // dark lower-right shadow
                BoxShadow(
                  color: AppColors.lightShadowDark,
                  blurRadius: 14,
                  offset: const Offset(6, 6),
                ),
                // light upper-left highlight
                BoxShadow(
                  color: AppColors.lightShadowLight,
                  blurRadius: 14,
                  offset: const Offset(-6, -6),
                ),
              ],
      ),
      // ── Dark mode: subtle glass overlay ──
      child: isDark
          ? _glassOverlay(context, theme)
          : _content(context, theme),
    );
  }

  Widget _glassOverlay(BuildContext context, ThemeData theme) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Soft radial glow in top-left corner
          Positioned(
            top: -20,
            left: -20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    accent.withValues(alpha: 0.18),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          _content(context, theme),
        ],
      ),
    );
  }

  Widget _content(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Icon bubble ──────────────────────────────────────────────
          Center(
            child: _IconBubble(gradient: gradient, icon: icon, isDark: isDark),
          ),

          const SizedBox(height: 14),

          // ── Label ────────────────────────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge?.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: isDark
                    ? AppColors.darkOnSurface
                    : AppColors.lightOnSurface,
                letterSpacing: -0.1,
              ),
            ),
          ),

          const SizedBox(height: 4),

          // ── Subtitle ─────────────────────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 10.5,
                height: 1.35,
                color: isDark
                    ? AppColors.darkOnSurfaceVariant
                    : AppColors.lightOnSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Icon Bubble ───────────────────────────────────────────────────────────────

class _IconBubble extends StatelessWidget {
  const _IconBubble({
    required this.gradient,
    required this.icon,
    required this.isDark,
  });

  final Gradient gradient;
  final IconData icon;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final accent = (gradient as LinearGradient).colors.first;

    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // Outer dish: slightly lighter than card bg to mimic inset
        color: isDark
            ? AppColors.darkSurfaceVariant
            : const Color(0xFFEFF1FA),
        boxShadow: isDark
            ? [
                BoxShadow(
                  color: accent.withValues(alpha: 0.30),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : [
                // neumorphic inset look for the dish
                BoxShadow(
                  color: AppColors.lightShadowDark.withValues(alpha: 0.70),
                  blurRadius: 8,
                  offset: const Offset(4, 4),
                ),
                BoxShadow(
                  color: AppColors.lightShadowLight,
                  blurRadius: 8,
                  offset: const Offset(-4, -4),
                ),
              ],
      ),
      child: Center(
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: gradient,
            boxShadow: [
              BoxShadow(
                color: accent.withValues(alpha: isDark ? 0.45 : 0.35),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, size: 22, color: Colors.white),
        ),
      ),
    );
  }
}
