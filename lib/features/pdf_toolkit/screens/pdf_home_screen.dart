import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/tools/tool_providers.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';
import 'package:utility_toolbox/core/widgets/feature_tile.dart';
import 'package:utility_toolbox/core/widgets/section_header.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Lists every PDF tool from the registry, so new PDF tools show up here
/// without touching this screen.
class PdfHomeScreen extends ConsumerWidget {
  const PdfHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final tools = [
      for (final tool in ToolRegistry.all)
        if (tool.category == ToolCategory.pdf) tool,
    ];
    return ToolScaffold(
      title: l.pdfHomeTitle,
      accentColor: AppColors.toolAccent('pdf_toolkit'),
      body: ListView(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 8, 20, 24),
        children: [
          SectionHeader(
            title: l.pdfHomeSection,
            subtitle: l.pdfHomeSubtitle,
          ),
          for (final (i, tool) in tools.indexed) ...[
            if (i > 0) const SizedBox(height: 12),
            FeatureTile(
              icon: tool.icon,
              title: tool.title(l),
              subtitle: tool.description(l),
              gradient: tool.gradient,
              // openTool = context.push(tool.route) + recents tracking.
              onTap: () => openTool(context, ref, tool),
            ),
          ],
        ],
      ),
    );
  }
}
