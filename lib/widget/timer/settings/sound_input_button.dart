import 'package:dhyana/widget/app_colors.dart';
import 'package:flutter/material.dart';

class SoundInputButton extends StatelessWidget {

  final void Function() onTap;
  final EdgeInsets padding;
  final Widget? child;

  const SoundInputButton({
    required this.onTap,
    this.padding = EdgeInsets.zero,
    this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: padding,
      onPressed: onTap,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      constraints: const BoxConstraints(), // removes unnecessary padding
      shape: const StadiumBorder(),
      fillColor: Colors.black, //background color
      splashColor: AppColors.splashColor,
      clipBehavior: Clip.none,
      child: child,
    );
  }
}
