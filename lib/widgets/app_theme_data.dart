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
  static const double spacing4xl = 96.0;

  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 16.0;

  final bool isDark;
  //
  AppThemeData({required this.isDark});
  //
  ThemeData get themeData {
  //
  //   // TextTheme ---------------------------------------------------------------
  //   TextTheme txtTheme = (isDark ? ThemeData.dark() : ThemeData.light()).textTheme.copyWith(

  //
  //
  //     bodySmall: const TextStyle(
  //       fontFamily: 'SourceSansPro',
  //       fontSize: 14.0,
  //       color: Colors.white,
  //       height: 1.25,
  //     ),
  //     bodyMedium: const TextStyle(
  //       fontFamily: 'SourceSansPro',
  //       fontSize: 16.0,
  //       color: Colors.white,
  //       height: 1.25,
  //     ),
  //     bodyLarge: const TextStyle(
  //       fontFamily: 'SourceSansPro',
  //       fontSize: 18.0,
  //       color: Colors.white,
  //       height: 1.25,
  //     )
  //   );
  //
  //   // Color? textColor = txtTheme.bodyMedium!.color;
  //   Color? textColor = AppColors.textColor;
  //
  //   // ColorScheme -------------------------------------------------------------
    ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.red,
      background: AppColors.backgroundPaper,
      // onBackground: Colors.black,
      // brightness: isDark ? Brightness.dark : Brightness.light,
      //
      // primary: AppColors.primary,
      // onPrimary: AppColors.onPrimary,
      //
      // secondary: AppColors.secondary,
      // onSecondary: AppColors.onSecondary,
      //
      // background: AppColors.background,
      // onBackground: textColor,
      //
      // surface: AppColors.onPrimaryContainer,
      // onSurface: textColor,
      //
      // error: Colors.red.shade400,
      // onError: Colors.white,
    );
  //
  //   // ThemeData ---------------------------------------------------------------
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

  //     );.copyWith(
  //     // ThemeData themeData = ThemeData.from(
  //     //   // textTheme: txtTheme,
  //     //   colorScheme: colorScheme,
  //     //   useMaterial3: true,
  //     // ).copyWith(
  // //
  // //     textTheme: txtTheme,
  // //
  // //     primaryTextTheme: ThemeData.dark().textTheme.apply(
  // //       fontFamily: 'SourceSansPro',
  // //     ),
  // //
  //     appBarTheme: const AppBarTheme(
  //       backgroundColor: AppColors.backgroundPaper,
  //       // elevation: 0,
  //       // surfaceTintColor: AppColors.backgroundPaper,
  //     ),
  // //
  // //     textButtonTheme: TextButtonThemeData(
  // //       style: TextButton.styleFrom(
  // //         foregroundColor: Colors.black,
  // //         backgroundColor: Colors.white,
  // //         disabledForegroundColor: Colors.grey.shade500,
  // //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
  // //         textStyle: const TextStyle(
  // //           fontFamily: 'SourceSansPro',
  // //           fontSize: 21.0,
  // //           fontWeight: FontWeight.w600
  // //         )
  // //       ),
  // //     ),
  // //
  // //     outlinedButtonTheme: OutlinedButtonThemeData(
  // //       style: TextButton.styleFrom(
  // //         side: const BorderSide(width: 2.0, color: Colors.white),
  // //         foregroundColor: Colors.white,
  // //         backgroundColor: AppColors.background,
  // //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
  // //         textStyle: const TextStyle(
  // //           fontFamily: 'SourceSansPro',
  // //           fontSize: 21.0,
  // //           fontWeight: FontWeight.w600
  // //         )
  // //       ),
  // //     ),
  // //
  // //     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  // //       showSelectedLabels: true,
  // //       showUnselectedLabels: true,
  // //       backgroundColor: Colors.white,
  // //       unselectedItemColor: Colors.grey,
  // //       selectedItemColor: Colors.black,
  // //     ),
  // //
  //   );
  // //
    return themeData;
  }

}

