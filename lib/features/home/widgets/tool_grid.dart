import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_card.dart';

typedef _Tool = ({
  String id,
  IconData icon,
  String label,
  String subtitle,
  String route,
  String category,
  bool trending,
});

/// ─────────────────────────────────────────────────────────────────────────────
///  ToolGrid  –  Neumorphic / Glassmorphism redesign
///
///  What changed vs. original:
///   • Search bar → neumorphic inset sunken field (inner shadow effect)
///   • Category chips → pill shape, gradient fill when active
///   • Section header → gradient accent bar + frosted count badge
///   • Grid → 2 columns, childAspectRatio ~1.0 (square-ish cards)
///   • Empty state → gently animated icon with soft glow
/// ─────────────────────────────────────────────────────────────────────────────
class ToolGrid extends StatefulWidget {
  const ToolGrid({super.key});

  @override
  State<ToolGrid> createState() => _ToolGridState();
}

class _ToolGridState extends State<ToolGrid> {
  String _selectedCategory = 'All';
  String _searchQuery = '';
  final _searchCtrl = TextEditingController();
  final _focusNode = FocusNode();
  bool _searchFocused = false;

  static const _tools = <_Tool>[
    // ── Trending / most-used ────────────────────────────────────────────
    (
      id: 'wifi_speed_test',
      icon: Icons.speed_rounded,
      label: 'Speed Test',
      subtitle: 'Test download & upload',
      route: AppRoutes.wifiSpeedTest,
      category: 'Network',
      trending: true,
    ),
    (
      id: 'timezone',
      icon: Icons.schedule_rounded,
      label: 'World Clock',
      subtitle: 'Time in any city',
      route: AppRoutes.timezone,
      category: 'Utils',
      trending: true,
    ),
    // ── AI ──────────────────────────────────────────────────────────────
    (
      id: 'ai_upscaler',
      icon: Icons.auto_awesome_rounded,
      label: 'AI Upscaler',
      subtitle: 'Enhance image quality with AI',
      route: AppRoutes.aiUpscaler,
      category: 'AI',
      trending: false,
    ),
    (
      id: 'ocr',
      icon: Icons.document_scanner_outlined,
      label: 'OCR',
      subtitle: 'Extract text from images',
      route: AppRoutes.ocr,
      category: 'AI',
      trending: false,
    ),
    (
      id: 'translation',
      icon: Icons.translate_rounded,
      label: 'Translation',
      subtitle: 'On-device AI translate',
      route: AppRoutes.translation,
      category: 'AI',
      trending: false,
    ),
    // ── Codes ─────────────────────────────────────────────────────────────
    (
      id: 'qr_barcode',
      icon: Icons.qr_code_scanner_rounded,
      label: 'QR & Barcode',
      subtitle: 'Scan & generate codes',
      route: AppRoutes.qrBarcode,
      category: 'Codes',
      trending: false,
    ),
    (
      id: 'wifi_qr',
      icon: Icons.wifi_rounded,
      label: 'WiFi QR',
      subtitle: 'Share WiFi via QR code',
      route: AppRoutes.wifiQr,
      category: 'Codes',
      trending: false,
    ),
    // ── Convert ────────────────────────────────────────────────────────────
    (
      id: 'unit_converter',
      icon: Icons.straighten_rounded,
      label: 'Unit Converter',
      subtitle: 'Length, weight & more',
      route: AppRoutes.unitConverter,
      category: 'Convert',
      trending: false,
    ),
    (
      id: 'hash_generator',
      icon: Icons.tag_rounded,
      label: 'Hash Generator',
      subtitle: 'MD5, SHA256 & more',
      route: AppRoutes.hashGenerator,
      category: 'Convert',
      trending: false,
    ),
    (
      id: 'color_picker',
      icon: Icons.palette_rounded,
      label: 'Color Picker',
      subtitle: 'HEX, RGB, HSL, CMYK',
      route: AppRoutes.colorPicker,
      category: 'Convert',
      trending: false,
    ),
    (
      id: 'video_converter',
      icon: Icons.movie_filter_rounded,
      label: 'Video Converter',
      subtitle: 'MP4, MKV, GIF, audio…',
      route: AppRoutes.videoConverter,
      category: 'Convert',
      trending: false,
    ),
    // ── Files ──────────────────────────────────────────────────────────────
    (
      id: 'pdf_toolkit',
      icon: Icons.picture_as_pdf_rounded,
      label: 'PDF Toolkit',
      subtitle: 'Merge, compress & convert',
      route: AppRoutes.pdfToolkit,
      category: 'Files',
      trending: false,
    ),
    (
      id: 'image_compressor',
      icon: Icons.compress_rounded,
      label: 'Image Compressor',
      subtitle: 'Shrink images instantly',
      route: AppRoutes.imageCompressor,
      category: 'Files',
      trending: false,
    ),
    (
      id: 'word_to_pdf',
      icon: Icons.description_rounded,
      label: 'Word to PDF',
      subtitle: 'Convert .docx to PDF',
      route: AppRoutes.wordToPdf,
      category: 'Files',
      trending: false,
    ),
    (
      id: 'image_enhancer',
      icon: Icons.auto_fix_high_rounded,
      label: 'Image Enhancer',
      subtitle: 'Filters, crop, sharpen & more',
      route: AppRoutes.imageEnhancer,
      category: 'Files',
      trending: false,
    ),
    // ── Text ───────────────────────────────────────────────────────────────
    (
      id: 'text_utilities',
      icon: Icons.text_fields_rounded,
      label: 'Text Utilities',
      subtitle: 'Case, encode & count',
      route: AppRoutes.textUtilities,
      category: 'Text',
      trending: false,
    ),
    // ── Security ───────────────────────────────────────────────────────────
    (
      id: 'password_generator',
      icon: Icons.lock_rounded,
      label: 'Password Gen',
      subtitle: 'Strong & secure passwords',
      route: AppRoutes.passwordGenerator,
      category: 'Security',
      trending: false,
    ),
    // ── Finance ────────────────────────────────────────────────────────────
    (
      id: 'loan_calculator',
      icon: Icons.calculate_rounded,
      label: 'Loan Calculator',
      subtitle: 'EMI & amortization',
      route: AppRoutes.loanCalculator,
      category: 'Finance',
      trending: false,
    ),
    // ── Network ────────────────────────────────────────────────────────────
    (
      id: 'ip_ping',
      icon: Icons.lan_rounded,
      label: 'IP & Ping',
      subtitle: 'Lookup IPs & ping hosts',
      route: AppRoutes.ipPing,
      category: 'Network',
      trending: false,
    ),
    // ── Sensors ────────────────────────────────────────────────────────────
    (
      id: 'compass',
      icon: Icons.explore_rounded,
      label: 'Compass',
      subtitle: 'Magnetic heading & bearing',
      route: AppRoutes.compass,
      category: 'Sensors',
      trending: false,
    ),
    (
      id: 'location_saver',
      icon: Icons.bookmark_rounded,
      label: 'Location Saver',
      subtitle: 'Save & share GPS spots',
      route: AppRoutes.locationSaver,
      category: 'Sensors',
      trending: true,
    ),
    // ── Utils ──────────────────────────────────────────────────────────────
    (
      id: 'smart_clipboard',
      icon: Icons.content_paste_rounded,
      label: 'Smart Clipboard',
      subtitle: 'Save, pin & search clips',
      route: AppRoutes.smartClipboard,
      category: 'Utils',
      trending: false,
    ),
  ];

