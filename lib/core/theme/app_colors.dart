import 'package:flutter/material.dart';

/// Shared palette, gradients, and per-tool accent colors.
class AppColors {
  // ---------------------------------------------------------------------
  // Brand
  // ---------------------------------------------------------------------
  static const brand = Color(0xFF6366F1);
  static const brandDark = Color(0xFF4F46E5);
  static const brandLight = Color(0xFF818CF8);
  static const onBrand = Color(0xFFFFFFFF);

  static const accentCyan = Color(0xFF06B6D4);
  static const accentPink = Color(0xFFEC4899);

  // ---------------------------------------------------------------------
  // Light Mode
  // ---------------------------------------------------------------------
  static const lightPrimary = brand;
  static const lightOnPrimary = onBrand;
  static const lightPrimaryContainer = Color(0xFFE0E7FF);
  static const lightOnPrimaryContainer = Color(0xFF312E81);

  static const lightSecondary = Color(0xFF0891B2);
  static const lightOnSecondary = Color(0xFFFFFFFF);
  static const lightSecondaryContainer = Color(0xFFCFFAFE);
  static const lightOnSecondaryContainer = Color(0xFF164E63);

  static const lightBackground = Color(0xFFF4F6FC);
  static const lightOnBackground = Color(0xFF0F172A);

  static const lightSurface = Color(0xFFFFFFFF);
  static const lightOnSurface = Color(0xFF0F172A);
  static const lightSurfaceVariant = Color(0xFFEEF2FF);
  static const lightOnSurfaceVariant = Color(0xFF64748B);

  static const lightOutline = Color(0xFFE2E8F0);

  // ---------------------------------------------------------------------
  // Dark Mode
  // ---------------------------------------------------------------------
  static const darkPrimary = brandLight;
  static const darkOnPrimary = Color(0xFF1E1B4B);
  static const darkPrimaryContainer = Color(0xFF3730A3);
  static const darkOnPrimaryContainer = Color(0xFFE0E7FF);

  static const darkSecondary = Color(0xFF22D3EE);
  static const darkOnSecondary = Color(0xFF083344);
  static const darkSecondaryContainer = Color(0xFF164E63);
  static const darkOnSecondaryContainer = Color(0xFFCFFAFE);

  static const darkBackground = Color(0xFF0B0F1A);
  static const darkOnBackground = Color(0xFFF1F5F9);

  static const darkSurface = Color(0xFF151B2B);
  static const darkOnSurface = Color(0xFFF1F5F9);
  static const darkSurfaceVariant = Color(0xFF1E293B);
  static const darkOnSurfaceVariant = Color(0xFF94A3B8);

  static const darkOutline = Color(0xFF334155);

  // ---------------------------------------------------------------------
  // Status
  // ---------------------------------------------------------------------
  static const error = Color(0xFFEF4444);
  static const onError = Color(0xFFFFFFFF);
  static const success = Color(0xFF22C55E);
  static const onSuccess = Color(0xFFFFFFFF);

  // ---------------------------------------------------------------------
  // Per-tool accents
  // ---------------------------------------------------------------------
  static const toolQrBarcode = Color(0xFF6366F1);
  static const toolUnitConverter = Color(0xFF3B82F6);
  static const toolPdfToolkit = Color(0xFFF97316);
  static const toolTextUtilities = Color(0xFF14B8A6);
  static const toolOcr = Color(0xFFF59E0B);
  static const toolTranslation = Color(0xFFEC4899);

  static const Map<String, Color> _toolColors = {
    'qr_barcode': toolQrBarcode,
    'unit_converter': toolUnitConverter,
    'pdf_toolkit': toolPdfToolkit,
    'text_utilities': toolTextUtilities,
    'ocr': toolOcr,
    'translation': toolTranslation,
  };

  static const Map<String, Color> _toolSecondaryColors = {
    'qr_barcode': Color(0xFF8B5CF6),
    'unit_converter': Color(0xFF06B6D4),
    'pdf_toolkit': Color(0xFFEF4444),
    'text_utilities': Color(0xFF10B981),
    'ocr': Color(0xFFFBBF24),
    'translation': Color(0xFFF472B6),
  };

  static Color toolAccent(String toolId) => _toolColors[toolId] ?? brand;

  static Color toolAccentSecondary(String toolId) =>
      _toolSecondaryColors[toolId] ?? brandLight;

  static Color toolAccentContainer(String toolId, {double opacity = 0.14}) =>
      toolAccent(toolId).withValues(alpha: opacity);

  static LinearGradient toolGradient(String toolId) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [toolAccent(toolId), toolAccentSecondary(toolId)],
    );
  }

  static LinearGradient brandGradient({bool dark = false}) {
    if (dark) {
      return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF312E81), Color(0xFF1E1B4B), Color(0xFF0B0F1A)],
      );
    }
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6), Color(0xFF06B6D4)],
    );
  }

  static LinearGradient screenBackgroundGradient(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1E1B4B), darkBackground],
        stops: [0.0, 0.45],
      );
    }
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFEEF2FF), lightBackground],
      stops: [0.0, 0.5],
    );
  }
}
