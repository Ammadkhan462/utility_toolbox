import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/constants/app_constants.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/app_background.dart';
import 'package:utility_toolbox/core/widgets/banner_ad_widget.dart';
import 'package:utility_toolbox/features/home/widgets/tool_grid.dart';

/// ─────────────────────────────────────────────────────────────────────────────
///  HomeScreen  –  Neumorphic / Glassmorphism redesign
///
///  Layout (top → bottom):
///   [SafeArea]
///     _HomeAppBar         – logo · title · settings pill
///     _HeroBanner         – gradient card (indigo→teal), tool count + icon
///     ToolGrid (expanded) – search · category chips · 2-col grid
///     BannerAdWidget
/// ─────────────────────────────────────────────────────────────────────────────
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              _HomeAppBar(isDark: isDark),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
                child: _HeroBanner(isDark: isDark),
              ),
              const Expanded(child: ToolGrid()),
              SafeArea(
                top: false,
                child: Center(child: BannerAdWidget(placement: 'home')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── App Bar ───────────────────────────────────────────────────────────────────

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Logo: neumorphic circle dish ──────────────────────────
          _NeuCircle(
            size: 44,
            isDark: isDark,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/app_logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // ── Title column ──────────────────────────────────────────
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome back 👋',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isDark
                      ? AppColors.darkOnSurfaceVariant
                      : AppColors.lightOnSurfaceVariant,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              ShaderMask(
                shaderCallback: (bounds) =>
                    const LinearGradient(
                      colors: [AppColors.brand, AppColors.accentTeal],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                blendMode: BlendMode.srcIn,
                child: Text(
                  AppConstants.appName,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    letterSpacing: -0.4,
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          // ── Settings button ───────────────────────────────────────
          _SettingsButton(
            isDark: isDark,
            onTap: () => context.push(AppRoutes.settings),
          ),
        ],
      ),
    );
  }
}

// ── Settings Button ───────────────────────────────────────────────────────────

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({required this.isDark, required this.onTap});

  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: _NeuCircle(
        size: 44,
        isDark: isDark,
        child: Icon(
          Icons.settings_rounded,
          size: 20,
          color: isDark
              ? AppColors.darkOnSurfaceVariant
              : AppColors.lightOnSurfaceVariant,
        ),
      ),
    );
  }
}

// ── Hero Banner ───────────────────────────────────────────────────────────────

class _HeroBanner extends StatefulWidget {
  const _HeroBanner({required this.isDark});

  final bool isDark;

  @override
  State<_HeroBanner> createState() => _HeroBannerState();
}

class _HeroBannerState extends State<_HeroBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 7),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = widget.isDark;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value; // loops 0 → 1
        final bob = math.sin(t * 2 * math.pi) * 5; // gentle orb float
        // Sheen sweeps from off-card-left to off-card-right once per loop,
        // then holds off-screen for the rest — a single tasteful glint
        // rather than a distracting constant shimmer.
        final sheenProgress = (t * 2.2).clamp(0.0, 1.0);
        final sheenX = -0.6 + sheenProgress * 2.2;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6E5BFF), Color(0xFF3AA8FF), Color(0xFF00D4FF)],
              stops: [0.0, 0.55, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.16),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(
                  0xFF6E5BFF,
                ).withValues(alpha: isDark ? 0.45 : 0.32),
                blurRadius: 34,
                offset: const Offset(0, 16),
              ),
              BoxShadow(
                color: const Color(
                  0xFF00D4FF,
                ).withValues(alpha: isDark ? 0.18 : 0.14),
                blurRadius: 50,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // ── Floating decorative orbs (depth) ────────────────────
                Positioned(
                  top: -34 + bob,
                  right: -20,
                  child: _Orb(size: 130, opacity: 0.10),
                ),
                Positioned(
                  bottom: -50 - bob,
                  left: -30,
                  child: _Orb(size: 140, opacity: 0.07),
                ),

                // ── One-shot diagonal glass sheen ───────────────────────
                Positioned.fill(
                  child: IgnorePointer(
                    child: Align(
                      alignment: Alignment(sheenX, -1),
                      child: Transform.rotate(
                        angle: -0.55,
                        child: Container(
                          width: 60,
                          height: 340,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withValues(alpha: 0),
                                Colors.white.withValues(alpha: 0.22),
                                Colors.white.withValues(alpha: 0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ── Content ─────────────────────────────────────────────
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ── Glass pill badge with breathing dot ──────
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.18),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.28),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _BreathingDot(t: t),
                                  const SizedBox(width: 6),
                                  Text(
                                    '22 Tools Available',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              'Your Daily\nToolkit',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                height: 1.15,
                                fontSize: 29,
                                letterSpacing: -0.4,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withValues(alpha: 0.15),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 9),

                            Text(
                              'Scan, convert, edit & translate\nin one beautiful app.',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white.withValues(alpha: 0.85),
                                height: 1.5,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // ── Animated sparkle icon cluster ────────────────
                    _SparkleCluster(t: t),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Soft frosted decorative circle.
class _Orb extends StatelessWidget {
  const _Orb({required this.size, required this.opacity});
  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: opacity),
      ),
    );
  }
}

/// Pill-badge status dot with a soft breathing glow.
class _BreathingDot extends StatelessWidget {
  const _BreathingDot({required this.t});
  final double t;

  @override
  Widget build(BuildContext context) {
    final pulse = (math.sin(t * 2 * math.pi * 2.5) + 1) / 2; // 0..1, faster
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: const Color(0xFF7EFFD4),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7EFFD4).withValues(alpha: 0.5 + pulse * 0.5),
            blurRadius: 3 + pulse * 4,
            spreadRadius: pulse * 1.5,
          ),
        ],
      ),
    );
  }
}

