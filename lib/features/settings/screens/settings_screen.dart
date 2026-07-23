import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utility_toolbox/core/constants/app_constants.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
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
    final themeMode = ref.watch(themeModeProvider);
    final removeAdsPurchased = ref.watch(settingsRemoveAdsPurchasedProvider);
    final actions = ref.watch(settingsActionsProvider);

    return ToolScaffold(
      title: 'Settings',
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark mode'),
            subtitle: const Text('Use dark theme'),
            value: themeMode == ThemeMode.dark,
            onChanged: (value) {
              actions.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
            },
          ),
          if (!removeAdsPurchased)
            ListTile(
              leading: const Icon(Icons.block),
              title: const Text('Remove Ads'),
              subtitle: const Text('One-time purchase'),
              onTap: actions.purchaseRemoveAds,
            ),
          ListTile(
            leading: const Icon(Icons.restore),
            title: const Text('Restore Purchases'),
            onTap: actions.restorePurchases,
          ),
          ListTile(
            leading: const Icon(Icons.share_outlined),
            title: const Text('Share app'),
            onTap: () => Share.share(
              'Check out ${AppConstants.appName}: ${AppConstants.playStoreUrl}',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.star_outline),
            title: const Text('Rate app'),
            onTap: () => _launchUrl(AppConstants.playStoreUrl),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy policy'),
            onTap: () => _launchUrl(AppConstants.privacyPolicyUrl),
          ),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              final version = snapshot.data?.version ?? '…';
              return ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('App version'),
                subtitle: Text(version),
              );
            },
          ),
        ],
      ),
    );
  }
}
