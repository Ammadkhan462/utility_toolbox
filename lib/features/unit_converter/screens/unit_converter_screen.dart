import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/unit_converter/data/conversion_data.dart';
import 'package:utility_toolbox/features/unit_converter/models/unit_category.dart';
import 'package:utility_toolbox/features/unit_converter/providers/unit_converter_providers.dart';

class UnitConverterScreen extends ConsumerStatefulWidget {
  const UnitConverterScreen({super.key});

  @override
  ConsumerState<UnitConverterScreen> createState() =>
      _UnitConverterScreenState();
}

class _UnitConverterScreenState extends ConsumerState<UnitConverterScreen> {
  // Persistent controllers to avoid cursor-jump on rebuild
  late final TextEditingController _fromCtrl;
  late final TextEditingController _toCtrl;

  @override
  void initState() {
    super.initState();
    _fromCtrl = TextEditingController();
    _toCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _fromCtrl.dispose();
    _toCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final category = ref.watch(selectedCategoryProvider);
    final fromUnit = ref.watch(fromUnitProvider);
    final toUnit = ref.watch(toUnitProvider);
    final input = ref.watch(inputValueProvider);
    final output = ref.watch(convertedValueProvider);

    // Sync controllers only when value changed externally (swap, category)
    if (_fromCtrl.text != input && !_fromCtrl.selection.isCollapsed) {
      _fromCtrl.text = input;
    } else if (_toCtrl.text != output) {
      _toCtrl.text = output;
    }

    return ToolScaffold(
      title: 'Unit Converter',
      accentColor: AppColors.toolAccent('unit_converter'),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          16,
          8,
          16,
          MediaQuery.viewInsetsOf(context).bottom + 16,
        ),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Category chips
            SizedBox(
              height: 44,
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
                    onSelected: (_) {
                      resetUnitsForCategory(ref, item);
                      _fromCtrl.clear();
                      _toCtrl.clear();
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // From row
            _UnitCard(
              label: 'From',
              accentColor: AppColors.toolAccent('unit_converter'),
              units: category.units,
              selected: fromUnit,
              controller: _fromCtrl,
              readOnly: false,
              onUnitChanged: (unit) {
                ref.read(fromUnitProvider.notifier).state = unit;
              },
              onValueChanged: (value) {
                ref.read(inputValueProvider.notifier).state = value;
                // Sync output controller
                final out = ref.read(convertedValueProvider);
                _toCtrl.text = out;
              },
            ),
            const SizedBox(height: 8),

            // Swap button
            Center(
              child: Material(
                color: AppColors.toolAccent(
                  'unit_converter',
                ).withValues(alpha: 0.12),
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    final prevFrom = ref.read(fromUnitProvider);
                    final prevTo = ref.read(toUnitProvider);
                    final prevOut = output;
                    ref.read(fromUnitProvider.notifier).state = prevTo;
                    ref.read(toUnitProvider.notifier).state = prevFrom;
                    ref.read(inputValueProvider.notifier).state = prevOut;
                    _fromCtrl.text = prevOut;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.swap_vert_rounded,
                      color: AppColors.toolAccent('unit_converter'),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // To row
            _UnitCard(
              label: 'To',
              accentColor: AppColors.toolAccent('unit_converter'),
              units: category.units,
              selected: toUnit,
              controller: _toCtrl,
              readOnly: true,
              onUnitChanged: (unit) {
                ref.read(toUnitProvider.notifier).state = unit;
              },
              onValueChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}

class _UnitCard extends StatelessWidget {
  const _UnitCard({
    required this.label,
    required this.accentColor,
    required this.units,
    required this.selected,
    required this.controller,
    required this.readOnly,
    required this.onUnitChanged,
    required this.onValueChanged,
  });

  final String label;
  final Color accentColor;
  final List<ConversionUnit> units;
  final ConversionUnit selected;
  final TextEditingController controller;
  final bool readOnly;
  final ValueChanged<ConversionUnit> onUnitChanged;
  final ValueChanged<String> onValueChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(color: accentColor),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<ConversionUnit>(
            initialValue: selected,
            isExpanded: true,
            decoration: const InputDecoration(),
            items: units.map((u) {
              return DropdownMenuItem(
                value: u,
                child: Text(
                  '${u.name} (${u.symbol})',
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (unit) {
              if (unit != null) onUnitChanged(unit);
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            readOnly: readOnly,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: readOnly ? accentColor : null,
            ),
            decoration: InputDecoration(
              hintText: readOnly ? '—' : 'Enter value',
              suffixText: selected.symbol,
            ),
            onChanged: readOnly ? null : onValueChanged,
          ),
        ],
      ),
    );
  }
}
