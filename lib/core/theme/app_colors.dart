import 'package:flutter/material.dart';

/// Design tokens built on Material 3's `ColorScheme.fromSeed`, plus a
/// comprehensive set of semantic colors for financial applications
/// (gainer/loser green-red, charts, banners, subtle card borders).
class AppColors {
  AppColors._();

  static const Color _seed = Color(0xFF0F766E); // Modern Emerald/Teal finance seed

  static ColorScheme get lightScheme => ColorScheme.fromSeed(
    seedColor: _seed,
    primary: const Color(0xFF0F766E),
    onPrimary: Colors.white,
    primaryContainer: const Color(0xFFCCFBF1),
    onPrimaryContainer: const Color(0xFF115E59),
    secondary: const Color(0xFF1E293B),
    onSecondary: Colors.white,
    secondaryContainer: const Color(0xFFF1F5F9),
    onSecondaryContainer: const Color(0xFF334155),
    surface: const Color(0xFFF8FAFC),
    onSurface: const Color(0xFF0F172A),
    surfaceContainerLowest: const Color(0xFFFFFFFF),
    surfaceContainerLow: const Color(0xFFF1F5F9),
    surfaceContainer: const Color(0xFFE2E8F0),
    surfaceContainerHigh: const Color(0xFFCBD5E1),
    surfaceContainerHighest: const Color(0xFF94A3B8),
    outline: const Color(0xFFCBD5E1),
    outlineVariant: const Color(0xFFE2E8F0),
    brightness: Brightness.light,
  );

  static ColorScheme get darkScheme => ColorScheme.fromSeed(
    seedColor: _seed,
    primary: const Color(0xFF2DD4BF),
    onPrimary: const Color(0xFF042F2C),
    primaryContainer: const Color(0xFF115E59),
    onPrimaryContainer: const Color(0xFFCCFBF1),
    secondary: const Color(0xFF94A3B8),
    onSecondary: const Color(0xFF0F172A),
    secondaryContainer: const Color(0xFF1E293B),
    onSecondaryContainer: const Color(0xFFF1F5F9),
    surface: const Color(0xFF0B0F17),
    onSurface: const Color(0xFFF8FAFC),
    surfaceContainerLowest: const Color(0xFF070A0F),
    surfaceContainerLow: const Color(0xFF111827),
    surfaceContainer: const Color(0xFF1E293B),
    surfaceContainerHigh: const Color(0xFF334155),
    surfaceContainerHighest: const Color(0xFF475569),
    outline: const Color(0xFF334155),
    outlineVariant: const Color(0xFF1E293B),
    brightness: Brightness.dark,
  );

  // Gainer/loser/neutral shades are theme-aware, cleared for WCAG AA (4.5:1 ratio)
  static const Color _positiveChangeLight = Color(0xFF15803D); // Emerald 700
  static const Color _positiveChangeDark = Color(0xFF4ADE80); // Emerald 400
  static const Color _negativeChangeLight = Color(0xFFB91C1C); // Red 700
  static const Color _negativeChangeDark = Color(0xFFF87171); // Red 400
  static const Color _neutralChangeLight = Color(0xFF64748B); // Slate 500
  static const Color _neutralChangeDark = Color(0xFF94A3B8); // Slate 400

  static Color positiveChange(BuildContext context) => _isDark(context) ? _positiveChangeDark : _positiveChangeLight;
  static Color negativeChange(BuildContext context) => _isDark(context) ? _negativeChangeDark : _negativeChangeLight;
  static Color neutralChange(BuildContext context) => _isDark(context) ? _neutralChangeDark : _neutralChangeLight;

  static Color positiveBackground(BuildContext context) =>
      _isDark(context) ? const Color(0xFF064E3B).withValues(alpha: 0.4) : const Color(0xFFDCFCE7);
  static Color negativeBackground(BuildContext context) =>
      _isDark(context) ? const Color(0xFF7F1D1D).withValues(alpha: 0.4) : const Color(0xFFFEE2E2);
  static Color neutralBackground(BuildContext context) =>
      _isDark(context) ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9);

  static Color cardBorder(BuildContext context) => _isDark(context) ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0);

  static bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;

  static const Color cautionBannerLight = Color(0xFFFEF3C7);
  static const Color cautionBannerDark = Color(0xFF451A03);
  static const Color cautionBannerTextLight = Color(0xFF92400E);
  static const Color cautionBannerTextDark = Color(0xFFFDE68A);
}
