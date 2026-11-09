import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/empty_state.dart';
import 'package:utility_toolbox/core/widgets/feature_badge.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';

class QrHomeScreen extends StatelessWidget {
  const QrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gradient = AppColors.toolGradient('qr_barcode');

    return DefaultTabController(
      length: 2,
      child: ToolScaffold(
        title: 'QR & Barcode',
        accentColor: AppColors.toolAccent('qr_barcode'),
        actions: [
          IconButton(
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
                child: const TabBar(
                  tabs: [
                    Tab(text: 'Scan'),
                    Tab(text: 'Generate'),
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

    return EmptyState(
      icon: Icons.qr_code_scanner_rounded,
      gradient: gradient,
      title: 'Scan a code',
      message:
          'Point your camera at a QR code or barcode to scan it instantly.',
      badges: [
        FeatureBadge(icon: Icons.bolt_rounded, label: 'Instant', accent: accent),
        FeatureBadge(icon: Icons.history_rounded, label: 'Saved history', accent: accent),
      ],
      action: PremiumButton(
        onPressed: onStartScan,
        icon: Icons.camera_alt_rounded,
        label: 'Start scanning',
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

    return EmptyState(
      icon: Icons.qr_code_2_rounded,
      gradient: gradient,
      title: 'Create a code',
      message:
          'Create a QR code from text or a URL, then save or share it.',
      badges: [
        FeatureBadge(icon: Icons.share_rounded, label: 'Share anywhere', accent: accent),
        FeatureBadge(icon: Icons.download_rounded, label: 'Save as image', accent: accent),
      ],
      action: PremiumButton(
        onPressed: onOpenGenerator,
        icon: Icons.edit_rounded,
        label: 'Open generator',
        gradient: gradient,
      ),
    );
  }
}
