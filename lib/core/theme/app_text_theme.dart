import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Clean typography scale using GoogleFonts.inter for modern fintech feel.
class AppTextTheme {
  AppTextTheme._();

  static TextTheme build(ColorScheme scheme) {
    final baseTextTheme = GoogleFonts.interTextTheme();
    return baseTextTheme
        .copyWith(
          displayMedium: const TextStyle(fontWeight: FontWeight.w700, fontSize: 36, letterSpacing: -0.8),
          headlineMedium: const TextStyle(fontWeight: FontWeight.w700, fontSize: 28, letterSpacing: -0.5),
          headlineSmall: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24, letterSpacing: -0.3),
          titleLarge: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20, letterSpacing: -0.2),
          titleMedium: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, letterSpacing: 0),
          titleSmall: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 0.1),
          bodyLarge: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16, height: 1.5),
          bodyMedium: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14, height: 1.43),
          bodySmall: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12, height: 1.33),
          labelLarge: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 0.1),
          labelMedium: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12, letterSpacing: 0.5),
          labelSmall: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10, letterSpacing: 0.5),
        )
        .apply(bodyColor: scheme.onSurface, displayColor: scheme.onSurface);
  }
}
