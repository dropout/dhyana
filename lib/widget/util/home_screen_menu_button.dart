import 'package:flutter/material.dart';

class HomeScreenMenuButton extends StatelessWidget {

  final Widget child;
  final double size;
  final void Function()? onTap;

  const HomeScreenMenuButton({
    required this.child,
    this.onTap,
    this.size = 36.0,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        width: size,
        height: size,
        // padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: child,
      ),
    );
  }
}
