import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // static const Color backgroundPaper = Color(0xFFF0E7D7);
  static const Color backgroundPaper = Color(0xFFDDCCB2);
  static const Color backgroundPaperLight = Color(0xFFEFE7DC);
  static const Color bloodRed = Color(0xFFE4002B);

  // static const Color originalBlueSky = Color(0xFFACE0F4);
  // static const Color originalDeepPurple = Color(0xFF1E1954);
  // static const Color originalMiddleBlue = Color(0xFF0294C2);
  //
  // static const Color deepSkyBlue = Color(0xFF0D75F8);
  // static const Color purpleHaze = Color(0xFFA81FE0);
  // static const Color clearSkyBlue = Color(0xFF09E8FF);
  //
  // // Primary color
  // static const Color primary = originalDeepPurple;
  // // static const Color primary = deepSkyBlue;
  //
  // static AppColor primaryShades = AppColor(primary);
  // static HSLColor primaryHsl = HSLColor.fromColor(primary);
  // static const Color onPrimary = Colors.white;
  // static Color primaryContainer = primaryShades.shade900;
  // static Color onPrimaryContainer = primaryShades.shade100;
  //
  // // Secondary color
  // static const Color secondary = purpleHaze;
  //
  // static AppColor secondaryShades = AppColor(secondary);
  // static HSLColor secondaryHsl = HSLColor.fromColor(secondary);
  // static const Color onSecondary = Colors.white;
  // static Color secondaryContainer = secondaryShades.shade900;
  // static Color onSecondaryContainer = secondaryShades.shade100;
  //
  // static Color background = const Color(0xFF1E1954);
  //
  // static Color textColor = const Color(0xFFFFFFFF);

}

class AppColor {

  late final Map<int, Color> swatch;
  final Color color;
  final HSLColor hslColor;

  AppColor(this.color) : hslColor = HSLColor.fromColor(color) {
    swatch = {
      100: hslColor.withLightness(0.10).toColor(),
      200: hslColor.withLightness(0.20).toColor(),
      300: hslColor.withLightness(0.30).toColor(),
      400: hslColor.withLightness(0.40).toColor(),
      500: hslColor.withLightness(0.50).toColor(),
      600: hslColor.withLightness(0.60).toColor(),
      700: hslColor.withLightness(0.70).toColor(),
      800: hslColor.withLightness(0.80).toColor(),
      900: hslColor.withLightness(0.90).toColor(),
    };
  }

  Color get shade100 => swatch[100]!;
  Color get shade200 => swatch[200]!;
  Color get shade300 => swatch[300]!;
  Color get shade400 => swatch[400]!;
  Color get shade500 => swatch[500]!;
  Color get shade600 => swatch[600]!;
  Color get shade700 => swatch[700]!;
  Color get shade800 => swatch[800]!;
  Color get shade900 => swatch[900]!;

}
