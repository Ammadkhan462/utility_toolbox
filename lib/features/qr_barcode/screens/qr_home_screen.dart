import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';

class QrHomeScreen extends StatelessWidget {
  const QrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ToolScaffold(
        title: 'QR & Barcode',
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => context.push('${AppRoutes.qrBarcode}/history'),
          ),
        ],
        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Scan'),
                Tab(text: 'Generate'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _ScanTab(onStartScan: () => context.push('${AppRoutes.qrBarcode}/scanner')),
                  _GenerateTab(
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
  const _ScanTab({required this.onStartScan});

  final VoidCallback onStartScan;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.qr_code_scanner,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            const Text(
              'Point your camera at a QR code or barcode to scan it.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onStartScan,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Start scanning'),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenerateTab extends StatelessWidget {
  const _GenerateTab({required this.onOpenGenerator});

  final VoidCallback onOpenGenerator;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.qr_code_2,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            const Text(
              'Create a QR code from text or a URL and save or share it.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onOpenGenerator,
              icon: const Icon(Icons.edit),
              label: const Text('Open generator'),
            ),
          ],
        ),
      ),
    );
  }
}
