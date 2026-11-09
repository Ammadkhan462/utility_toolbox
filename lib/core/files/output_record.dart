/// A file the app produced (a PDF saved to Downloads, an image saved to the
/// gallery, …), listed on the My Files tab so it can be opened or shared
/// again later.
class OutputRecord {
  const OutputRecord({
    required this.id,
    required this.name,
    required this.location,
    required this.mimeType,
    required this.toolId,
    required this.createdAt,
    this.sizeBytes,
  });

  final String id;
  final String name;

  /// A `content://` URI (Android MediaStore) or an absolute file path.
  final String location;
  final String mimeType;
  final String toolId;
  final DateTime createdAt;
  final int? sizeBytes;

  bool get isContentUri => location.startsWith('content://');
  bool get isImage => mimeType.startsWith('image/');
  bool get isPdf => mimeType == 'application/pdf';

  Map<String, Object?> toJson() => {
    'id': id,
    'name': name,
    'location': location,
    'mimeType': mimeType,
    'toolId': toolId,
    'createdAt': createdAt.millisecondsSinceEpoch,
    'sizeBytes': sizeBytes,
  };

  static OutputRecord? fromJson(Object? json) {
    if (json is! Map) return null;
    try {
      return OutputRecord(
        id: json['id'] as String,
        name: json['name'] as String,
        location: json['location'] as String,
        mimeType: json['mimeType'] as String,
        toolId: json['toolId'] as String,
        createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        sizeBytes: json['sizeBytes'] as int?,
      );
    } catch (_) {
      return null;
    }
  }
}
