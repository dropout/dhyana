import 'package:flutter/material.dart';

import 'app_circular_icon.dart';

class AppCircularIconButton extends StatelessWidget {

  final void Function() onPressed;
  final double size;
  final double padding;
  final double iconSize;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final Color highlightColor;

  const AppCircularIconButton({
    required this.icon,
    required this.onPressed,
    required this.size,
    this.padding = 0,
    this.color = Colors.black,
    this.backgroundColor = Colors.white,
    this.highlightColor = Colors.red,
    this.iconSize = -20,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: AppCircularIcon(
        icon: icon,
        size: size,
        padding: padding,
        backgroundColor: backgroundColor,
        iconColor: color,
      ),
    );

  }

}
