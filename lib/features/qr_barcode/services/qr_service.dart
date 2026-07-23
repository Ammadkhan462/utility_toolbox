import 'package:utility_toolbox/features/qr_barcode/models/scan_history_item.dart';

class QrService {
  String classifyContent(String content) {
    final trimmed = content.trim();
    final lower = trimmed.toLowerCase();

    if (lower.startsWith('http://') || lower.startsWith('https://')) {
      return 'url';
    }
    if (trimmed.startsWith('WIFI:')) return 'wifi';
    if (trimmed.contains('BEGIN:VCARD')) return 'contact';
    return 'text';
  }

  ScanHistoryItem createHistoryItem(String content) {
    return ScanHistoryItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      type: classifyContent(content),
      scannedAt: DateTime.now(),
    );
  }
}
