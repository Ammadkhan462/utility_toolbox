import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_card.dart';

class ToolGrid extends StatelessWidget {
  const ToolGrid({super.key});

  static const _tools = [
    (
      id: 'qr_barcode',
      icon: Icons.qr_code_scanner_rounded,
      label: 'QR & Barcode',
      subtitle: 'Scan & generate codes',
      route: AppRoutes.qrBarcode,
    ),
    (
      id: 'unit_converter',
      icon: Icons.straighten_rounded,
      label: 'Unit Converter',
      subtitle: 'Length, weight & more',
      route: AppRoutes.unitConverter,
    ),
    (
      id: 'pdf_toolkit',
      icon: Icons.picture_as_pdf_rounded,
      label: 'PDF Toolkit',
      subtitle: 'Merge, compress & convert',
      route: AppRoutes.pdfToolkit,
    ),
    (
      id: 'text_utilities',
      icon: Icons.text_fields_rounded,
      label: 'Text Utilities',
      subtitle: 'Case, encode & count',
      route: AppRoutes.textUtilities,
    ),
    (
      id: 'ocr',
      icon: Icons.document_scanner_outlined,
      label: 'OCR',
      subtitle: 'Extract text from images',
      route: AppRoutes.ocr,
    ),
    (
      id: 'translation',
      icon: Icons.translate_rounded,
      label: 'Translation',
      subtitle: 'On-device AI translate',
      route: AppRoutes.translation,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
            child: Text(
              'All Tools',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 0.88,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final tool = _tools[index];
              return ToolCard(
                icon: tool.icon,
                label: tool.label,
                subtitle: tool.subtitle,
                gradient: AppColors.toolGradient(tool.id),
                onTap: () => context.push(tool.route),
              );
            }, childCount: _tools.length),
          ),
        ),
      ],
    );
  }
}
