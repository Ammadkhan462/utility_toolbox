import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/files/output_record.dart';
import 'package:utility_toolbox/core/services/engagement_service.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';

/// The My Files list, newest first, persisted in shared_preferences.
class OutputsNotifier extends StateNotifier<List<OutputRecord>> {
  OutputsNotifier(this._storage, this._engagement)
    : super(_storage.getOutputs());

  final StorageService _storage;
  final EngagementService _engagement;

  /// Records a produced file and counts it as a successful job (which may
  /// trigger the in-app review prompt).
  Future<void> add(OutputRecord record) async {
    state = [record, ...state.where((r) => r.location != record.location)]
        .take(StorageService.maxOutputs)
        .toList();
    await _storage.setOutputs(state);
    await _engagement.onSuccess();
  }

  Future<void> remove(String id) async {
    final removed = state.where((r) => r.id == id).toList();
    state = state.where((r) => r.id != id).toList();
    await _storage.setOutputs(state);
    // Private copies (pre-Android 10 gallery fallback) are ours to delete;
    // public Downloads/Pictures files are the user's and stay.
    for (final r in removed) {
      if (!r.isContentUri && r.location.contains('/app_outputs/')) {
        try {
          await File(r.location).delete();
        } catch (_) {
          // Already gone.
        }
      }
    }
  }

  Future<void> clear() async {
    for (final r in List.of(state)) {
      await remove(r.id);
    }
  }
}

final outputsProvider =
    StateNotifierProvider<OutputsNotifier, List<OutputRecord>>((ref) {
      return OutputsNotifier(
        ref.watch(storageServiceProvider),
        ref.watch(engagementServiceProvider),
      );
    });
