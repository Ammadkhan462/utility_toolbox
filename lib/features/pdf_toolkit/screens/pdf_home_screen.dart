import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/feature_tile.dart';
import 'package:utility_toolbox/core/widgets/section_header.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';

class PdfHomeScreen extends StatelessWidget {
  const PdfHomeScreen({super.key});

  static const _gradient = LinearGradient(
    colors: [AppColors.toolPdfToolkit, Color(0xFFEF4444)],
  );

  @override
  Widget build(BuildContext context) {
    return ToolScaffold(
      title: 'PDF Toolkit',
      accentColor: AppColors.toolAccent('pdf_toolkit'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          const SectionHeader(
            title: 'PDF Tools',
            subtitle: 'Create, combine, and optimize your documents',
          ),
          FeatureTile(
            icon: Icons.image_outlined,
            title: 'Image to PDF',
            subtitle: 'Convert photos into a PDF document',
            gradient: _gradient,
            onTap: () => context.push('${AppRoutes.pdfToolkit}/image-to-pdf'),
          ),
          const SizedBox(height: 12),
          FeatureTile(
            icon: Icons.merge_type_rounded,
            title: 'Merge PDFs',
            subtitle: 'Combine multiple PDF files into one',
            gradient: _gradient,
            onTap: () => context.push('${AppRoutes.pdfToolkit}/merge'),
          ),
          const SizedBox(height: 12),
          FeatureTile(
            icon: Icons.compress_rounded,
            title: 'Compress PDF',
            subtitle: 'Reduce file size for image-heavy PDFs',
            gradient: _gradient,
            onTap: () => context.push('${AppRoutes.pdfToolkit}/compress'),
          ),
        ],
      ),
    );
  }
}
