import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/widgets/tool_card.dart';

class ToolGrid extends StatelessWidget {
  const ToolGrid({super.key});

  static const _tools = [
    (icon: Icons.qr_code_scanner, label: 'QR & Barcode', route: AppRoutes.qrBarcode),
    (icon: Icons.straighten, label: 'Unit Converter', route: AppRoutes.unitConverter),
    (icon: Icons.picture_as_pdf, label: 'PDF Toolkit', route: AppRoutes.pdfToolkit),
    (icon: Icons.text_fields, label: 'Text Utilities', route: AppRoutes.textUtilities),
    (icon: Icons.document_scanner_outlined, label: 'OCR', route: AppRoutes.ocr),
    (icon: Icons.translate, label: 'Translation', route: AppRoutes.translation),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: _tools.length,
      itemBuilder: (context, index) {
        final tool = _tools[index];
        return ToolCard(
          icon: tool.icon,
          label: tool.label,
          onTap: () => context.push(tool.route),
        );
      },
    );
  }
}
