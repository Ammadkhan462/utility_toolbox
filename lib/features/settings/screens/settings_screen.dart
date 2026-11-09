import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utility_toolbox/core/constants/app_constants.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/feature_tile.dart';
import 'package:utility_toolbox/core/widgets/section_header.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/settings/providers/settings_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the live themeModeProvider — this is what drives the toggle.
    final themeMode          = ref.watch(themeModeProvider);
    final removeAdsPurchased = ref.watch(settingsRemoveAdsPurchasedProvider);
    final actions            = ref.watch(settingsActionsProvider);
    final theme              = Theme.of(context);
    final isDark             = theme.brightness == Brightness.dark;

    return ToolScaffold(
      title: 'Settings',
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
        children: [
          // ── Appearance ────────────────────────────────────────────────
          const SectionHeader(
            title: 'Appearance',
            subtitle: 'Customize how the app looks',
          ),
          _SettingsCard(
            child: Column(
              children: [
                // Three-way theme picker (System / Light / Dark)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.contrast_rounded,
                        size: 20,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 10),
                      Text('Theme', style: theme.textTheme.titleSmall),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
                  child: _ThemeSegmentedButton(
                    current: themeMode,
                    onChanged: actions.setThemeMode,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),

          // ── Purchases ─────────────────────────────────────────────────
          const SectionHeader(
            title: 'Purchases',
            subtitle: 'Manage in-app purchases',
          ),
          if (!removeAdsPurchased) ...[
            FeatureTile(
              icon: Icons.block_rounded,
              title: 'Remove Ads',
              subtitle: 'One-time purchase — enjoy an ad-free experience',
              gradient: AppColors.brandGradient(dark: isDark),
              onTap: actions.purchaseRemoveAds,
            ),
            const SizedBox(height: 12),
          ],
          FeatureTile(
            icon: Icons.restore_rounded,
            title: 'Restore Purchases',
            subtitle: 'Recover previous purchases on this device',
            gradient: const LinearGradient(
              colors: [AppColors.brand, AppColors.accentTeal],
            ),
            onTap: actions.restorePurchases,
          ),

          // ── Support ───────────────────────────────────────────────────
          const SectionHeader(
            title: 'Support',
            subtitle: 'Help us grow & stay connected',
          ),
          FeatureTile(
            icon: Icons.share_rounded,
            title: 'Share app',
            subtitle: 'Tell friends about Utility Toolbox',
            gradient: AppColors.toolGradient('text_utilities'),
            onTap: () => Share.share(
              'Check out ${AppConstants.appName}: ${AppConstants.playStoreUrl}',
            ),
          ),
          const SizedBox(height: 12),
          FeatureTile(
            icon: Icons.star_rounded,
            title: 'Rate app',
            subtitle: 'Leave a review on the Play Store',
            gradient: AppColors.toolGradient('ocr'),
            onTap: () => _launchUrl(AppConstants.playStoreUrl),
          ),
          const SizedBox(height: 12),
          FeatureTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy policy',
            subtitle: 'How we handle your data',
            gradient: AppColors.toolGradient('unit_converter'),
            onTap: () => _launchUrl(AppConstants.privacyPolicyUrl),
          ),
          const SizedBox(height: 32),

          // ── Version ───────────────────────────────────────────────────
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              final version = snapshot.data?.version ?? '…';
              final build   = snapshot.data?.buildNumber ?? '';
              return Center(
                child: Text(
                  'Version $version ($build)',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ── Three-way theme picker ─────────────────────────────────────────────────

class _ThemeSegmentedButton extends StatelessWidget {
  const _ThemeSegmentedButton({
    required this.current,
    required this.onChanged,
  });

  final ThemeMode current;
  final void Function(ThemeMode) onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ThemeMode>(
      expandedInsets: EdgeInsets.zero,
      segments: const [
        ButtonSegment(
          value: ThemeMode.system,
          icon: Icon(Icons.brightness_auto_rounded),
          label: Text('Auto'),
        ),
        ButtonSegment(
          value: ThemeMode.light,
          icon: Icon(Icons.light_mode_rounded),
          label: Text('Light'),
        ),
        ButtonSegment(
          value: ThemeMode.dark,
          icon: Icon(Icons.dark_mode_rounded),
          label: Text('Dark'),
        ),
      ],
      selected: {current},
      onSelectionChanged: (set) {
        if (set.isNotEmpty) onChanged(set.first);
      },
    );
  }
}

// ── Settings card container ────────────────────────────────────────────────

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.5),
        ),
      ),
      child: child,
    );
  }
}