  static const _categoryOrder = [
    'All',
    'Trending',
    'AI',
    'Codes',
    'Convert',
    'Files',
    'Text',
    'Network',
    'Sensors',
    'Security',
    'Finance',
    'Utils',
  ];

  static const _categoryIcons = <String, IconData>{
    'All': Icons.apps_rounded,
    'Trending': Icons.local_fire_department_rounded,
    'AI': Icons.auto_awesome_rounded,
    'Codes': Icons.qr_code_rounded,
    'Convert': Icons.swap_horiz_rounded,
    'Files': Icons.folder_rounded,
    'Text': Icons.text_fields_rounded,
    'Network': Icons.wifi_rounded,
    'Sensors': Icons.sensors_rounded,
    'Security': Icons.shield_rounded,
    'Finance': Icons.account_balance_rounded,
    'Utils': Icons.build_rounded,
  };

  List<_Tool> get _trendingTools => _tools.where((t) => t.trending).toList();

  List<String> get _categories => _categoryOrder.where((c) {
    if (c == 'All') return true;
    if (c == 'Trending') return _trendingTools.isNotEmpty;
    return _tools.any((t) => t.category == c);
  }).toList();

  List<_Tool> get _filtered {
    final q = _searchQuery.toLowerCase();
    return _tools.where((t) {
      final matchesCat =
          _selectedCategory == 'All' ||
          (_selectedCategory == 'Trending'
              ? t.trending
              : t.category == _selectedCategory);
      final matchesSearch =
          q.isEmpty ||
          t.label.toLowerCase().contains(q) ||
          t.subtitle.toLowerCase().contains(q) ||
          t.category.toLowerCase().contains(q);
      return matchesCat && matchesSearch;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _searchFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final filtered = _filtered;

    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        // ── Trending Now showcase (always first) ────────────────────────────
        if (_searchQuery.isEmpty && _trendingTools.isNotEmpty)
          SliverToBoxAdapter(
            child: _TrendingShowcase(tools: _trendingTools, isDark: isDark),
          ),

        // ── Search bar ─────────────────────────────────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
            child: _NeuSearchBar(
              controller: _searchCtrl,
              focusNode: _focusNode,
              isDark: isDark,
              isFocused: _searchFocused,
              onChanged: (v) => setState(() => _searchQuery = v),
              onClear: () {
                _searchCtrl.clear();
                setState(() => _searchQuery = '');
              },
            ),
          ),
        ),

        // ── Category chips ─────────────────────────────────────────────────
        if (_searchQuery.isEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
              child: SizedBox(
                // A little extra height (vs. the ~36px chip) for shadow room
                // — kept tight to avoid excess whitespace.
                height: 52,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  itemCount: _categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (ctx, i) {
                    final cat = _categories[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: _PillChip(
                        label: cat,
                        icon: _categoryIcons[cat] ?? Icons.circle,
                        selected: cat == _selectedCategory,
                        isDark: isDark,
                        onTap: () => setState(() => _selectedCategory = cat),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

        // ── Section header ─────────────────────────────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: _SectionHeader(
              title: _searchQuery.isNotEmpty
                  ? 'Results for "$_searchQuery"'
                  : _selectedCategory == 'All'
                  ? 'All Tools'
                  : _selectedCategory,
              count: filtered.length,
              isDark: isDark,
            ),
          ),
        ),

        // ── Empty state ────────────────────────────────────────────────────
        if (filtered.isEmpty)
          SliverToBoxAdapter(
            child: _EmptyState(query: _searchQuery, isDark: isDark),
          )
        else
          // ── Tool grid ──────────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: _cardAspectRatio(context),
              ),
              delegate: SliverChildBuilderDelegate((ctx, index) {
                final tool = filtered[index];
                return ToolCard(
                  icon: tool.icon,
                  label: tool.label,
                  subtitle: tool.subtitle,
                  gradient: AppColors.toolGradient(tool.id),
                  onTap: () => ctx.push(tool.route),
                );
              }, childCount: filtered.length),
            ),
          ),
      ],
    );
  }

  double _cardAspectRatio(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    if (w < 360) return 0.88;
    if (w < 400) return 0.92;
    return 0.96;
  }
}

