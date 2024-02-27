import 'package:flutter/material.dart';

class CustomDurationCircleBorder extends CircleBorder {

  @override
  void paintInterior(Canvas canvas, Rect rect, Paint paint, { TextDirection? textDirection }) {
    canvas.drawCircle(rect.center, rect.longestSide / 2.0, paint);
  }

  @override
  void paint(Canvas canvas, Rect rect, { TextDirection? textDirection }) {
    canvas.drawCircle(rect.center, (rect.longestSide + side.strokeOffset) / 2, side.toPaint());
  }

}
