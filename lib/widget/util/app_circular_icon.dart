import 'package:flutter/material.dart';

class AppCircularIcon extends StatelessWidget {

  final IconData icon;
  final double size;
  final double padding;
  final Color iconColor;
  final Color backgroundColor;

  const AppCircularIcon({
    required this.icon,
    required this.size,
    this.padding = 0.0,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: Icon(
          icon,
          size: size-padding*2,
          color: iconColor,
        ),
      )
    );
  }
}
