import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/tools/tool_input.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Job-oriented categories, ordered by how often people come for them.
enum ToolCategory { scan, pdf, image, text, calc, network, device, security, media }

extension ToolCategoryL10n on ToolCategory {
  String label(AppLocalizations l) => switch (this) {
    ToolCategory.scan => l.catScan,
    ToolCategory.pdf => l.catPdf,
    ToolCategory.image => l.catImage,
    ToolCategory.text => l.catText,
    ToolCategory.calc => l.catCalc,
    ToolCategory.network => l.catNetwork,
    ToolCategory.device => l.catDevice,
    ToolCategory.security => l.catSecurity,
    ToolCategory.media => l.catMedia,
  };

  IconData get icon => switch (this) {
    ToolCategory.scan => Icons.qr_code_scanner_rounded,
    ToolCategory.pdf => Icons.picture_as_pdf_rounded,
    ToolCategory.image => Icons.image_rounded,
    ToolCategory.text => Icons.translate_rounded,
    ToolCategory.calc => Icons.calculate_rounded,
    ToolCategory.network => Icons.wifi_rounded,
    ToolCategory.device => Icons.explore_rounded,
    ToolCategory.security => Icons.shield_rounded,
    ToolCategory.media => Icons.movie_rounded,
  };
}

typedef L10nText = String Function(AppLocalizations l);

/// One entry per tool. Everything that lists, searches, launches or links
/// to a tool (home grid, search, favorites, recents, launcher shortcuts,
/// pinned shortcuts, the share-in sheet, deep links) reads from here, so a
/// new tool only has to be registered once.
class ToolDefinition {
  const ToolDefinition({
    required this.id,
    required this.route,
    required this.icon,
    required this.category,
    required this.colors,
    required this.title,
    required this.description,
    required this.keywords,
    this.accepts = const {},
    this.acceptsMultiple = false,
    this.isNew = false,
  });

  /// Stable id: persisted in favorites/recents and used in deep links
  /// (`utilitytoolbox://tool/<id>`). Never rename an existing id.
  final String id;
  final String route;
  final IconData icon;
  final ToolCategory category;

  /// Gradient pair for the icon bubble.
  final List<Color> colors;

  final L10nText title;
  final L10nText description;

  /// Localized, comma-separated search words (includes English words).
  final L10nText keywords;

  /// Content kinds this tool can be launched with via [ToolInput].
  final Set<InputKind> accepts;
  final bool acceptsMultiple;
  final bool isNew;

  Color get accent => colors.first;

  LinearGradient get gradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: colors,
  );
}

class ToolRegistry {
  ToolRegistry._();

  static const _orange = [Color(0xFFFF8642), Color(0xFFFF5C7A)];
  static const _indigo = [Color(0xFF7C6FFF), Color(0xFF9B8FFF)];
  static const _cyan = [Color(0xFF00B4D8), Color(0xFF38E8FF)];
  static const _green = [Color(0xFF2ECC8A), Color(0xFF2EEAAA)];
  static const _pink = [Color(0xFFFF6FCF), Color(0xFFFF99DD)];
  static const _blue = [Color(0xFF3D9BFF), Color(0xFF00CFFF)];
  static const _amber = [Color(0xFFFFA726), Color(0xFFFFD47A)];
  static const _violet = [Color(0xFF7C6FFF), Color(0xFF00CFFF)];
  static const _red = [Color(0xFFFF5C7A), Color(0xFFFF8CA0)];

