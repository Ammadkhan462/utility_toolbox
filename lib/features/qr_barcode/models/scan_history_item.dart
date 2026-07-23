class ScanHistoryItem {
  ScanHistoryItem({
    required this.id,
    required this.content,
    required this.type,
    required this.scannedAt,
  });

  final String id;
  final String content;
  final String type;
  final DateTime scannedAt;

  Map<String, dynamic> toMap() => {
        'id': id,
        'content': content,
        'type': type,
        'scannedAt': scannedAt.toIso8601String(),
      };

  factory ScanHistoryItem.fromMap(Map<String, dynamic> map) {
    return ScanHistoryItem(
      id: map['id'] as String,
      content: map['content'] as String,
      type: map['type'] as String,
      scannedAt: DateTime.parse(map['scannedAt'] as String),
    );
  }
}
