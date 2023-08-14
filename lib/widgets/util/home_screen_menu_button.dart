import 'package:flutter/material.dart';

class HomeScreenMenuButton extends StatelessWidget {

  final Widget child;
  final double size;

  const HomeScreenMenuButton({
    required this.child,
    this.size = 36.0,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withAlpha(90),
            blurRadius: 2.0,
            spreadRadius: 1.0,
            offset: const Offset(0.0, 0.0),
          ),
        ]
      ),
      child: child,
    );
  }
}
