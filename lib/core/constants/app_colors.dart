import 'package:flutter/material.dart';

class AppColors {
  // Brand Primary (Automotive Amber / Racing Precision)
  static const Color primary = Color(0xFFEA580C); // Clean vibrant Orange 600
  static const Color primaryLight = Color(0xFFF97316); // Orange 500
  static const Color primaryDark = Color(0xFFC2410C); // Orange 700

  // Secondary & Accents
  static const Color secondary = Color(0xFF0F172A); // Slate 900
  static const Color accent = Color(0xFF0284C7); // Sky 600
  static const Color accentLight = Color(0xFF38BDF8); // Sky 400
  static const Color success = Color(0xFF10B981); // Emerald 500
  static const Color warning = Color(0xFFF59E0B); // Amber 500
  static const Color danger = Color(0xFFEF4444); // Red 500

  // Dark Theme Surfaces
  static const Color bgDark = Color(0xFF0B0F17); // Refined pure dark
  static const Color bgSurface = Color(0xFF131B28); // Elevated dark surface
  static const Color bgCard = Color(0xFF172030); // Card dark
  static const Color border = Color(0xFF263348); // Subtle dark border
  static const Color textDarkPrimary = Color(0xFFF8FAFC);
  static const Color textDarkSecondary = Color(0xFF94A3B8);
  static const Color textDarkMuted = Color(0xFF64748B);

  // Light Theme Surfaces
  static const Color bgLight = Color(0xFFF8FAFC);
  static const Color bgLightSurface = Color(0xFFFFFFFF);
  static const Color bgLightElevated = Color(0xFFF1F5F9);
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color textLightPrimary = Color(0xFF0F172A);
  static const Color textLightSecondary = Color(0xFF475569);
  static const Color textLightMuted = Color(0xFF94A3B8);

  // Vehicle Type Colors
  static const Color carColor = Color(0xFF0284C7);
  static const Color carColorLight = Color(0xFF38BDF8);
  static const Color motoColor = Color(0xFFD97706);
  static const Color motoColorLight = Color(0xFFF59E0B);
}

extension AppThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  Color get textPrimary => isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary;
  Color get textSecondary => isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary;
  Color get textMuted => isDark ? AppColors.textDarkMuted : AppColors.textLightMuted;

  Color get cardBg => isDark ? AppColors.bgCard : AppColors.bgLightSurface;
  Color get surfaceBg => isDark ? AppColors.bgSurface : AppColors.bgLightElevated;
  Color get scaffoldBg => isDark ? AppColors.bgDark : AppColors.bgLight;
  Color get borderColor => isDark ? AppColors.border : AppColors.borderLight;
}
