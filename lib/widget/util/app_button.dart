import 'package:flutter/material.dart';
import 'package:dhyana/widget/app_theme_data.dart';

class AppButton extends StatelessWidget {

  final String text;
  final Color? fColor;
  final Color? bColor;
  final void Function()? onTap;
  final EdgeInsets padding;
  
  const AppButton({
    required this.text,
    this.fColor = Colors.white,
    this.bColor = Colors.black,
    this.padding = const EdgeInsets.symmetric(
      vertical: AppThemeData.paddingMd,
      horizontal: AppThemeData.paddingXl,
    ),
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: padding,
      onPressed: () => onTap?.call(),
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      shape: const StadiumBorder(),
      fillColor: bColor,
      splashColor: Colors.red,
      clipBehavior: Clip.none,
      child: Text(text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: fColor,
          fontWeight: FontWeight.w900,
        )
      ),
    );
  }
}
