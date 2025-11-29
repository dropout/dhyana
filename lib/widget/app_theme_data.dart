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

  static const double paddingXxs = 2.0;
  static const double paddingXs = 4.0;
  static const double paddingSm = 8.0;
  static const double paddingMd = 12.0;
  static const double paddingLg = 16.0;
  static const double paddingXl = 21.0;
  static const double padding2Xl = 32.0;
  static const double padding3Xl = 48.0;
  static const double padding4Xl = 64.0;

  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 16.0;

  static const double circleSm = 48.0;
  static const double circleMd = 64.0;
  static const double circleLg = 96.0;
  static const double circleXl = 128.0;

  static const double inputHeight = 42.0;

  static const defaultBoxShadow = [
    BoxShadow(
      color: Colors.black26,
      offset: Offset(1, 2),
      blurRadius: 1.0,
    )
  ];

  final bool isDark;
  AppThemeData({required this.isDark});

  ThemeData get themeData {
    ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.red,
      surface: AppColors.backgroundPaper,
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
      ),
      bottomSheetTheme: BottomSheetThemeData(
        dragHandleSize: Size(48, 4),
      ),
    );

    return themeData;
  }

}
