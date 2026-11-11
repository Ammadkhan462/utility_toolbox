import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/features/qr_barcode/models/scan_history_item.dart';
import 'package:utility_toolbox/features/qr_barcode/services/qr_service.dart';

final qrServiceProvider = Provider<QrService>((ref) => QrService());

final generatorTextProvider = StateProvider.autoDispose<String>((ref) => '');

final scanHistoryProvider =
    StateNotifierProvider<ScanHistoryNotifier, List<ScanHistoryItem>>((ref) {
  return ScanHistoryNotifier(ref);
});

class ScanHistoryNotifier extends StateNotifier<List<ScanHistoryItem>> {
  ScanHistoryNotifier(this._ref) : super([]) {
    _load();
  }

  final Ref _ref;

  void _load() {
    state = _ref.read(storageServiceProvider).getScanHistory();
  }

  /// Keeps history bounded — it is loaded and sorted in full on every change.
  static const _maxItems = 300;

  Future<void> addItem(ScanHistoryItem item) async {
    final storage = _ref.read(storageServiceProvider);
    // Scanning the same code again moves it to the top instead of adding a
    // duplicate row; the oldest rows beyond the cap are dropped.
    final stale = [
      for (final (i, old) in state.indexed)
        if (old.content == item.content || i >= _maxItems - 1) old.id,
    ];
    for (final id in stale) {
      await storage.deleteScanHistoryItem(id);
    }
    await storage.addScanHistoryItem(item);
    _load();
  }

  Future<void> deleteItem(String id) async {
    // Update first: a swiped-away Dismissible must leave the list in the
    // same frame, or Flutter throws "dismissed widget still in the tree".
    state = [for (final item in state) if (item.id != id) item];
    await _ref.read(storageServiceProvider).deleteScanHistoryItem(id);
    _load();
  }

  Future<void> clearAll() async {
    state = const [];
    await _ref.read(storageServiceProvider).clearScanHistory();
    _load();
  }
}
