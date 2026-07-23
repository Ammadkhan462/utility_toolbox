import 'package:flutter/material.dart';

/// Default Material 3 typography — no custom fonts in v1.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle? titleMedium(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;

  static TextStyle? bodyMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;

  static TextStyle? labelLarge(BuildContext context) =>
      Theme.of(context).textTheme.labelLarge;
}
