import 'package:flutter/material.dart';

/// Design tokens built on Material 3's `ColorScheme.fromSeed`, plus a
/// handful of semantic colors this app needs beyond the generated scheme
/// (gainer/loser green-red, the dashboard's caution banner for `notes`).
class AppColors {
  AppColors._();

  static const Color _seed = Color(0xFF1B5E20); // deep green - market/finance association

  static ColorScheme get lightScheme => ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.light);

  static ColorScheme get darkScheme => ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.dark);

  static const Color positiveChange = Color(0xFF2E7D32);
  static const Color negativeChange = Color(0xFFC62828);
  static const Color neutralChange = Color(0xFF757575);

  static const Color cautionBannerLight = Color(0xFFFFF3CD);
  static const Color cautionBannerDark = Color(0xFF4A3B00);
  static const Color cautionBannerTextLight = Color(0xFF664D03);
  static const Color cautionBannerTextDark = Color(0xFFFFE69C);
}
