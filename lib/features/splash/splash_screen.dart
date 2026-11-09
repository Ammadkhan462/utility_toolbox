import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';

/// ─────────────────────────────────────────────────────────────────────────────
///  SplashScreen  –  Neumorphic / Glassmorphism redesign
///
///  Visual:
///   • Background: deep brand gradient (indigo → near-black)
///   • Centre: neumorphic circle plate → fades in with scale-bounce
///   • Orbiting glow rings: two concentric fading circles animate outward
///   • App name fades in below with gradient ShaderMask
///   • Tagline fades in last
/// ─────────────────────────────────────────────────────────────────────────────
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _mainCtrl;
  late final AnimationController _ringCtrl;

  late final Animation<double> _scale;
  late final Animation<double> _logoFade;
  late final Animation<double> _textFade;
  late final Animation<double> _taglineFade;
  late final Animation<double> _ringScale;
  late final Animation<double> _ringFade;

  @override
  void initState() {
    super.initState();

    // ── Main (logo + text) ──────────────────────────────────────────────
    _mainCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scale = Tween<double>(begin: 0.65, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainCtrl,
        curve: const Interval(0.0, 0.65, curve: Curves.easeOutBack),
      ),
    );
    _logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainCtrl,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _textFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainCtrl,
        curve: const Interval(0.3, 0.75, curve: Curves.easeOut),
      ),
    );
    _taglineFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainCtrl,
        curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
      ),
    );

    // ── Pulsing glow ring ───────────────────────────────────────────────
    _ringCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();

    _ringScale = Tween<double>(
      begin: 1.0,
      end: 1.55,
    ).animate(CurvedAnimation(parent: _ringCtrl, curve: Curves.easeOut));
    _ringFade = Tween<double>(
      begin: 0.45,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _ringCtrl, curve: Curves.easeOut));

    _mainCtrl.forward();

    Future.delayed(const Duration(milliseconds: 1100), () {
      if (!mounted) return;
      final hasSeenOnboarding = ref
          .read(storageServiceProvider)
          .getHasSeenOnboarding();
      context.go(hasSeenOnboarding ? AppRoutes.home : AppRoutes.onboarding);
    });
  }

  @override
  void dispose() {
    _mainCtrl.dispose();
    _ringCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2D2870), // deep indigo
              Color(0xFF0D0E1F), // near-black navy
            ],
          ),
        ),
        child: AnimatedBuilder(
          animation: Listenable.merge([_mainCtrl, _ringCtrl]),
          builder: (context, _) {
            return Stack(
              alignment: Alignment.center,
              children: [
                // ── Background decorative orbs ──────────────────────
                Positioned(
                  top: size.height * 0.08,
                  left: -60,
                  child: _GlowOrb(
                    size: 200,
                    color: AppColors.brand.withValues(alpha: 0.18),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.10,
                  right: -80,
                  child: _GlowOrb(
                    size: 240,
                    color: AppColors.accentTeal.withValues(alpha: 0.12),
                  ),
                ),

                // ── Centre content ──────────────────────────────────
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Pulsing ring + logo dish
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Outer pulse ring
                        Transform.scale(
                          scale: _ringScale.value,
                          child: Opacity(
                            opacity: _ringFade.value,
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.brand.withValues(
                                    alpha: 0.60,
                                  ),
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Logo circle (neumorphic dish on dark bg)
                        FadeTransition(
                          opacity: _logoFade,
                          child: ScaleTransition(
                            scale: _scale,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF1E1F3A),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.12),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.brand.withValues(
                                      alpha: 0.55,
                                    ),
                                    blurRadius: 30,
                                    offset: const Offset(0, 8),
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.35),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(22),
                              child: Image.asset(
                                'assets/images/app_logo.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // App name with gradient
                    FadeTransition(
                      opacity: _textFade,
                      child: ShaderMask(
                        shaderCallback: (bounds) =>
                            const LinearGradient(
                              colors: [AppColors.brand, AppColors.accentTeal],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                        blendMode: BlendMode.srcIn,
                        child: const Text(
                          'Utility Toolbox',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Tagline
                    FadeTransition(
                      opacity: _taglineFade,
                      child: Text(
                        '22 powerful tools in one app',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.55),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ── Glow Orb helper ───────────────────────────────────────────────────────────

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
          stops: const [0.0, 1.0],
        ),
      ),
    );
  }
}
