class ConversionUnit {
  const ConversionUnit({
    required this.id,
    required this.name,
    required this.symbol,
    required this.toBaseFactor,
  });

  /// Stable key for the localized name (`unitName(id)`).
  final String id;

  /// English name (fallback / debugging); the UI shows the localized one.
  final String name;
  final String symbol;
  final double toBaseFactor;
}

class UnitCategory {
  const UnitCategory({
    required this.id,
    required this.name,
    required this.units,
    this.isTemperature = false,
  });

  /// Stable key for the localized name (`unitCategoryName(id)`).
  final String id;
  final String name;
  final List<ConversionUnit> units;
  final bool isTemperature;
}
