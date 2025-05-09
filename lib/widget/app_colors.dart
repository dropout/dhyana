import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // static const Color backgroundPaper = Color(0xFFF0E7D7);
  static const Color backgroundPaper = Color(0xFFDDCCB2);
  static const Color backgroundPaperLight = Color(0xFFEFE7DC);

  static const Color red = Color(0xFFBB0A11);
  static const Color redAccent = Color(0xFFE4002B);
  static const Color splashColor = Colors.black;

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