  static final List<ToolDefinition> all = [
    // ── Scan & QR ─────────────────────────────────────────────────────────
    ToolDefinition(
      id: 'doc_scanner',
      route: AppRoutes.docScanner,
      icon: Icons.document_scanner_rounded,
      category: ToolCategory.scan,
      colors: _orange,
      title: (l) => l.toolDocScannerTitle,
      description: (l) => l.toolDocScannerDesc,
      keywords: (l) => l.toolDocScannerKeywords,
      isNew: true,
    ),
    ToolDefinition(
      id: 'qr_scanner',
      route: AppRoutes.qrScanner,
      icon: Icons.qr_code_scanner_rounded,
      category: ToolCategory.scan,
      colors: _indigo,
      title: (l) => l.toolQrScannerTitle,
      description: (l) => l.toolQrScannerDesc,
      keywords: (l) => l.toolQrScannerKeywords,
      accepts: const {InputKind.image},
    ),
    ToolDefinition(
      id: 'qr_generator',
      route: AppRoutes.qrGenerator,
      icon: Icons.qr_code_2_rounded,
      category: ToolCategory.scan,
      colors: _violet,
      title: (l) => l.toolQrGeneratorTitle,
      description: (l) => l.toolQrGeneratorDesc,
      keywords: (l) => l.toolQrGeneratorKeywords,
      accepts: const {InputKind.text},
    ),
    ToolDefinition(
      id: 'ocr',
      route: AppRoutes.ocr,
      icon: Icons.text_snippet_rounded,
      category: ToolCategory.scan,
      colors: _amber,
      title: (l) => l.toolOcrTitle,
      description: (l) => l.toolOcrDesc,
      keywords: (l) => l.toolOcrKeywords,
      accepts: const {InputKind.image},
    ),
    ToolDefinition(
      id: 'wifi_qr',
      route: AppRoutes.wifiQr,
      icon: Icons.wifi_password_rounded,
      category: ToolCategory.scan,
      colors: _cyan,
      title: (l) => l.toolWifiQrTitle,
      description: (l) => l.toolWifiQrDesc,
      keywords: (l) => l.toolWifiQrKeywords,
    ),

    // ── PDF ───────────────────────────────────────────────────────────────
    ToolDefinition(
      id: 'image_to_pdf',
      route: AppRoutes.pdfImageToPdf,
      icon: Icons.picture_as_pdf_rounded,
      category: ToolCategory.pdf,
      colors: _orange,
      title: (l) => l.toolImageToPdfTitle,
      description: (l) => l.toolImageToPdfDesc,
      keywords: (l) => l.toolImageToPdfKeywords,
      accepts: const {InputKind.image},
      acceptsMultiple: true,
    ),
    ToolDefinition(
      id: 'merge_pdf',
      route: AppRoutes.pdfMerge,
      icon: Icons.merge_type_rounded,
      category: ToolCategory.pdf,
      colors: _red,
      title: (l) => l.toolMergePdfTitle,
      description: (l) => l.toolMergePdfDesc,
      keywords: (l) => l.toolMergePdfKeywords,
      accepts: const {InputKind.pdf},
      acceptsMultiple: true,
    ),
    ToolDefinition(
      id: 'compress_pdf',
      route: AppRoutes.pdfCompress,
      icon: Icons.compress_rounded,
      category: ToolCategory.pdf,
      colors: _orange,
      title: (l) => l.toolCompressPdfTitle,
      description: (l) => l.toolCompressPdfDesc,
      keywords: (l) => l.toolCompressPdfKeywords,
      accepts: const {InputKind.pdf},
    ),
    ToolDefinition(
      id: 'split_pdf',
      route: AppRoutes.pdfSplit,
      icon: Icons.call_split_rounded,
      category: ToolCategory.pdf,
      colors: _red,
      title: (l) => l.toolSplitPdfTitle,
      description: (l) => l.toolSplitPdfDesc,
      keywords: (l) => l.toolSplitPdfKeywords,
      accepts: const {InputKind.pdf},
      isNew: true,
    ),
    ToolDefinition(
      id: 'pdf_to_images',
      route: AppRoutes.pdfToImages,
      icon: Icons.collections_rounded,
      category: ToolCategory.pdf,
      colors: _amber,
      title: (l) => l.toolPdfToImagesTitle,
      description: (l) => l.toolPdfToImagesDesc,
      keywords: (l) => l.toolPdfToImagesKeywords,
      accepts: const {InputKind.pdf},
      isNew: true,
    ),
    ToolDefinition(
      id: 'protect_pdf',
      route: AppRoutes.pdfProtect,
      icon: Icons.lock_rounded,
      category: ToolCategory.pdf,
      colors: _indigo,
      title: (l) => l.toolProtectPdfTitle,
      description: (l) => l.toolProtectPdfDesc,
      keywords: (l) => l.toolProtectPdfKeywords,
      accepts: const {InputKind.pdf},
      isNew: true,
    ),
    ToolDefinition(
      id: 'unlock_pdf',
      route: AppRoutes.pdfUnlock,
      icon: Icons.lock_open_rounded,
      category: ToolCategory.pdf,
      colors: _green,
      title: (l) => l.toolUnlockPdfTitle,
      description: (l) => l.toolUnlockPdfDesc,
      keywords: (l) => l.toolUnlockPdfKeywords,
      accepts: const {InputKind.pdf},
      isNew: true,
    ),
    ToolDefinition(
      id: 'word_to_pdf',
      route: AppRoutes.wordToPdf,
      icon: Icons.description_rounded,
      category: ToolCategory.pdf,
      colors: _blue,
      title: (l) => l.toolWordToPdfTitle,
      description: (l) => l.toolWordToPdfDesc,
      keywords: (l) => l.toolWordToPdfKeywords,
      accepts: const {InputKind.docx},
    ),

    // ── Photo & image ─────────────────────────────────────────────────────
    ToolDefinition(
      id: 'image_compressor',
      route: AppRoutes.imageCompressor,
      icon: Icons.photo_size_select_small_rounded,
      category: ToolCategory.image,
      colors: _green,
      title: (l) => l.toolImageCompressorTitle,
      description: (l) => l.toolImageCompressorDesc,
      keywords: (l) => l.toolImageCompressorKeywords,
      accepts: const {InputKind.image},
    ),
    ToolDefinition(
      id: 'image_resizer',
      route: AppRoutes.imageResizer,
      icon: Icons.aspect_ratio_rounded,
      category: ToolCategory.image,
      colors: _blue,
      title: (l) => l.toolImageResizerTitle,
      description: (l) => l.toolImageResizerDesc,
      keywords: (l) => l.toolImageResizerKeywords,
      accepts: const {InputKind.image},
      acceptsMultiple: true,
      isNew: true,
    ),
    ToolDefinition(
      id: 'image_enhancer',
      route: AppRoutes.imageEnhancer,
      icon: Icons.auto_fix_high_rounded,
      category: ToolCategory.image,
      colors: _pink,
      title: (l) => l.toolImageEnhancerTitle,
      description: (l) => l.toolImageEnhancerDesc,
      keywords: (l) => l.toolImageEnhancerKeywords,
    ),
    ToolDefinition(
      id: 'ai_upscaler',
      route: AppRoutes.aiUpscaler,
      icon: Icons.auto_awesome_rounded,
      category: ToolCategory.image,
      colors: _violet,
      title: (l) => l.toolAiUpscalerTitle,
      description: (l) => l.toolAiUpscalerDesc,
      keywords: (l) => l.toolAiUpscalerKeywords,
      accepts: const {InputKind.image},
    ),

    // ── Text & translate ──────────────────────────────────────────────────
    ToolDefinition(
      id: 'translation',
      route: AppRoutes.translation,
      icon: Icons.translate_rounded,
      category: ToolCategory.text,
      colors: _pink,
      title: (l) => l.toolTranslationTitle,
      description: (l) => l.toolTranslationDesc,
      keywords: (l) => l.toolTranslationKeywords,
      accepts: const {InputKind.text},
    ),
    ToolDefinition(
      id: 'text_utilities',
      route: AppRoutes.textUtilities,
      icon: Icons.text_fields_rounded,
      category: ToolCategory.text,
      colors: _green,
      title: (l) => l.toolTextUtilitiesTitle,
      description: (l) => l.toolTextUtilitiesDesc,
      keywords: (l) => l.toolTextUtilitiesKeywords,
      accepts: const {InputKind.text},
    ),
    ToolDefinition(
      id: 'smart_clipboard',
      route: AppRoutes.smartClipboard,
      icon: Icons.content_paste_rounded,
      category: ToolCategory.text,
      colors: _indigo,
      title: (l) => l.toolSmartClipboardTitle,
      description: (l) => l.toolSmartClipboardDesc,
      keywords: (l) => l.toolSmartClipboardKeywords,
    ),

    // ── Calculate & convert ───────────────────────────────────────────────
    ToolDefinition(
      id: 'calculator',
      route: AppRoutes.calculator,
      icon: Icons.calculate_rounded,
      category: ToolCategory.calc,
      colors: _amber,
      title: (l) => l.toolCalculatorTitle,
      description: (l) => l.toolCalculatorDesc,
      keywords: (l) => l.toolCalculatorKeywords,
      isNew: true,
    ),
    ToolDefinition(
      id: 'age_calculator',
      route: AppRoutes.ageCalculator,
      icon: Icons.cake_rounded,
      category: ToolCategory.calc,
      colors: _pink,
      title: (l) => l.toolAgeCalculatorTitle,
      description: (l) => l.toolAgeCalculatorDesc,
      keywords: (l) => l.toolAgeCalculatorKeywords,
      isNew: true,
    ),
    ToolDefinition(
      id: 'unit_converter',
      route: AppRoutes.unitConverter,
      icon: Icons.straighten_rounded,
      category: ToolCategory.calc,
      colors: _blue,
      title: (l) => l.toolUnitConverterTitle,
      description: (l) => l.toolUnitConverterDesc,
      keywords: (l) => l.toolUnitConverterKeywords,
    ),
    ToolDefinition(
      id: 'loan_calculator',
      route: AppRoutes.loanCalculator,
      icon: Icons.account_balance_rounded,
      category: ToolCategory.calc,
      colors: _amber,
      title: (l) => l.toolLoanCalculatorTitle,
      description: (l) => l.toolLoanCalculatorDesc,
      keywords: (l) => l.toolLoanCalculatorKeywords,
    ),
    ToolDefinition(
      id: 'timezone',
      route: AppRoutes.timezone,
      icon: Icons.schedule_rounded,
      category: ToolCategory.calc,
      colors: _green,
      title: (l) => l.toolTimezoneTitle,
      description: (l) => l.toolTimezoneDesc,
      keywords: (l) => l.toolTimezoneKeywords,
    ),
    ToolDefinition(
      id: 'color_picker',
      route: AppRoutes.colorPicker,
      icon: Icons.palette_rounded,
      category: ToolCategory.calc,
      colors: _pink,
      title: (l) => l.toolColorPickerTitle,
      description: (l) => l.toolColorPickerDesc,
      keywords: (l) => l.toolColorPickerKeywords,
    ),

    // ── Internet ──────────────────────────────────────────────────────────
    ToolDefinition(
      id: 'wifi_speed_test',
      route: AppRoutes.wifiSpeedTest,
      icon: Icons.speed_rounded,
      category: ToolCategory.network,
      colors: _cyan,
      title: (l) => l.toolSpeedTestTitle,
      description: (l) => l.toolSpeedTestDesc,
      keywords: (l) => l.toolSpeedTestKeywords,
    ),
    ToolDefinition(
      id: 'ip_ping',
      route: AppRoutes.ipPing,
      icon: Icons.lan_rounded,
      category: ToolCategory.network,
      colors: _indigo,
      title: (l) => l.toolIpPingTitle,
      description: (l) => l.toolIpPingDesc,
      keywords: (l) => l.toolIpPingKeywords,
    ),

    // ── Device & location ─────────────────────────────────────────────────
    ToolDefinition(
      id: 'compass',
      route: AppRoutes.compass,
      icon: Icons.explore_rounded,
      category: ToolCategory.device,
      colors: _red,
      title: (l) => l.toolCompassTitle,
      description: (l) => l.toolCompassDesc,
      keywords: (l) => l.toolCompassKeywords,
    ),
    ToolDefinition(
      id: 'location_saver',
      route: AppRoutes.locationSaver,
      icon: Icons.place_rounded,
      category: ToolCategory.device,
      colors: _blue,
      title: (l) => l.toolLocationSaverTitle,
      description: (l) => l.toolLocationSaverDesc,
      keywords: (l) => l.toolLocationSaverKeywords,
    ),

    // ── Security ──────────────────────────────────────────────────────────
    ToolDefinition(
      id: 'password_generator',
      route: AppRoutes.passwordGenerator,
      icon: Icons.password_rounded,
      category: ToolCategory.security,
      colors: _indigo,
      title: (l) => l.toolPasswordGeneratorTitle,
      description: (l) => l.toolPasswordGeneratorDesc,
      keywords: (l) => l.toolPasswordGeneratorKeywords,
    ),
    ToolDefinition(
      id: 'hash_generator',
      route: AppRoutes.hashGenerator,
      icon: Icons.tag_rounded,
      category: ToolCategory.security,
      colors: _blue,
      title: (l) => l.toolHashGeneratorTitle,
      description: (l) => l.toolHashGeneratorDesc,
      keywords: (l) => l.toolHashGeneratorKeywords,
    ),

    // ── Video & audio ─────────────────────────────────────────────────────
    ToolDefinition(
      id: 'video_converter',
      route: AppRoutes.videoConverter,
      icon: Icons.movie_filter_rounded,
      category: ToolCategory.media,
      colors: _pink,
      title: (l) => l.toolVideoConverterTitle,
      description: (l) => l.toolVideoConverterDesc,
      keywords: (l) => l.toolVideoConverterKeywords,
      accepts: const {InputKind.video},
    ),
  ];

