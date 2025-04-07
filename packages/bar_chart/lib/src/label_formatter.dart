import 'package:bar_chart/bar_chart.dart';
import 'package:flutter/material.dart';


class YAxisLabelFormatter {

  final Color color;

  const YAxisLabelFormatter({
    this.color = Colors.white,
  });

  TextPainter format(double value) {
    return createTextPainter(
      value.toStringAsFixed(0),
      TextAlign.left,
      color: color,
    );
  }

}

class XAxisLabelFormatter {

  final Color color;

  const XAxisLabelFormatter({
    this.color = Colors.white,
  });

  TextPainter format(BarData barData) {
    final textSpan = TextSpan(
      text: barData.label.substring(0, 1),
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );

    return TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
  }

}
