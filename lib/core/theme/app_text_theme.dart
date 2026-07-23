import 'package:flutter/material.dart';

/// The type scale actually used by this app - Material 3's default
/// `Typography.material2021` covers the rest; only the roles this app
/// leans on heavily (prices, section headers, list labels) get explicit
/// weight/size tuning here.
class AppTextTheme {
  AppTextTheme._();

  static TextTheme build(ColorScheme scheme) {
    return const TextTheme(
      headlineSmall: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
      titleLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      titleMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      labelLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      labelMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
    ).apply(bodyColor: scheme.onSurface, displayColor: scheme.onSurface);
  }
}
