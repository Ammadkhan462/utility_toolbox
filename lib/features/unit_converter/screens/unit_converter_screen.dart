import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/unit_converter/data/conversion_data.dart';
import 'package:utility_toolbox/features/unit_converter/models/unit_category.dart';
import 'package:utility_toolbox/features/unit_converter/providers/unit_converter_providers.dart';

class UnitConverterScreen extends ConsumerWidget {
  const UnitConverterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(selectedCategoryProvider);
    final fromUnit = ref.watch(fromUnitProvider);
    final toUnit = ref.watch(toUnitProvider);
    final input = ref.watch(inputValueProvider);
    final output = ref.watch(convertedValueProvider);

    return ToolScaffold(
      title: 'Unit Converter',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: conversionCategories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final item = conversionCategories[index];
                  final selected = item.name == category.name;
                  return FilterChip(
                    label: Text(item.name),
                    selected: selected,
                    onSelected: (_) => resetUnitsForCategory(ref, item),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            _UnitRow(
              label: 'From',
              units: category.units,
              selected: fromUnit,
              value: input,
              onUnitChanged: (unit) =>
                  ref.read(fromUnitProvider.notifier).state = unit,
              onValueChanged: (value) =>
                  ref.read(inputValueProvider.notifier).state = value,
            ),
            const SizedBox(height: 8),
            Center(
              child: IconButton(
                icon: const Icon(Icons.swap_vert),
                onPressed: () {
                  ref.read(fromUnitProvider.notifier).state = toUnit;
                  ref.read(toUnitProvider.notifier).state = fromUnit;
                  ref.read(inputValueProvider.notifier).state = output;
                },
              ),
            ),
            const SizedBox(height: 8),
            _UnitRow(
              label: 'To',
              units: category.units,
              selected: toUnit,
              value: output,
              readOnly: true,
              onUnitChanged: (unit) =>
                  ref.read(toUnitProvider.notifier).state = unit,
              onValueChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}

class _UnitRow extends StatelessWidget {
  const _UnitRow({
    required this.label,
    required this.units,
    required this.selected,
    required this.value,
    required this.onUnitChanged,
    required this.onValueChanged,
    this.readOnly = false,
  });

  final String label;
  final List<ConversionUnit> units;
  final ConversionUnit selected;
  final String value;
  final ValueChanged<ConversionUnit> onUnitChanged;
  final ValueChanged<String> onValueChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            DropdownButtonFormField<ConversionUnit>(
              value: selected,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: units
                  .map(
                    (u) => DropdownMenuItem(
                      value: u,
                      child: Text('${u.name} (${u.symbol})'),
                    ),
                  )
                  .toList(),
              onChanged: (unit) {
                if (unit != null) onUnitChanged(unit);
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              readOnly: readOnly,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: readOnly ? 'Converted value' : 'Enter value',
              ),
              controller: TextEditingController(text: value)
                ..selection = TextSelection.collapsed(offset: value.length),
              onChanged: readOnly ? null : onValueChanged,
            ),
          ],
        ),
      ),
    );
  }
}
