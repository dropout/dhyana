import 'package:flutter/material.dart';
import 'package:dhyana/widget/app_theme_data.dart';

class AppButton extends StatelessWidget {

  final String text;
  final Color? fColor;
  final Color? bColor;
  final void Function()? onTap;
  
  const AppButton({
    required this.text,
    this.fColor = Colors.white,
    this.bColor = Colors.black,
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.symmetric(
        vertical: AppThemeData.paddingMd,
        horizontal: AppThemeData.paddingXl,
      ),
      onPressed: () => onTap?.call(),
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      constraints: const BoxConstraints(), // removes unnecessary padding
      shape: const StadiumBorder(),
      fillColor: Colors.black, //background color
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
