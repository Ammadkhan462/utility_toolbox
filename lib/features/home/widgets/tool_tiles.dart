import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/platform/system_bridge.dart';
import 'package:utility_toolbox/core/tools/tool_providers.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';
import 'package:utility_toolbox/core/widgets/tool_icon.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Long-press menu shared by every tool tile: favorite + pin to home screen.
Future<void> showToolActions(
  BuildContext context,
  WidgetRef ref,
  ToolDefinition tool,
) {
  final l = AppLocalizations.of(context);
  final messenger = ScaffoldMessenger.of(context);
  final isFav = ref.read(favoritesProvider).contains(tool.id);

  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (sheet) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: ToolIcon(icon: tool.icon, colors: tool.colors, size: 40),
            title: Text(
              tool.title(l),
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            subtitle: Text(tool.description(l)),
          ),
          const Divider(height: 8),
          ListTile(
            leading: Icon(isFav ? Icons.star_rounded : Icons.star_outline_rounded),
            title: Text(isFav ? l.toolMenuRemoveFavorite : l.toolMenuAddFavorite),
            onTap: () {
              Navigator.of(sheet).pop();
              ref.read(favoritesProvider.notifier).toggle(tool.id);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_to_home_screen_rounded),
            title: Text(l.toolMenuPinShortcut),
            onTap: () async {
              Navigator.of(sheet).pop();
              final ok = await SystemBridge.instance.pinShortcut(
                toolId: tool.id,
                label: tool.title(l),
              );
              messenger.showSnackBar(
                SnackBar(
                  content: Text(
                    ok ? l.pinShortcutRequested : l.pinShortcutUnsupported,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    ),
  );
}

class _NewBadge extends StatelessWidget {
  const _NewBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        color: const Color(0xFFFF5C7A),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Theme.of(context).colorScheme.surface,
          width: 1.5,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 8.5,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

/// Compact icon + label tile for the category grids and strips.
class ToolGridTile extends ConsumerWidget {
  const ToolGridTile({super.key, required this.tool, this.width});

  final ToolDefinition tool;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final title = tool.title(l);
    return SizedBox(
      width: width,
      child: Semantics(
        button: true,
        label: '$title. ${tool.description(l)}',
        excludeSemantics: true,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => openTool(context, ref, tool),
          onLongPress: () => showToolActions(context, ref, tool),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ToolIcon(icon: tool.icon, colors: tool.colors, size: 52),
                    if (tool.isNew)
                      PositionedDirectional(
                        top: -6,
                        end: -10,
                        child: _NewBadge(label: l.newBadge),
                      ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Horizontal row of tiles (favorites, recent).
class ToolStrip extends StatelessWidget {
  const ToolStrip({super.key, required this.tools});

  final List<ToolDefinition> tools;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: tools.length,
        itemBuilder: (_, i) => ToolGridTile(tool: tools[i], width: 88),
      ),
    );
  }
}

/// Large card for the four top jobs.
class QuickActionCard extends ConsumerWidget {
  const QuickActionCard({super.key, required this.tool});

  final ToolDefinition tool;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    return Material(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        decoration: BoxDecoration(gradient: tool.gradient),
        child: InkWell(
          onTap: () => openTool(context, ref, tool),
          onLongPress: () => showToolActions(context, ref, tool),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(tool.icon, color: Colors.white, size: 28),
                const Spacer(),
                Text(
                  tool.title(l),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
                Text(
                  tool.description(l),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.88),
                    fontSize: 11.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Full-width row used for search results.
class ToolListTile extends ConsumerWidget {
  const ToolListTile({super.key, required this.tool});

  final ToolDefinition tool;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      leading: ToolIcon(icon: tool.icon, colors: tool.colors, size: 44),
      title: Text(
        tool.title(l),
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      subtitle: Text(tool.description(l)),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () => openTool(context, ref, tool),
      onLongPress: () => showToolActions(context, ref, tool),
    );
  }
}
