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

  Future<void> addItem(ScanHistoryItem item) async {
    await _ref.read(storageServiceProvider).addScanHistoryItem(item);
    _load();
  }

  Future<void> deleteItem(String id) async {
    await _ref.read(storageServiceProvider).deleteScanHistoryItem(id);
    _load();
  }

  Future<void> clearAll() async {
    await _ref.read(storageServiceProvider).clearScanHistory();
    _load();
  }
}
