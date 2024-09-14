import 'package:dhyana/widget/app_colors.dart';
import 'package:flutter/material.dart';

class DurationInputButton extends StatelessWidget {

  final Widget child;
  final void Function() onTap;
  final EdgeInsets padding;

  const DurationInputButton({
    required this.child,
    required this.onTap,
    // this.padding = const EdgeInsets.all(AppThemeData.paddingMd),
    this.padding = EdgeInsets.zero,
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
      shape: const CircleBorder(side: BorderSide.none),
      fillColor: Colors.black,
      splashColor: AppColors.bloodRed,
      clipBehavior: Clip.none,
      child: child,
    );
  }

}
