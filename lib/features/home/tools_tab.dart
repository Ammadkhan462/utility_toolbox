import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/widgets/app_logo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/tools/tool_providers.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';
import 'package:utility_toolbox/features/home/widgets/tool_tiles.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// The Tools tab: search → quick actions → favorites → recent → every tool
/// grouped by job. Static layout, no looping animations, so it paints once
/// and stays cheap.
class ToolsTab extends ConsumerStatefulWidget {
  const ToolsTab({super.key});

  @override
  ConsumerState<ToolsTab> createState() => _ToolsTabState();
}

class _ToolsTabState extends ConsumerState<ToolsTab> {
  final _searchCtrl = TextEditingController();
  final _searchFocus = FocusNode();
  String _query = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchCtrl.clear();
    setState(() => _query = '');
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final favorites = ref.watch(favoritesProvider);
    final recents = ref.watch(recentToolsProvider);

    final searching = _query.trim().isNotEmpty;
    final results = searching
        ? ToolRegistry.search(_query, l)
        : const <ToolDefinition>[];

    List<ToolDefinition> resolve(List<String> ids) =>
        ids.map(ToolRegistry.byId).whereType<ToolDefinition>().toList();

    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        SliverToBoxAdapter(child: _Header(l: l)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: _SearchField(
              controller: _searchCtrl,
              focusNode: _searchFocus,
              hint: l.searchHint,
              onChanged: (v) => setState(() => _query = v),
              onClear: _clearSearch,
            ),
          ),
        ),
        if (searching) ...[
          if (results.isEmpty)
            SliverToBoxAdapter(child: _NoResults(text: l.searchNoResults(_query.trim())))
          else
            SliverList.builder(
              itemCount: results.length,
              itemBuilder: (_, i) => ToolListTile(tool: results[i]),
            ),
        ] else ...[
          _sectionTitle(context, l.quickActions),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.9,
              children: [
                for (final t in ToolRegistry.quickActions) QuickActionCard(tool: t),
              ],
            ),
          ),
          if (favorites.isNotEmpty) ...[
            _sectionTitle(context, l.favorites, icon: Icons.star_rounded),
            SliverToBoxAdapter(child: ToolStrip(tools: resolve(favorites))),
          ],
          if (recents.isNotEmpty) ...[
            _sectionTitle(context, l.recent, icon: Icons.history_rounded),
            SliverToBoxAdapter(child: ToolStrip(tools: resolve(recents))),
          ],
          for (final category in ToolCategory.values) ...[
            _sectionTitle(context, category.label(l), icon: category.icon),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 96,
                  mainAxisExtent: 104,
                ),
                delegate: SliverChildListDelegate([
                  for (final t in ToolRegistry.inCategory(category))
                    ToolGridTile(tool: t),
                ]),
              ),
            ),
          ],
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ],
    );
  }

  Widget _sectionTitle(BuildContext context, String title, {IconData? icon}) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.l});

  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 8, 8),
      child: Row(
        children: [
          const AppLogo(size: 36),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              l.appName,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.3,
              ),
            ),
          ),
          IconButton(
            tooltip: l.settingsTooltip,
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push(AppRoutes.settings),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.focusNode,
    required this.hint,
    required this.onChanged,
    required this.onClear,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (_, value, __) => value.text.isEmpty
              ? const SizedBox.shrink()
              : IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: onClear,
                ),
        ),
        filled: true,
        fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.6,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
        ),
      ),
    );
  }
}

class _NoResults extends StatelessWidget {
  const _NoResults({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
      child: Column(
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 48,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
