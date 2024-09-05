import 'package:flutter/material.dart';

class CircularInputInkwell extends StatelessWidget {

  final void Function() onTap;
  final EdgeInsets padding;
  final Widget? child;

  const CircularInputInkwell({
    this.child,
    required this.onTap,
    this.padding = EdgeInsets.zero,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      splashColor: Colors.white10,
      child: Ink(
        padding: padding,
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: Colors.black,
        ),
        child: child,
      ),
    );
  }
}
