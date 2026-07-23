import 'package:utility_toolbox/features/unit_converter/models/unit_category.dart';

final conversionCategories = <UnitCategory>[
  UnitCategory(
    name: 'Length',
    units: [
      ConversionUnit(name: 'Millimeter', symbol: 'mm', toBaseFactor: 0.001),
      ConversionUnit(name: 'Centimeter', symbol: 'cm', toBaseFactor: 0.01),
      ConversionUnit(name: 'Meter', symbol: 'm', toBaseFactor: 1),
      ConversionUnit(name: 'Kilometer', symbol: 'km', toBaseFactor: 1000),
      ConversionUnit(name: 'Inch', symbol: 'in', toBaseFactor: 0.0254),
      ConversionUnit(name: 'Foot', symbol: 'ft', toBaseFactor: 0.3048),
      ConversionUnit(name: 'Mile', symbol: 'mi', toBaseFactor: 1609.344),
    ],
  ),
  UnitCategory(
    name: 'Weight',
    units: [
      ConversionUnit(name: 'Gram', symbol: 'g', toBaseFactor: 1),
      ConversionUnit(name: 'Kilogram', symbol: 'kg', toBaseFactor: 1000),
      ConversionUnit(name: 'Ounce', symbol: 'oz', toBaseFactor: 28.3495),
      ConversionUnit(name: 'Pound', symbol: 'lb', toBaseFactor: 453.592),
    ],
  ),
  UnitCategory(
    name: 'Temperature',
    isTemperature: true,
    units: [
      ConversionUnit(name: 'Celsius', symbol: '°C', toBaseFactor: 0),
      ConversionUnit(name: 'Fahrenheit', symbol: '°F', toBaseFactor: 0),
      ConversionUnit(name: 'Kelvin', symbol: 'K', toBaseFactor: 0),
    ],
  ),
  UnitCategory(
    name: 'Area',
    units: [
      ConversionUnit(name: 'Square meter', symbol: 'm²', toBaseFactor: 1),
      ConversionUnit(name: 'Square foot', symbol: 'ft²', toBaseFactor: 0.092903),
      ConversionUnit(name: 'Acre', symbol: 'ac', toBaseFactor: 4046.86),
      ConversionUnit(name: 'Hectare', symbol: 'ha', toBaseFactor: 10000),
    ],
  ),
  UnitCategory(
    name: 'Volume',
    units: [
      ConversionUnit(name: 'Milliliter', symbol: 'mL', toBaseFactor: 1),
      ConversionUnit(name: 'Liter', symbol: 'L', toBaseFactor: 1000),
      ConversionUnit(name: 'Gallon (US)', symbol: 'gal', toBaseFactor: 3785.41),
      ConversionUnit(name: 'Fluid ounce', symbol: 'fl oz', toBaseFactor: 29.5735),
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
  if (value.abs() >= 1000000 || (value.abs() > 0 && value.abs() < 0.0001)) {
    return value.toStringAsExponential(4);
  }
  return value.toStringAsFixed(4).replaceFirst(RegExp(r'\.?0+$'), '');
}
