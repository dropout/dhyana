import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {

  final Color color;

  const AppCircularProgressIndicator({
    this.color = Colors.black,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
