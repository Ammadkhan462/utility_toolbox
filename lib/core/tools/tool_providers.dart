import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/core/tools/tool_input.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';

/// Starred tool ids, in the order the user starred them.
class FavoritesNotifier extends StateNotifier<List<String>> {
  FavoritesNotifier(this._storage)
    : super(
        _storage
            .getFavoriteTools()
            .where((id) => ToolRegistry.byId(id) != null)
            .toList(),
      );

  final StorageService _storage;

  bool isFavorite(String id) => state.contains(id);

  Future<void> toggle(String id) async {
    state = state.contains(id)
        ? state.where((x) => x != id).toList()
        : [...state, id];
    await _storage.setFavoriteTools(state);
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<String>>((ref) {
      return FavoritesNotifier(ref.watch(storageServiceProvider));
    });

/// Most-recently opened tool ids, newest first.
class RecentToolsNotifier extends StateNotifier<List<String>> {
  RecentToolsNotifier(this._storage)
    : super(
        _storage
            .getRecentTools()
            .map((id) => ToolRegistry.byId(id)?.id)
            .whereType<String>()
            .toSet()
            .toList(),
      );

  final StorageService _storage;

  Future<void> touch(String id) async {
    state = [id, ...state.where((x) => x != id)]
        .take(StorageService.maxRecentTools)
        .toList();
    await _storage.setRecentTools(state);
  }
}

final recentToolsProvider =
    StateNotifierProvider<RecentToolsNotifier, List<String>>((ref) {
      return RecentToolsNotifier(ref.watch(storageServiceProvider));
    });

/// The one way to open a tool: records it as recent and navigates, passing
/// [input] (shared files/text) through GoRouter's `extra`.
void openTool(
  BuildContext context,
  WidgetRef ref,
  ToolDefinition tool, {
  ToolInput? input,
}) {
  ref.read(recentToolsProvider.notifier).touch(tool.id);
  context.push(tool.route, extra: input);
}
