import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';

class PdfHomeScreen extends StatelessWidget {
  const PdfHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ToolScaffold(
      title: 'PDF Toolkit',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _PdfToolCard(
            icon: Icons.image_outlined,
            title: 'Image to PDF',
            subtitle: 'Convert photos into a PDF document',
            onTap: () => context.push('${AppRoutes.pdfToolkit}/image-to-pdf'),
          ),
          const SizedBox(height: 12),
          _PdfToolCard(
            icon: Icons.merge_type,
            title: 'Merge PDFs',
            subtitle: 'Combine multiple PDF files into one',
            onTap: () => context.push('${AppRoutes.pdfToolkit}/merge'),
          ),
          const SizedBox(height: 12),
          _PdfToolCard(
            icon: Icons.compress,
            title: 'Compress PDF',
            subtitle: 'Reduce file size for image-heavy PDFs',
            onTap: () => context.push('${AppRoutes.pdfToolkit}/compress'),
          ),
        ],
      ),
    );
  }
}

class _PdfToolCard extends StatelessWidget {
  const _PdfToolCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
