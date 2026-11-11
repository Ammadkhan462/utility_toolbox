import 'package:utility_toolbox/features/unit_converter/models/unit_category.dart';

final conversionCategories = <UnitCategory>[
  UnitCategory(
    id: 'length',
    name: 'Length',
    units: [
      ConversionUnit(id: 'millimeter', name: 'Millimeter', symbol: 'mm', toBaseFactor: 0.001),
      ConversionUnit(id: 'centimeter', name: 'Centimeter', symbol: 'cm', toBaseFactor: 0.01),
      ConversionUnit(id: 'meter', name: 'Meter', symbol: 'm', toBaseFactor: 1),
      ConversionUnit(id: 'kilometer', name: 'Kilometer', symbol: 'km', toBaseFactor: 1000),
      ConversionUnit(id: 'inch', name: 'Inch', symbol: 'in', toBaseFactor: 0.0254),
      ConversionUnit(id: 'foot', name: 'Foot', symbol: 'ft', toBaseFactor: 0.3048),
      ConversionUnit(id: 'mile', name: 'Mile', symbol: 'mi', toBaseFactor: 1609.344),
    ],
  ),
  UnitCategory(
    id: 'weight',
    name: 'Weight',
    units: [
      ConversionUnit(id: 'gram', name: 'Gram', symbol: 'g', toBaseFactor: 1),
      ConversionUnit(id: 'kilogram', name: 'Kilogram', symbol: 'kg', toBaseFactor: 1000),
      ConversionUnit(id: 'ounce', name: 'Ounce', symbol: 'oz', toBaseFactor: 28.349523125),
      ConversionUnit(id: 'pound', name: 'Pound', symbol: 'lb', toBaseFactor: 453.59237),
    ],
  ),
  UnitCategory(
    id: 'temperature',
    name: 'Temperature',
    isTemperature: true,
    units: [
      ConversionUnit(id: 'celsius', name: 'Celsius', symbol: '°C', toBaseFactor: 0),
      ConversionUnit(id: 'fahrenheit', name: 'Fahrenheit', symbol: '°F', toBaseFactor: 0),
      ConversionUnit(id: 'kelvin', name: 'Kelvin', symbol: 'K', toBaseFactor: 0),
    ],
  ),
  UnitCategory(
    id: 'area',
    name: 'Area',
    units: [
      ConversionUnit(id: 'squareMeter', name: 'Square meter', symbol: 'm²', toBaseFactor: 1),
      ConversionUnit(id: 'squareFoot', name: 'Square foot', symbol: 'ft²', toBaseFactor: 0.09290304),
      ConversionUnit(id: 'acre', name: 'Acre', symbol: 'ac', toBaseFactor: 4046.8564224),
      ConversionUnit(id: 'hectare', name: 'Hectare', symbol: 'ha', toBaseFactor: 10000),
    ],
  ),
  UnitCategory(
    id: 'volume',
    name: 'Volume',
    units: [
      ConversionUnit(id: 'milliliter', name: 'Milliliter', symbol: 'mL', toBaseFactor: 1),
      ConversionUnit(id: 'liter', name: 'Liter', symbol: 'L', toBaseFactor: 1000),
      ConversionUnit(id: 'gallonUs', name: 'Gallon (US)', symbol: 'gal', toBaseFactor: 3785.411784),
      ConversionUnit(id: 'fluidOunce', name: 'Fluid ounce', symbol: 'fl oz', toBaseFactor: 29.5735295625),
    ],
  ),
];

double convertUnits(
  double value,
  ConversionUnit from,
  ConversionUnit to, {
  required bool isTemperature,
}) {
  if (isTemperature) {
    return _convertTemperature(value, from.symbol, to.symbol);
  }

  final baseValue = value * from.toBaseFactor;
  return baseValue / to.toBaseFactor;
}

double _convertTemperature(double value, String fromSymbol, String toSymbol) {
  double celsius = value;
  if (fromSymbol == '°F') {
    celsius = (value - 32) * 5 / 9;
  } else if (fromSymbol == 'K') {
    celsius = value - 273.15;
  }

  if (toSymbol == '°C') return celsius;
  if (toSymbol == '°F') return celsius * 9 / 5 + 32;
  return celsius + 273.15;
}

String formatConvertedValue(double? value) {
  if (value == null || value.isNaN || value.isInfinite) return '';
  final abs = value.abs();
  if (abs >= 1e12 || (abs > 0 && abs < 1e-6)) {
    // 1.5000e+12 → 1.5e+12
    return value
        .toStringAsExponential(4)
        .replaceFirst(RegExp(r'\.?0+e'), 'e');
  }
  // More decimals for small values so e.g. 1 g → 0.002205 lb isn't cut to
  // 0.0022; whole-number results like 1 km → 1000000 mm stay plain.
  final s = value.toStringAsFixed(abs < 1 ? 6 : 4);
  final trimmed = s.replaceFirst(RegExp(r'\.?0+$'), '');
  return trimmed == '-0' ? '0' : trimmed;
}
