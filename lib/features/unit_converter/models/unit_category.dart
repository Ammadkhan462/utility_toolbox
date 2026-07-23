class ConversionUnit {
  const ConversionUnit({
    required this.name,
    required this.symbol,
    required this.toBaseFactor,
  });

  final String name;
  final String symbol;
  final double toBaseFactor;
}

class UnitCategory {
  const UnitCategory({
    required this.name,
    required this.units,
    this.isTemperature = false,
  });

  final String name;
  final List<ConversionUnit> units;
  final bool isTemperature;
}
