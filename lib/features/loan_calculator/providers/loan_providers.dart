import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loanAmountProvider   = StateProvider<double>((ref) => 1000000);
final interestRateProvider = StateProvider<double>((ref) => 8.5);
final loanTenureProvider   = StateProvider<double>((ref) => 12); // months
final tenureInYearsProvider = StateProvider<bool>((ref) => false);

class LoanResult {
  const LoanResult({
    required this.emi,
    required this.totalPayment,
    required this.totalInterest,
    required this.schedule,
  });

  final double             emi;
  final double             totalPayment;
  final double             totalInterest;
  final List<AmortizationRow> schedule;
}

class AmortizationRow {
  const AmortizationRow({
    required this.month,
    required this.emi,
    required this.principal,
    required this.interest,
    required this.balance,
  });

  final int    month;
  final double emi;
  final double principal;
  final double interest;
  final double balance;
}

final loanResultProvider = Provider<LoanResult?>((ref) {
  final principal   = ref.watch(loanAmountProvider);
  final annualRate  = ref.watch(interestRateProvider);
  final rawTenure   = ref.watch(loanTenureProvider);
  final inYears     = ref.watch(tenureInYearsProvider);

  final months      = inYears ? (rawTenure * 12).round() : rawTenure.round();
  final monthlyRate = annualRate / 12 / 100;

  if (principal <= 0 || months <= 0 || annualRate <= 0) return null;

  // EMI formula: P × r × (1+r)^n / ((1+r)^n − 1)
  final factor = pow(1 + monthlyRate, months);
  final emi    = principal * monthlyRate * factor / (factor - 1);

  // Build amortization schedule
  final schedule = <AmortizationRow>[];
  double balance = principal;
  for (var m = 1; m <= months; m++) {
    final interest  = balance * monthlyRate;
    final principal2 = emi - interest;
    balance -= principal2;
    schedule.add(AmortizationRow(
      month:     m,
      emi:       emi,
      principal: principal2,
      interest:  interest,
      balance:   balance < 0 ? 0 : balance,
    ));
  }

  return LoanResult(
    emi:           emi,
    totalPayment:  emi * months,
    totalInterest: emi * months - principal,
    schedule:      schedule,
  );
});
