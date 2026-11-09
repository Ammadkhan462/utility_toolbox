import 'package:flutter/material.dart';

/// ─────────────────────────────────────────────────────────────────────────────
///  AppColors  –  Neumorphic / Glassmorphism redesign
///
///  Theme language (matches the reference screenshot):
///   • Light  → soft white/lavender clay,  deep inner-shadow + outer-highlight
///   • Dark   → deep navy-indigo base,  glowing purple/teal accents
///   • Cards  → pill-shaped, frosted glass with translucent white fill
///   • Icons  → colourful circular bubbles on soft-white dish
/// ─────────────────────────────────────────────────────────────────────────────
class AppColors {
  // ── Brand ──────────────────────────────────────────────────────────────────
  static const brand      = Color(0xFF7C6FFF); // electric indigo
  static const brandDark  = Color(0xFF5B4FE8);
  static const brandLight = Color(0xFFA99FFF);
  static const onBrand    = Color(0xFFFFFFFF);

  static const accentTeal = Color(0xFF00CFFF);
  static const accentPink = Color(0xFFFF6FCF);

  // ── Light Mode (neumorphic clay) ───────────────────────────────────────────
  static const lightPrimary             = brand;
  static const lightOnPrimary           = onBrand;
  static const lightPrimaryContainer    = Color(0xFFEAE8FF);
  static const lightOnPrimaryContainer  = Color(0xFF2D1F8C);
  static const lightSecondary           = Color(0xFF00B4D8);
  static const lightOnSecondary         = Color(0xFFFFFFFF);
  static const lightSecondaryContainer  = Color(0xFFCDF4FF);
  static const lightOnSecondaryContainer = Color(0xFF003E52);

  /// Base canvas: very light lavender-grey — matches screenshot bg
  static const lightBackground   = Color(0xFFECEEF8);
  static const lightOnBackground = Color(0xFF12103A);

  /// Card / sheet surface: near-white with slight blue tint
  static const lightSurface        = Color(0xFFF5F6FC);
  static const lightOnSurface      = Color(0xFF12103A);
  static const lightSurfaceVariant = Color(0xFFE8EAF6);
  static const lightOnSurfaceVariant = Color(0xFF6366A4);

  /// Neumorphic shadow colours (used directly in BoxShadow)
  static const lightShadowDark  = Color(0xFFC8CADE); // dark  side shadow
  static const lightShadowLight = Color(0xFFFFFFFF); // light side highlight

  static const lightOutline = Color(0xFFDEE0F0);

  // ── Dark Mode (deep navy + glow) ───────────────────────────────────────────
  static const darkPrimary              = Color(0xFF9B8FFF);
  static const darkOnPrimary            = Color(0xFF1A1550);
  static const darkPrimaryContainer     = Color(0xFF2E2870);
  static const darkOnPrimaryContainer   = Color(0xFFDEDAFF);
  static const darkSecondary            = Color(0xFF00DFFF);
  static const darkOnSecondary          = Color(0xFF003444);
  static const darkSecondaryContainer   = Color(0xFF00475A);
  static const darkOnSecondaryContainer = Color(0xFFB6F0FF);

  static const darkBackground    = Color(0xFF0D0E1F); // near-black indigo
  static const darkOnBackground  = Color(0xFFF0F1FF);
  static const darkSurface       = Color(0xFF14152B); // deep card bg
  static const darkOnSurface     = Color(0xFFF0F1FF);
  static const darkSurfaceVariant = Color(0xFF1E2040);
  static const darkOnSurfaceVariant = Color(0xFF8B8FCC);
  static const darkOutline        = Color(0xFF2A2C4A);

  /// Dark glass effect  – used for frosted-card overlays
  static const darkGlassFill   = Color(0x22FFFFFF); // rgba(255,255,255,0.13)
  static const darkGlassBorder = Color(0x33FFFFFF);

  // ── Status ─────────────────────────────────────────────────────────────────
  static const error     = Color(0xFFFF5C7A);
  static const onError   = Color(0xFFFFFFFF);
  static const success   = Color(0xFF2ECC8A);
  static const onSuccess = Color(0xFFFFFFFF);

