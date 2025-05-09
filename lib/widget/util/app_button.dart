import 'package:flutter/material.dart';
import 'package:dhyana/widget/app_theme_data.dart';

enum AppButtonSize {
  small,
  medium,
  large,
}

class AppButton extends StatelessWidget {

  final String text;
  final Color? fColor;
  final Color? bColor;
  final void Function()? onTap;
  final AppButtonSize buttonSize;
  
  const AppButton({
    required this.text,
    this.fColor = Colors.white,
    this.bColor = Colors.black,
    this.buttonSize = AppButtonSize.medium,
    this.onTap,
    super.key
  });

  factory AppButton.small({
    required String text,
    Color? fColor,
    Color? bColor,
    void Function()? onTap,
  }) {
    return AppButton(
      text: text,
      fColor: fColor,
      bColor: bColor,
      onTap: onTap,
      buttonSize: AppButtonSize.small,
    );
  }

  @override
  Widget build(BuildContext context) {
    final (textStyle, padding) = _getButtonParams(context, buttonSize);
    return RawMaterialButton(
      padding: padding,
      onPressed: () => onTap?.call(),
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      shape: const StadiumBorder(),
      fillColor: bColor,
      // splashColor: Colors.red,
      clipBehavior: Clip.none,
      child: Text(text,
          style: textStyle,
      ),
    );
  }

  (TextStyle textStyle, EdgeInsets padding) _getButtonParams(
      BuildContext context, AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return (
          Theme.of(context).textTheme.labelMedium!.copyWith(
            color: fColor,
            fontWeight: FontWeight.w900,
          ),
          const EdgeInsets.symmetric(
            vertical: AppThemeData.paddingSm,
            horizontal: AppThemeData.paddingMd,
          ),
        );
      case AppButtonSize.medium:
        return (
          Theme.of(context).textTheme.titleMedium!.copyWith(
            color: fColor,
            fontWeight: FontWeight.w900,
          ),
          const EdgeInsets.symmetric(
            vertical: AppThemeData.paddingMd,
            horizontal: AppThemeData.paddingLg,
          ),
        );
      case AppButtonSize.large:
        return (
          Theme.of(context).textTheme.titleLarge!.copyWith(
            color: fColor,
            fontWeight: FontWeight.w900,
          ),
          const EdgeInsets.symmetric(
            vertical: AppThemeData.paddingLg,
            horizontal: AppThemeData.paddingXl,
          ),
        );
    }
  }





}
