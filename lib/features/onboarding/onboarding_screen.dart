import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// ─────────────────────────────────────────────────────────────────────────────
///  OnboardingScreen  –  First-launch tutorial slideshow
///
///  Shown exactly once, right after the splash screen, the very first time
///  a user opens the app (gated by `StorageService.getHasSeenOnboarding`).
///
///  Visual language matches SplashScreen / the app's neumorphic-glass theme:
///   • Deep indigo → near-black gradient canvas, per-slide tinted glow orbs
///   • Floating gradient "icon cluster" hero per slide (no external assets
///     required — built entirely from Material icons + gradients + blur)
///   • Frosted glass CTA pill button, worm-style page indicator
///   • Swipeable PageView with a staggered fade/slide-up entrance animation
///     for each slide's content
/// ─────────────────────────────────────────────────────────────────────────────
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _page = 0;

  /// Three short slides: what it is, the "works from any app" habit hook,
  /// and the privacy promise. Fewer slides = more people reach the app.
  List<_OnboardingPageData> _pagesFor(AppLocalizations l) => [
    _OnboardingPageData(
      icons: const [
        Icons.document_scanner_rounded,
        Icons.qr_code_scanner_rounded,
        Icons.picture_as_pdf_rounded,
      ],
      colors: const [AppColors.brand, AppColors.accentTeal],
      title: l.onboarding1Title,
      subtitle: l.onboarding1Body,
    ),
    _OnboardingPageData(
      icons: const [
        Icons.share_rounded,
        Icons.translate_rounded,
        Icons.touch_app_rounded,
      ],
      colors: const [AppColors.accentPink, AppColors.brand],
      title: l.onboarding2Title,
      subtitle: l.onboarding2Body,
    ),
    _OnboardingPageData(
      icons: const [
        Icons.verified_user_rounded,
        Icons.offline_bolt_rounded,
        Icons.flash_on_rounded,
      ],
      colors: const [AppColors.success, AppColors.accentTeal],
      title: l.onboarding3Title,
      subtitle: l.onboarding3Body,
      isLast: true,
    ),
  ];

  static const _pageCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool _finishing = false;

  Future<void> _finish() async {
    // Skip + Get started (or a double tap) must only navigate once.
    if (_finishing) return;
    _finishing = true;
    try {
      await ref.read(storageServiceProvider).setHasSeenOnboarding(true);
    } catch (_) {
      // A failed prefs write shouldn't trap the user on this screen; worst
      // case they see onboarding once more next launch.
    }
    if (mounted) context.go(AppRoutes.home);
  }

  void _next() {
    if (_page == _pageCount - 1) {
      _finish();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 420),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _back() {
    if (_page == 0) return;
    _pageController.previousPage(
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final l = AppLocalizations.of(context);
    final pages = _pagesFor(l);
    final data = pages[_page];
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            )
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
            ),
      // System back steps to the previous slide instead of closing the app.
      child: PopScope(
        canPop: _page == 0,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) _back();
        },
        child: Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            // Same brand gradient as the splash screen — deep indigo→navy at
            // night, vivid indigo→teal by day — so the two screens feel like
            // one continuous, theme-correct sequence.
            decoration: BoxDecoration(
              gradient: AppColors.brandGradient(dark: isDark),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // ── Ambient glow orbs — tint animates with the active slide ──
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  top: -70,
                  left: _page.isEven ? -70 : size.width - 170,
                  child: _GlowOrb(
                    size: 240,
                    color: Colors.white.withValues(alpha: isDark ? 0.14 : 0.20),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  bottom: -60,
                  right: _page.isEven ? -60 : size.width - 160,
                  child: _GlowOrb(
                    size: 220,
                    color: Colors.white.withValues(alpha: isDark ? 0.10 : 0.16),
                  ),
                ),

                SafeArea(
                  child: Column(
                    children: [
                      // ── Top bar: progress + skip ─────────────────────────
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 20, 0),
                        child: Row(
                          children: [
                            Text(
                              '${_page + 1} / ${pages.length}',
                              style: TextStyle(
                                color: Colors.white.withValues(
                                  alpha: isDark ? 0.45 : 0.75,
                                ),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const Spacer(),
                            AnimatedOpacity(
                              opacity: data.isLast ? 0.0 : 1.0,
                              duration: const Duration(milliseconds: 250),
                              child: IgnorePointer(
                                ignoring: data.isLast,
                                child: TextButton(
                                  onPressed: _finish,
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white.withValues(
                                      alpha: isDark ? 0.7 : 0.9,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 8,
                                    ),
                                  ),
                                  child: Text(
                                    l.onboardingSkip,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ── Slides ────────────────────────────────────────────
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: pages.length,
                          onPageChanged: (i) => setState(() => _page = i),
                          itemBuilder: (context, i) =>
                              _SlideContent(data: pages[i], isDark: isDark),
                        ),
                      ),

                      // ── Page indicator ───────────────────────────────────
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(pages.length, (i) {
                          final active = i == _page;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 280),
                            curve: Curves.easeOut,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: active ? 26 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: active
                                  ? LinearGradient(colors: data.colors)
                                  : null,
                              color: active
                                  ? null
                                  : Colors.white.withValues(
                                      alpha: isDark ? 0.25 : 0.35,
                                    ),
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 28),

                      // ── Bottom controls: back + CTA ──────────────────────
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                        child: Row(
                          children: [
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 220),
                              opacity: _page == 0 ? 0.0 : 1.0,
                              child: IgnorePointer(
                                ignoring: _page == 0,
                                child: _GlassCircleButton(
                                  icon: Icons.arrow_back_rounded,
                                  isDark: isDark,
                                  onTap: _back,
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: _GradientCtaButton(
                                label: data.isLast
                                    ? l.onboardingStart
                                    : l.onboardingNext,
                                icon: data.isLast
                                    ? Icons.check_rounded
                                    : Icons.arrow_forward_rounded,
                                colors: data.colors,
                                onTap: _next,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Slide data ─────────────────────────────────────────────────────────────

class _OnboardingPageData {
  const _OnboardingPageData({
    required this.icons,
    required this.colors,
    required this.title,
    required this.subtitle,
    this.isLast = false,
  });

  final List<IconData> icons;
  final List<Color> colors;
  final String title;
  final String subtitle;
  final bool isLast;
}

// ── Slide content (icon cluster + copy) with staggered entrance ────────────

class _SlideContent extends StatefulWidget {
  const _SlideContent({required this.data, required this.isDark});

  final _OnboardingPageData data;
  final bool isDark;

  @override
  State<_SlideContent> createState() => _SlideContentState();
}

class _SlideContentState extends State<_SlideContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _clusterFade;
  late final Animation<double> _clusterScale;
  late final Animation<double> _titleFade;
  late final Animation<Offset> _titleSlide;
  late final Animation<double> _subtitleFade;
  late final Animation<Offset> _subtitleSlide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _clusterFade = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.0, 0.55, curve: Curves.easeOut),
    );
    _clusterScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );
    _titleFade = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.25, 0.75, curve: Curves.easeOut),
    );
    _titleSlide = Tween<Offset>(begin: const Offset(0, 0.25), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _ctrl,
            curve: const Interval(0.25, 0.75, curve: Curves.easeOut),
          ),
        );
    _subtitleFade = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.45, 1.0, curve: Curves.easeOut),
    );
    _subtitleSlide =
        Tween<Offset>(begin: const Offset(0, 0.25), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _ctrl,
            curve: const Interval(0.45, 1.0, curve: Curves.easeOut),
          ),
        );

    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            FadeTransition(
              opacity: _clusterFade,
              child: ScaleTransition(
                scale: _clusterScale,
                child: _IconCluster(icons: data.icons, colors: data.colors),
              ),
            ),
            const SizedBox(height: 44),
            FadeTransition(
              opacity: _titleFade,
              child: SlideTransition(
                position: _titleSlide,
                child: Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    height: 1.2,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeTransition(
              opacity: _subtitleFade,
              child: SlideTransition(
                position: _subtitleSlide,
                child: Text(
                  data.subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withValues(
                      alpha: widget.isDark ? 0.62 : 0.85,
                    ),
                    fontSize: 15,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Floating gradient icon cluster (hero illustration, no assets needed) ───

class _IconCluster extends StatelessWidget {
  const _IconCluster({required this.icons, required this.colors});

  final List<IconData> icons;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Soft glow behind the whole cluster. A radial gradient looks the
          // same as a blurred disc but costs nothing on low-end GPUs.
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  colors[0].withValues(alpha: 0.45),
                  colors[0].withValues(alpha: 0),
                ],
              ),
            ),
          ),
          // Decorative ring
          Container(
            width: 190,
            height: 190,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.10),
                width: 1.4,
              ),
            ),
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.14),
                width: 1.2,
              ),
            ),
          ),

          // Satellite icon — top-left
          Positioned(
            top: 4,
            left: 6,
            child: _Bubble(
              icon: icons[1],
              size: 54,
              iconSize: 24,
              gradient: LinearGradient(colors: [colors[1], colors[0]]),
              glow: colors[1],
            ),
          ),
          // Satellite icon — bottom-right
          Positioned(
            bottom: 2,
            right: 2,
            child: _Bubble(
              icon: icons[2],
              size: 50,
              iconSize: 22,
              gradient: LinearGradient(colors: [colors[0], colors[1]]),
              glow: colors[0],
            ),
          ),
          // Main centre icon
          _Bubble(
            icon: icons[0],
            size: 96,
            iconSize: 42,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ),
            glow: colors[0],
            elevated: true,
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    required this.icon,
    required this.size,
    required this.iconSize,
    required this.gradient,
    required this.glow,
    this.elevated = false,
  });

  final IconData icon;
  final double size;
  final double iconSize;
  final Gradient gradient;
  final Color glow;
  final bool elevated;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.25),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: glow.withValues(alpha: elevated ? 0.55 : 0.4),
            blurRadius: elevated ? 28 : 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Icon(icon, size: iconSize, color: Colors.white),
    );
  }
}

