import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeData {

  static const double spacingXxs = 2.0;
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;
  static const double spacing2xl = 48.0;
  static const double spacing3xl = 64.0;
  static const double spacing4xl = 90.0;

  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 16.0;

  final bool isDark;
  AppThemeData({required this.isDark});

  ThemeData get themeData {

    ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.red,
      background: AppColors.backgroundPaper,
    );

    ThemeData themeData = ThemeData(
      fontFamily: 'RobotoSlab',
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: AppColors.backgroundPaper,
        elevation: 0,
      ),
      textTheme: const TextTheme().apply(
        fontSizeFactor: 1.2,
        fontSizeDelta: 1.2,
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
      colorScheme: colorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        )
      )
    );

    return themeData;
  }

}
