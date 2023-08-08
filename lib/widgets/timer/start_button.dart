import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {

  final void Function()? onTap;

  const StartButton({
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        width: 96,
        height: 96,
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: Colors.black,
        ),
        child: const Center(
          child: Icon(
            Icons.play_arrow_rounded,
            color: Colors.white,
            size: 64,
          ),
        ),
      ),
    );
  }

}
