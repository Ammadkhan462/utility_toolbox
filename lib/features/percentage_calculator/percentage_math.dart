/// Pure formulas behind the Percentage & Discount tool. Every function
/// returns null rather than NaN/Infinity so the UI never shows garbage.
library;

import 'package:utility_toolbox/features/percentage_calculator/number_input.dart';

class PercentageMath {
  PercentageMath._();

  /// X% of Y.
  static double? percentOf(double? percent, double? number) {
    if (percent == null || number == null) return null;
    return finiteOrNull(percent / 100 * number);
  }

  /// [part] is what percent of [total]?
  static double? whatPercent(double? part, double? total) {
    if (part == null || total == null || total == 0) return null;
    return finiteOrNull(part / total * 100);
  }

  /// Percentage change from [from] to [to] (positive = increase).
  static double? percentChange(double? from, double? to) {
    if (from == null || to == null || from == 0) return null;
    return finiteOrNull((to - from) / from.abs() * 100);
  }

  /// Price after a discount and an optional extra discount applied on top
  /// (e.g. "50% + extra 10%" = 55% off, not 60%).
  static DiscountResult? discount(
    double? price,
    double? discountPercent, {
    double? extraPercent,
  }) {
    if (price == null || discountPercent == null || price < 0) return null;
    final d1 = discountPercent.clamp(0, 100) / 100;
    final d2 = (extraPercent ?? 0).clamp(0, 100) / 100;
    final pay = price * (1 - d1) * (1 - d2);
    final save = price - pay;
    final effective = price == 0 ? (1 - (1 - d1) * (1 - d2)) * 100 : save / price * 100;
    if (!pay.isFinite || !save.isFinite || !effective.isFinite) return null;
    return DiscountResult(pay: pay, save: save, effectivePercent: effective);
  }

  /// Tip and per-person split for a bill.
  static TipResult? tip(double? bill, double? tipPercent, int people) {
    if (bill == null || tipPercent == null || bill < 0 || tipPercent < 0) {
      return null;
    }
    final n = people < 1 ? 1 : people;
    final tipAmount = bill * tipPercent / 100;
    final total = bill + tipAmount;
    final per = total / n;
    if (!total.isFinite || !per.isFinite) return null;
    return TipResult(tip: tipAmount, total: total, perPerson: per);
  }

  /// Adds tax at [ratePercent] to a net (pre-tax) [amount].
  static TaxResult? addTax(double? amount, double? ratePercent) {
    if (amount == null || ratePercent == null || ratePercent < 0) return null;
    final tax = amount * ratePercent / 100;
    final gross = amount + tax;
    if (!gross.isFinite) return null;
    return TaxResult(net: amount, tax: tax, gross: gross);
  }

  /// Removes tax from a gross (tax-inclusive) [amount].
  static TaxResult? removeTax(double? amount, double? ratePercent) {
    if (amount == null || ratePercent == null || ratePercent < 0) return null;
    final net = amount / (1 + ratePercent / 100);
    final tax = amount - net;
    if (!net.isFinite || !tax.isFinite) return null;
    return TaxResult(net: net, tax: tax, gross: amount);
  }
}

class DiscountResult {
  const DiscountResult({
    required this.pay,
    required this.save,
    required this.effectivePercent,
  });

  final double pay;
  final double save;
  final double effectivePercent;
}

class TipResult {
  const TipResult({
    required this.tip,
    required this.total,
    required this.perPerson,
  });

  final double tip;
  final double total;
  final double perPerson;
}

class TaxResult {
  const TaxResult({required this.net, required this.tax, required this.gross});

  final double net;
  final double tax;
  final double gross;
}