/// Layered glass orb with a gently breathing core icon and three
/// independently-twinkling sparkles — replaces the old flat static circle.
class _SparkleCluster extends StatelessWidget {
  const _SparkleCluster({required this.t});
  final double t;

  @override
  Widget build(BuildContext context) {
    final corePulse = (math.sin(t * 2 * math.pi) + 1) / 2; // 0..1
    final coreScale = 1.0 + corePulse * 0.06;

    return SizedBox(
      width: 108,
      height: 108,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Secondary, smaller offset circle for layered depth.
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.10),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.18),
                  width: 1,
                ),
              ),
            ),
          ),

          // Main glowing orb with the core icon.
          Positioned(
            right: 0,
            top: 2,
            child: Transform.scale(
              scale: coreScale,
              child: Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withValues(alpha: 0.30),
                      Colors.white.withValues(alpha: 0.14),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.32),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withValues(
                        alpha: 0.10 + corePulse * 0.10,
                      ),
                      blurRadius: 18 + corePulse * 10,
                      spreadRadius: corePulse * 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.auto_awesome_rounded,
                  color: Colors.white,
                  size: 38,
                ),
              ),
            ),
          ),

          // Twinkling sparkles, each on its own phase.
          _Twinkle(t: t, phase: 0.0, dx: 4, dy: -8, size: 15),
          _Twinkle(t: t, phase: 0.35, dx: 86, dy: 64, size: 11),
          _Twinkle(t: t, phase: 0.65, dx: 2, dy: 74, size: 9),
        ],
      ),
    );
  }
}

class _Twinkle extends StatelessWidget {
  const _Twinkle({
    required this.t,
    required this.phase,
    required this.dx,
    required this.dy,
    required this.size,
  });

  final double t;
  final double phase;
  final double dx;
  final double dy;
  final double size;

  @override
  Widget build(BuildContext context) {
    // Each sparkle blinks on/off during its own slice of the loop, so the
    // three never twinkle in lockstep.
    final local = ((t + phase) % 1.0);
    final visible = local < 0.5;
    final localT = visible ? local / 0.5 : 0.0;
    final opacity = visible ? math.sin(localT * math.pi) : 0.0;

    return Positioned(
      left: dx,
      top: dy,
      child: Opacity(
        opacity: opacity.clamp(0.0, 1.0),
        child: Icon(
          Icons.auto_awesome_rounded,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}

// ── Neumorphic Circle Helper ──────────────────────────────────────────────────

/// Reusable neumorphic (light) or glass (dark) circular container.
class _NeuCircle extends StatelessWidget {
  const _NeuCircle({
    required this.size,
    required this.isDark,
    required this.child,
  });

  final double size;
  final bool isDark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDark ? AppColors.darkSurfaceVariant : AppColors.lightSurface,
        border: isDark
            ? Border.all(color: AppColors.darkGlassBorder, width: 1)
            : null,
        boxShadow: isDark
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.30),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : [
                BoxShadow(
                  color: AppColors.lightShadowDark,
                  blurRadius: 10,
                  offset: const Offset(4, 4),
                ),
                BoxShadow(
                  color: AppColors.lightShadowLight,
                  blurRadius: 10,
                  offset: const Offset(-4, -4),
                ),
              ],
      ),
      child: Center(child: child),
    );
  }
}