// ── Neumorphic Search Bar ─────────────────────────────────────────────────────

class _NeuSearchBar extends StatelessWidget {
  const _NeuSearchBar({
    required this.controller,
    required this.focusNode,
    required this.isDark,
    required this.isFocused,
    required this.onChanged,
    required this.onClear,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isDark;
  final bool isFocused;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: isDark ? AppColors.darkSurfaceVariant : AppColors.lightSurface,
        border: Border.all(
          color: isFocused
              ? AppColors.brand.withValues(alpha: 0.55)
              : (isDark ? AppColors.darkGlassBorder : AppColors.lightOutline),
          width: isFocused ? 1.8 : 1.2,
        ),
        boxShadow: isDark
            ? [
                BoxShadow(
                  color: isFocused
                      ? AppColors.brand.withValues(alpha: 0.20)
                      : Colors.black.withValues(alpha: 0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ]
            : [
                // Neumorphic inset-like sunken shadow
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
                if (isFocused)
                  BoxShadow(
                    color: AppColors.brand.withValues(alpha: 0.18),
                    blurRadius: 18,
                    offset: const Offset(0, 4),
                  ),
              ],
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textInputAction: TextInputAction.search,
        onSubmitted: (_) => focusNode.unfocus(),
        onChanged: onChanged,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: 'Search 22 tools…',
          hintStyle: TextStyle(
            color: isDark
                ? AppColors.darkOnSurfaceVariant
                : AppColors.lightOnSurfaceVariant,
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Icon(
              Icons.search_rounded,
              size: 20,
              color: isFocused
                  ? AppColors.brand
                  : (isDark
                        ? AppColors.darkOnSurfaceVariant
                        : AppColors.lightOnSurfaceVariant),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 48),
          suffixIcon: controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: onClear,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkSurface
                          : AppColors.lightBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      size: 16,
                      color: isDark
                          ? AppColors.darkOnSurfaceVariant
                          : AppColors.lightOnSurfaceVariant,
                    ),
                  ),
                )
              : null,
          filled: false,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

// ── Trending Now Showcase ─────────────────────────────────────────────────────

/// Horizontal row of featured/high-demand tools (e.g. Speed Test, World
/// Clock), pinned at the very top of the home page above search & categories.
class _TrendingShowcase extends StatelessWidget {
  const _TrendingShowcase({required this.tools, required this.isDark});

  final List<_Tool> tools;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.local_fire_department_rounded,
                size: 18,
                color: Color(0xFFFF8642),
              ),
              const SizedBox(width: 6),
              Text(
                'Trending Now',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                  color: isDark
                      ? AppColors.darkOnSurface
                      : AppColors.lightOnSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            // A little extra height (vs. the ~96px card) so the neumorphic
            // shadow has room to render without the tight-height ListView
            // clipping it off — kept tight to avoid excess whitespace.
            height: 112,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              itemCount: tools.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (ctx, i) {
                final tool = tools[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: _TrendingCard(tool: tool, isDark: isDark),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TrendingCard extends StatelessWidget {
  const _TrendingCard({required this.tool, required this.isDark});

  final _Tool tool;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = AppColors.toolAccent(tool.id);

    return GestureDetector(
      onTap: () => context.push(tool.route),
      child: Container(
        width: 210,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          border: Border.all(
            color: isDark
                ? AppColors.darkGlassBorder
                : accent.withValues(alpha: 0.10),
            width: 1.2,
          ),
          boxShadow: isDark
              ? AppColors.glowShadow(accent, blur: 18, opacity: 0.22)
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
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.toolGradient(tool.id),
                boxShadow: [
                  BoxShadow(
                    color: accent.withValues(alpha: isDark ? 0.45 : 0.32),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(tool.icon, size: 21, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    tool.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.darkOnSurface
                          : AppColors.lightOnSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    tool.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 10.5,
                      height: 1.25,
                      color: isDark
                          ? AppColors.darkOnSurfaceVariant
                          : AppColors.lightOnSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Pill Category Chip ────────────────────────────────────────────────────────

class _PillChip extends StatelessWidget {
  const _PillChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.isDark,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
        decoration: BoxDecoration(
          // Active: gradient; inactive: neumorphic/glass pill
          gradient: selected
              ? const LinearGradient(
                  colors: [AppColors.brand, AppColors.accentTeal],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          color: selected
              ? null
              : (isDark
                    ? AppColors.darkSurfaceVariant
                    : AppColors.lightSurface),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected
                ? Colors.transparent
                : (isDark ? AppColors.darkGlassBorder : AppColors.lightOutline),
            width: 1.2,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.brand.withValues(alpha: 0.42),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ]
              : isDark
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 13,
              color: selected
                  ? Colors.white
                  : (isDark
                        ? AppColors.darkOnSurfaceVariant
                        : AppColors.lightOnSurfaceVariant),
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: selected
                    ? Colors.white
                    : (isDark
                          ? AppColors.darkOnSurfaceVariant
                          : AppColors.lightOnSurfaceVariant),
                fontSize: 12.5,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Section Header ────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.count,
    required this.isDark,
  });

  final String title;
  final int count;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        // Gradient accent bar (left)
        Container(
          width: 3,
          height: 18,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.brand, AppColors.accentTeal],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),

        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
            color: isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface,
          ),
        ),

        const Spacer(),

        // Frosted count badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.darkPrimaryContainer
                : AppColors.lightPrimaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$count',
            style: TextStyle(
              color: isDark
                  ? AppColors.darkOnPrimaryContainer
                  : AppColors.lightOnPrimaryContainer,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Empty State ───────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.query, required this.isDark});

  final String query;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 40),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? AppColors.darkSurfaceVariant
                  : AppColors.lightSurface,
              boxShadow: isDark
                  ? AppColors.glowShadow(
                      AppColors.brand,
                      blur: 20,
                      opacity: 0.25,
                    )
                  : AppColors.neumorphicShadow(),
            ),
            child: const Icon(
              Icons.search_off_rounded,
              size: 34,
              color: AppColors.brand,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No results for',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isDark
                  ? AppColors.darkOnSurfaceVariant
                  : AppColors.lightOnSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '"$query"',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: isDark
                  ? AppColors.darkOnSurface
                  : AppColors.lightOnSurface,
            ),
          ),
        ],
      ),
    );
  }
}
