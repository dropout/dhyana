import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:flutter/material.dart';


class InputButton extends StatelessWidget {

  final void Function() onTap;
  final EdgeInsets padding;
  final Widget? child;
  final ShapeBorder shape;

  const InputButton({
    required this.onTap,
    this.shape = const StadiumBorder(),
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
      shape: shape,
      fillColor: Colors.black, // background color
      splashColor: AppColors.splashColor,
      clipBehavior: Clip.none,
      child: child,
    );
  }
}
