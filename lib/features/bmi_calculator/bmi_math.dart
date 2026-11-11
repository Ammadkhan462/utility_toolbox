/// Pure BMI formulas and unit conversions (WHO adult categories).
library;

enum BmiCategory { underweight, normal, overweight, obese }

class BmiMath {
  BmiMath._();

  static const cmPerInch = 2.54;
  static const kgPerLb = 0.45359237;

  static const underweightBelow = 18.5;
  static const normalBelow = 25.0;
  static const overweightBelow = 30.0;

  /// Healthy range used for the "healthy weight for your height" line.
  static const healthyMin = 18.5;
  static const healthyMax = 24.9;

  /// BMI = kg / m². Null for missing or impossible input.
  static double? bmi({required double? weightKg, required double? heightCm}) {
    if (weightKg == null || heightCm == null) return null;
    if (weightKg <= 0 || heightCm <= 0) return null;
    final m = heightCm / 100;
    final v = weightKg / (m * m);
    return v.isFinite ? v : null;
  }

  static BmiCategory category(double bmi) {
    if (bmi < underweightBelow) return BmiCategory.underweight;
    if (bmi < normalBelow) return BmiCategory.normal;
    if (bmi < overweightBelow) return BmiCategory.overweight;
    return BmiCategory.obese;
  }

  /// Weight range (kg) that gives a BMI of 18.5–24.9 at [heightCm].
  static ({double min, double max})? healthyWeightKg(double? heightCm) {
    if (heightCm == null || heightCm <= 0) return null;
    final m2 = (heightCm / 100) * (heightCm / 100);
    return (min: healthyMin * m2, max: healthyMax * m2);
  }

  /// Kilograms to gain (negative) or lose (positive) to reach the healthy
  /// range; 0 when already inside it.
  static double weightToHealthyKg({required double weightKg, required double heightCm}) {
    final range = healthyWeightKg(heightCm);
    if (range == null) return 0;
    if (weightKg > range.max) return weightKg - range.max;
    if (weightKg < range.min) return weightKg - range.min;
    return 0;
  }

  /// Devine ideal body weight (kg); only meaningful for adults ≥ 152 cm.
  static double? devineIdealKg({required double heightCm, required bool male}) {
    if (heightCm < 152.4) return null;
    final inchesOver5ft = heightCm / cmPerInch - 60;
    return (male ? 50.0 : 45.5) + 2.3 * inchesOver5ft;
  }

  static double cmFromFeetInches(double feet, double inches) =>
      (feet * 12 + inches) * cmPerInch;

  /// Splits [cm] into whole feet and rounded inches (never "5 ft 12 in").
  static ({int feet, int inches}) feetInchesFromCm(double cm) {
    var totalInches = (cm / cmPerInch).round();
    if (totalInches < 0) totalInches = 0;
    return (feet: totalInches ~/ 12, inches: totalInches % 12);
  }

  static double kgFromLb(double lb) => lb * kgPerLb;

  static double lbFromKg(double kg) => kg / kgPerLb;

  /// Position (0–1) of [bmi] on a gauge that spans [min]–[max].
  static double gaugeFraction(double bmi, {double min = 15, double max = 40}) =>
      ((bmi - min) / (max - min)).clamp(0.0, 1.0);
}
