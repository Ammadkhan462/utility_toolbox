class SavedLocation {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final String? address;
  final DateTime savedAt;
  final String? note;

  const SavedLocation({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    this.address,
    required this.savedAt,
    this.note,
  });

  Map<String, dynamic> toJson() => {
    'id':        id,
    'name':      name,
    'latitude':  latitude,
    'longitude': longitude,
    'address':   address,
    'savedAt':   savedAt.toIso8601String(),
    'note':      note,
  };

  factory SavedLocation.fromJson(Map<String, dynamic> j) => SavedLocation(
    id:        j['id'] as String,
    name:      j['name'] as String,
    latitude:  (j['latitude'] as num).toDouble(),
    longitude: (j['longitude'] as num).toDouble(),
    address:   j['address'] as String?,
    savedAt:   DateTime.parse(j['savedAt'] as String),
    note:      j['note'] as String?,
  );

  String get coordsString =>
      '${latitude.toStringAsFixed(6)}, ${longitude.toStringAsFixed(6)}';

  String get mapsUrl =>
      'https://maps.google.com/?q=$latitude,$longitude';
}
