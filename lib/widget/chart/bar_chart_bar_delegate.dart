import 'package:flutter/material.dart';

abstract class BarChartBarDelegate {

  const BarChartBarDelegate();

  Widget build(BuildContext context, double sizeFactor);

}

class DefaultBarChartBarDelegate extends BarChartBarDelegate {

  const DefaultBarChartBarDelegate();

  @override
  Widget build(BuildContext context, double sizeFactor) {

    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          widthFactor: 0.25,
          heightFactor: 1.0,
          child: DecoratedBox(
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: Colors.white.withOpacity(0.25),
            ),
          ),
        ),
        FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          widthFactor: 0.25,
          heightFactor: sizeFactor,
          child: const DecoratedBox(
            decoration: ShapeDecoration(
              shape: StadiumBorder(),
              color: Colors.deepOrange,
            ),
          ),
        )
      ],
    );
  }

}
