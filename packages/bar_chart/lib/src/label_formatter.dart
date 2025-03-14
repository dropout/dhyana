import 'package:bar_chart/bar_chart.dart';
import 'package:flutter/material.dart';

abstract class LabelFormatter {

  const LabelFormatter();

  TextPainter createTextPainter(BarData barData, double labelWidth);

}

class DefaultLabelFormatter extends LabelFormatter {

  final TextStyle textStyle;
  final TextAlign textAlign;

  const DefaultLabelFormatter({
    required this.textStyle,
    this.textAlign = TextAlign.left,
  });

  @override
  TextPainter createTextPainter(BarData barData, double labelWidth) {

    final textSpan = TextSpan(
      text: barData.label,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: textAlign,
      textDirection: TextDirection.ltr,
    );

    return textPainter;

  }

}
