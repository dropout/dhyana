import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;

  final Color backgroundColor;
  final Color foregroundColor;

  const DialogButton({
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.foregroundColor = Colors.black,
    super.key,
  });

  const DialogButton.primary({
    required this.text,
    this.onPressed,
    super.key,
  }) :
     backgroundColor = Colors.red,
     foregroundColor = Colors.white;

  const DialogButton.secondary({
    required this.text,
    this.onPressed,
    super.key,
  }) :
     backgroundColor = Colors.transparent,
     foregroundColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }

}