  static final Map<String, ToolDefinition> _byId = {
    for (final t in all) t.id: t,
  };

  /// Old ids from before the rebuild, kept so persisted favorites/recents and
  /// previously pinned shortcuts keep working.
  static const _legacyIds = {
    'qr_barcode': 'qr_scanner',
    'pdf_toolkit': 'image_to_pdf',
  };

  static ToolDefinition? byId(String id) => _byId[_legacyIds[id] ?? id];

  /// The four jobs people open a toolbox for most often.
  static const quickActionIds = [
    'doc_scanner',
    'qr_scanner',
    'image_to_pdf',
    'ocr',
  ];

  static List<ToolDefinition> get quickActions =>
      quickActionIds.map((id) => _byId[id]!).toList();

  static List<ToolDefinition> inCategory(ToolCategory c) =>
      all.where((t) => t.category == c).toList();

  /// Tools that can take [kind] as input, in registry order.
  static List<ToolDefinition> accepting(InputKind kind, {int count = 1}) => all
      .where((t) => t.accepts.contains(kind))
      .where((t) => count <= 1 || t.acceptsMultiple)
      .toList();

  /// Ranked search across localized title, description and keywords.
  /// Every whitespace-separated term must match somewhere; title hits rank
  /// above keyword hits, which rank above description hits.
  static List<ToolDefinition> search(String query, AppLocalizations l) {
    final phrase = _normalize(query);
    final terms = phrase.split(' ').where((t) => t.isNotEmpty);
    if (terms.isEmpty) return const [];

    final scored = <(ToolDefinition, int)>[];
    for (final tool in all) {
      final title = _normalize(tool.title(l));
      final keywords = _normalize(tool.keywords(l));
      final desc = _normalize(tool.description(l));
      // Word order matters for conversions: "jpg to pdf" ≠ "pdf to jpg",
      // so an exact phrase hit outranks matching the same words.
      var score = (title.contains(phrase) || keywords.contains(phrase)) ? 10 : 0;
      var allMatch = true;
      for (final term in terms) {
        if (title.startsWith(term) || title.contains(' $term')) {
          score += 6;
        } else if (title.contains(term)) {
          score += 4;
        } else if (keywords.contains(term)) {
          score += 3;
        } else if (desc.contains(term)) {
          score += 1;
        } else {
          allMatch = false;
          break;
        }
      }
      if (allMatch) scored.add((tool, score));
    }
    scored.sort((a, b) => b.$2.compareTo(a.$2));
    return [for (final s in scored) s.$1];
  }

  static String _normalize(String s) => s
      .toLowerCase()
      .replaceAll(RegExp(r'[,.;:()/&+×\-–—]'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}
