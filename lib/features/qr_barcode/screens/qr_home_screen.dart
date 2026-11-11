import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/empty_state.dart';
import 'package:utility_toolbox/core/widgets/feature_badge.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

class QrHomeScreen extends StatelessWidget {
  const QrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gradient = AppColors.toolGradient('qr_barcode');
    final l = AppLocalizations.of(context);

    return DefaultTabController(
      length: 2,
      child: ToolScaffold(
        title: l.qrHomeTitle,
        accentColor: AppColors.toolAccent('qr_barcode'),
        actions: [
          IconButton(
            tooltip: l.qrHistoryTitle,
            icon: const Icon(Icons.history_rounded),
            onPressed: () => context.push('${AppRoutes.qrBarcode}/history'),
          ),
        ],
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withValues(
                    alpha: 0.85,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withValues(alpha: 0.5),
                  ),
                ),
                child: TabBar(
                  tabs: [
                    Tab(text: l.qrHomeTabScan),
                    Tab(text: l.qrHomeTabCreate),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _ScanTab(
                    gradient: gradient,
                    onStartScan: () =>
                        context.push('${AppRoutes.qrBarcode}/scanner'),
                  ),
                  _GenerateTab(
                    gradient: gradient,
                    onOpenGenerator: () =>
                        context.push('${AppRoutes.qrBarcode}/generator'),
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

class _ScanTab extends StatelessWidget {
  const _ScanTab({required this.gradient, required this.onStartScan});

  final Gradient gradient;
  final VoidCallback onStartScan;

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.toolAccent('qr_barcode');
    final l = AppLocalizations.of(context);

    return EmptyState(
      icon: Icons.qr_code_scanner_rounded,
      gradient: gradient,
      title: l.qrHomeScanTitle,
      message: l.qrHomeScanBody,
      badges: [
        FeatureBadge(icon: Icons.bolt_rounded, label: l.qrHomeBadgeInstant, accent: accent),
        FeatureBadge(icon: Icons.history_rounded, label: l.qrHomeBadgeHistory, accent: accent),
      ],
      action: PremiumButton(
        onPressed: onStartScan,
        icon: Icons.camera_alt_rounded,
        label: l.qrHomeStartScan,
        gradient: gradient,
      ),
    );
  }
}

class _GenerateTab extends StatelessWidget {
  const _GenerateTab({required this.gradient, required this.onOpenGenerator});

  final Gradient gradient;
  final VoidCallback onOpenGenerator;

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.toolAccent('qr_barcode');
    final l = AppLocalizations.of(context);

    return EmptyState(
      icon: Icons.qr_code_2_rounded,
      gradient: gradient,
      title: l.qrHomeCreateTitle,
      message: l.qrHomeCreateBody,
      badges: [
        FeatureBadge(icon: Icons.share_rounded, label: l.qrHomeBadgeShare, accent: accent),
        FeatureBadge(icon: Icons.download_rounded, label: l.qrHomeBadgeImage, accent: accent),
      ],
      action: PremiumButton(
        onPressed: onOpenGenerator,
        icon: Icons.edit_rounded,
        label: l.qrHomeOpenGenerator,
        gradient: gradient,
      ),
    );
  }
}