  // ── Per-tool accent colours ─────────────────────────────────────────────────
  // Primary → secondary gradient pairs, kept vibrant for the icon bubbles
  static const _toolPrimary = <String, Color>{
    'ai_upscaler':        Color(0xFF7C6FFF),
    'ocr':                Color(0xFFFFB347),
    'translation':        Color(0xFFFF6FCF),
    'qr_barcode':         Color(0xFF7C6FFF),
    'wifi_qr':            Color(0xFF00CFFF),
    'unit_converter':     Color(0xFF3D9BFF),
    'hash_generator':     Color(0xFF3D9BFF),
    'color_picker':       Color(0xFFFF6FCF),
    'video_converter':    Color(0xFFFF6FCF),
    'pdf_toolkit':        Color(0xFFFF8642),
    'image_compressor':   Color(0xFF2ECC8A),
    'word_to_pdf':        Color(0xFFFF8642),
    'text_utilities':     Color(0xFF2ECC8A),
    'password_generator': Color(0xFF7C6FFF),
    'loan_calculator':    Color(0xFFFFB347),
    'wifi_speed_test':    Color(0xFF00CFFF),
    'ip_ping':            Color(0xFF9B8FFF),
    'compass':            Color(0xFFFF5C7A),
    'location_saver':     Color(0xFF3D9BFF),
    'timezone':           Color(0xFF2ECC8A),
    'image_enhancer':     Color(0xFFFF6FCF),
    'smart_clipboard':    Color(0xFF9B8FFF),
  };

  static const _toolSecondary = <String, Color>{
    'ai_upscaler':        Color(0xFF00CFFF),
    'ocr':                Color(0xFFFFD47A),
    'translation':        Color(0xFFFF99DD),
    'qr_barcode':         Color(0xFF9B8FFF),
    'wifi_qr':            Color(0xFF00DFFF),
    'unit_converter':     Color(0xFF00CFFF),
    'hash_generator':     Color(0xFF00CFFF),
    'color_picker':       Color(0xFFFF99DD),
    'video_converter':    Color(0xFFFF99DD),
    'pdf_toolkit':        Color(0xFFFF5C7A),
    'image_compressor':   Color(0xFF2EEAAA),
    'word_to_pdf':        Color(0xFFFFB347),
    'text_utilities':     Color(0xFF2EEAAA),
    'password_generator': Color(0xFF9B8FFF),
    'loan_calculator':    Color(0xFFFFD47A),
    'wifi_speed_test':    Color(0xFF38E8FF),
    'ip_ping':            Color(0xFFB9AFFF),
    'compass':            Color(0xFFFF8CA0),
    'location_saver':     Color(0xFF70B8FF),
    'timezone':           Color(0xFF55F0AA),
    'image_enhancer':     Color(0xFFFFAFE0),
    'smart_clipboard':    Color(0xFFB9AFFF),
  };

  static Color toolAccent(String id) => _toolPrimary[id] ?? brand;
  static Color toolAccentSecondary(String id) => _toolSecondary[id] ?? brandLight;

  static Color toolAccentContainer(String id, {double opacity = 0.14}) =>
      toolAccent(id).withValues(alpha: opacity);

  static LinearGradient toolGradient(String id) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [toolAccent(id), toolAccentSecondary(id)],
      );

  // ── Neumorphic shadow helper ───────────────────────────────────────────────
  /// Returns the standard light-mode neumorphic double-shadow pair.
  static List<BoxShadow> neumorphicShadow({
    double blur = 16,
    double spread = 0,
    Offset darkOffset = const Offset(6, 6),
    Offset lightOffset = const Offset(-6, -6),
  }) =>
      [
        BoxShadow(
          color: lightShadowDark,
          blurRadius: blur,
          spreadRadius: spread,
          offset: darkOffset,
        ),
        BoxShadow(
          color: lightShadowLight,
          blurRadius: blur,
          spreadRadius: spread,
          offset: lightOffset,
        ),
      ];

  /// Returns dark-mode glow shadow (single accent glow).
  static List<BoxShadow> glowShadow(Color accent, {double blur = 20, double opacity = 0.35}) =>
      [
        BoxShadow(
          color: accent.withValues(alpha: opacity),
          blurRadius: blur,
          offset: const Offset(0, 8),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.35),
          blurRadius: blur * 0.6,
          offset: const Offset(0, 4),
        ),
      ];

  // ── Brand gradient ─────────────────────────────────────────────────────────
  static LinearGradient brandGradient({bool dark = false}) {
    if (dark) {
      return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF2D2870), Color(0xFF0D0E1F)],
      );
    }
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF7C6FFF), Color(0xFF00CFFF)],
    );
  }

  static LinearGradient screenBackgroundGradient(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A1550), darkBackground],
        stops: [0.0, 0.5],
      );
    }
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFE8E9F8), lightBackground],
      stops: [0.0, 0.6],
    );
  }
}
