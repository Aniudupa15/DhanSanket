import 'package:flutter/material.dart';

/// Design tokens built on Material 3's `ColorScheme.fromSeed`, plus a
/// handful of semantic colors this app needs beyond the generated scheme
/// (gainer/loser green-red, the dashboard's caution banner for `notes`).
class AppColors {
  AppColors._();

  static const Color _seed = Color(0xFF1B5E20); // deep green - market/finance association

  static ColorScheme get lightScheme => ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.light);

  static ColorScheme get darkScheme => ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.dark);

  // Gainer/loser/neutral shades are theme-aware, not fixed constants - a
  // single fixed shade can't clear WCAG AA (4.5:1) against both a white
  // light-mode surface and a near-black dark-mode one at the same time, so
  // dark mode gets a brighter variant.
  static const Color _positiveChangeLight = Color(0xFF2E7D32);
  static const Color _positiveChangeDark = Color(0xFF66BB6A);
  static const Color _negativeChangeLight = Color(0xFFC62828);
  static const Color _negativeChangeDark = Color(0xFFE57373);
  static const Color _neutralChangeLight = Color(0xFF757575);
  static const Color _neutralChangeDark = Color(0xFF9E9E9E);

  static Color positiveChange(BuildContext context) =>
      _isDark(context) ? _positiveChangeDark : _positiveChangeLight;

  static Color negativeChange(BuildContext context) =>
      _isDark(context) ? _negativeChangeDark : _negativeChangeLight;

  static Color neutralChange(BuildContext context) => _isDark(context) ? _neutralChangeDark : _neutralChangeLight;

  static bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;

  static const Color cautionBannerLight = Color(0xFFFFF3CD);
  static const Color cautionBannerDark = Color(0xFF4A3B00);
  static const Color cautionBannerTextLight = Color(0xFF664D03);
  static const Color cautionBannerTextDark = Color(0xFFFFE69C);
}
