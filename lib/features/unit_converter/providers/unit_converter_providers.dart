import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/features/unit_converter/data/conversion_data.dart';
import 'package:utility_toolbox/features/unit_converter/models/unit_category.dart';

final selectedCategoryProvider = StateProvider<UnitCategory>((ref) {
  return conversionCategories.first;
});

final fromUnitProvider = StateProvider<ConversionUnit>((ref) {
  return ref.watch(selectedCategoryProvider).units.first;
});

final toUnitProvider = StateProvider<ConversionUnit>((ref) {
  final category = ref.watch(selectedCategoryProvider);
  return category.units.length > 1 ? category.units[1] : category.units.first;
});

final inputValueProvider = StateProvider<String>((ref) => '');

final convertedValueProvider = Provider<String>((ref) {
  final input = ref.watch(inputValueProvider);
  if (input.isEmpty) return '';

  final value = double.tryParse(input);
  if (value == null) return '';

  final category = ref.watch(selectedCategoryProvider);
  final from = ref.watch(fromUnitProvider);
  final to = ref.watch(toUnitProvider);

  final result = convertUnits(
    value,
    from,
    to,
    isTemperature: category.isTemperature,
  );
  return formatConvertedValue(result);
});

void resetUnitsForCategory(WidgetRef ref, UnitCategory category) {
  ref.read(selectedCategoryProvider.notifier).state = category;
  ref.read(fromUnitProvider.notifier).state = category.units.first;
  ref.read(toUnitProvider.notifier).state =
      category.units.length > 1 ? category.units[1] : category.units.first;
  ref.read(inputValueProvider.notifier).state = '';
}