// ── Glow orb (background ambience) ──────────────────────────────────────────

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // Radial gradient instead of ImageFiltered blur: the orbs move on every
    // page change, and re-blurring them each frame janks low-end phones.
    return Container(
      width: size * 1.4,
      height: size * 1.4,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withValues(alpha: 0)],
          stops: const [0.35, 1.0],
        ),
      ),
    );
  }
}

// ── Buttons ──────────────────────────────────────────────────────────────

class _GradientCtaButton extends StatelessWidget {
  const _GradientCtaButton({
    required this.label,
    required this.icon,
    required this.colors,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final List<Color> colors;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        gradient: LinearGradient(colors: colors),
        boxShadow: [
          BoxShadow(
            color: colors[0].withValues(alpha: 0.45),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(29),
          onTap: onTap,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Text(
                    label,
                    key: ValueKey(label),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Icon(icon, color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassCircleButton extends StatelessWidget {
  const _GlassCircleButton({
    required this.icon,
    required this.onTap,
    required this.isDark,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(29),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: isDark ? 0.08 : 0.16),
            border: Border.all(
              color: Colors.white.withValues(alpha: isDark ? 0.16 : 0.30),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onTap,
              child: Icon(
                icon,
                color: Colors.white.withValues(alpha: isDark ? 0.85 : 0.95),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
