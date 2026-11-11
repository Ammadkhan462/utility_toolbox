import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utility_toolbox/core/constants/app_constants.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/services/engagement_service.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/feature_tile.dart';
import 'package:utility_toolbox/core/widgets/section_header.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/settings/providers/settings_providers.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Native names for the language picker (always shown in their own script
/// so people can find their language whatever the UI is set to).
const _languageNames = {
  'en': 'English',
  'es': 'Español',
  'pt': 'Português',
  'hi': 'हिन्दी',
  'id': 'Bahasa Indonesia',
  'ar': 'العربية',
  'fr': 'Français',
  'de': 'Deutsch',
  'ru': 'Русский',
  'tr': 'Türkçe',
  'ur': 'اردو',
  'bn': 'বাংলা',
};

final _privacyOptionsRequiredProvider = FutureProvider.autoDispose<bool>((ref) {
  return ref.read(adsServiceProvider).privacyOptionsRequired();
});

// Loaded once instead of on every rebuild of the settings list (which made
// the version line flicker back to "…" on each theme/language change).
final _packageInfoProvider = FutureProvider<PackageInfo>(
  (ref) => PackageInfo.fromPlatform(),
);

bool _privacyFormOpen = false;

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      // No browser / activity not found.
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);
    final removeAdsPurchased = ref.watch(settingsRemoveAdsPurchasedProvider);
    final actions = ref.watch(settingsActionsProvider);
    final privacyRequired = ref.watch(_privacyOptionsRequiredProvider).valueOrNull ?? false;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ToolScaffold(
      title: l.settingsTitle,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
        children: [
          // ── Appearance ────────────────────────────────────────────────
          SectionHeader(title: l.settingsAppearance),
          _SettingsCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                  child: Row(
                    children: [
                      Icon(Icons.contrast_rounded, size: 20, color: theme.colorScheme.onSurfaceVariant),
                      const SizedBox(width: 10),
                      Text(l.settingsTheme, style: theme.textTheme.titleSmall),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
                  child: SegmentedButton<ThemeMode>(
                    expandedInsets: EdgeInsets.zero,
                    segments: [
                      ButtonSegment(
                        value: ThemeMode.system,
                        icon: const Icon(Icons.brightness_auto_rounded),
                        label: Text(l.themeSystem),
                      ),
                      ButtonSegment(
                        value: ThemeMode.light,
                        icon: const Icon(Icons.light_mode_rounded),
                        label: Text(l.themeLight),
                      ),
                      ButtonSegment(
                        value: ThemeMode.dark,
                        icon: const Icon(Icons.dark_mode_rounded),
                        label: Text(l.themeDark),
                      ),
                    ],
                    selected: {themeMode},
                    onSelectionChanged: (set) {
                      if (set.isNotEmpty) actions.setThemeMode(set.first);
                    },
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.language_rounded),
                  title: Text(l.settingsLanguage),
                  subtitle: Text(
                    locale == null ? l.languageSystem : (_languageNames[locale.languageCode] ?? locale.languageCode),
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => _pickLanguage(context, ref, locale),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),

          // ── Purchases ─────────────────────────────────────────────────
          SectionHeader(title: l.settingsPurchases),
          if (!removeAdsPurchased) ...[
            FeatureTile(
              icon: Icons.block_rounded,
              title: l.removeAdsTitle,
              subtitle: l.removeAdsSubtitle,
              gradient: AppColors.brandGradient(dark: isDark),
              onTap: actions.purchaseRemoveAds,
            ),
            const SizedBox(height: 12),
          ],
          FeatureTile(
            icon: Icons.restore_rounded,
            title: l.restorePurchasesTitle,
            subtitle: l.restorePurchasesSubtitle,
            gradient: const LinearGradient(colors: [AppColors.brand, AppColors.accentTeal]),
            onTap: actions.restorePurchases,
          ),

          // ── Support & privacy ─────────────────────────────────────────
          SectionHeader(title: l.settingsSupport),
          FeatureTile(
            icon: Icons.star_rounded,
            title: l.rateAppTitle,
            subtitle: l.rateAppSubtitle,
            gradient: AppColors.toolGradient('ocr'),
            onTap: () => ref.read(engagementServiceProvider).openStoreListing(),
          ),
          const SizedBox(height: 12),
          FeatureTile(
            icon: Icons.share_rounded,
            title: l.shareAppTitle,
            subtitle: l.shareAppSubtitle,
            gradient: AppColors.toolGradient('text_utilities'),
            onTap: () => Share.share(l.shareAppMessage(AppConstants.playStoreUrl)),
          ),
          const SizedBox(height: 12),
          FeatureTile(
            icon: Icons.privacy_tip_outlined,
            title: l.privacyPolicyTitle,
            subtitle: l.privacyPolicySubtitle,
            gradient: AppColors.toolGradient('unit_converter'),
            onTap: () => _launchUrl(AppConstants.privacyPolicyUrl),
          ),
          if (privacyRequired) ...[
            const SizedBox(height: 12),
            FeatureTile(
              icon: Icons.tune_rounded,
              title: l.privacyChoicesTitle,
              subtitle: l.privacyChoicesSubtitle,
              gradient: AppColors.toolGradient('hash_generator'),
              onTap: () async {
                // Double tap would stack two UMP forms.
                if (_privacyFormOpen) return;
                _privacyFormOpen = true;
                try {
                  await ref.read(adsServiceProvider).showPrivacyOptions();
                } catch (_) {
                  // UMP form failed to load (offline): nothing to show.
                } finally {
                  _privacyFormOpen = false;
                }
              },
            ),
          ],
          const SizedBox(height: 32),

          Builder(
            builder: (context) {
              final info = ref.watch(_packageInfoProvider).valueOrNull;
              final version = info?.version ?? '…';
              final build = info?.buildNumber ?? '';
              return Center(
                child: Text(
                  l.versionLabel(build.isEmpty ? version : '$version ($build)'),
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickLanguage(BuildContext context, WidgetRef ref, Locale? current) async {
    final l = AppLocalizations.of(context);
    // Grab these before the await: the sheet can outlive this element.
    final storage = ref.read(storageServiceProvider);
    final localeNotifier = ref.read(localeProvider.notifier);
    final selected = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (sheet) => SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(sheet).height * 0.75),
          child: RadioGroup<String>(
            groupValue: current?.languageCode ?? '',
            onChanged: (v) => Navigator.of(sheet).pop(v),
            child: ListView(
              shrinkWrap: true,
              children: [
                RadioListTile<String>(value: '', title: Text(l.languageSystem)),
                for (final entry in _languageNames.entries)
                  RadioListTile<String>(value: entry.key, title: Text(entry.value)),
              ],
            ),
          ),
        ),
      ),
    );
    if (selected == null || selected == (current?.languageCode ?? '')) return;
    final code = selected.isEmpty ? null : selected;
    // Switch the UI right away, then persist.
    localeNotifier.state = code == null ? null : Locale(code);
    await storage.setLocaleCode(code);
  }
}

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
        border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
