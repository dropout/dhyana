import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'models.dart';

class AxisPainter extends CustomPainter {

  final Color color;
  final BarChartContext barChartContext;
  final EdgeInsets barPadding;
  late final Paint linePaint;

  final int xIntervalCount;
  final double yIntervalCount;

  final YAxisLabelFormatter yAxisLabelFormatter;
  final XAxisLabelFormatter xAxisLabelFormatter;

  final bool showLabelOnAverage;
  final double displayRange;

  AxisPainter({
    required this.barPadding,
    required this.xIntervalCount,
    required this.yIntervalCount,
    required this.xAxisLabelFormatter,
    required this.yAxisLabelFormatter,
    required this.color,
    required this.displayRange,
    required this.barChartContext,
    this.showLabelOnAverage = true,
  }) {
    linePaint = Paint()
      ..color = color
      ..strokeWidth = 2.0;
  }

  @override
  void paint(Canvas canvas, Size size) {

    paintHorizontalLines(
      canvas,
      Offset(barPadding.left, barPadding.top),
      Size(
        size.width - barPadding.horizontal,
        size.height - barPadding.vertical,
      )
    );

    paintVerticalLines(
      canvas,
      Offset(barPadding.left, barPadding.top),
      Size(
        size.width - barPadding.horizontal,
        // this axis painter paints vertical lines to the bottom
        // regardless of bar chart padding
        size.height - barPadding.top,
      )
    );
  }

  void paintHorizontalLines(
    Canvas canvas,
    Offset offset,
    Size s
  ) {
    final double valueToPixelRatio = s.height / displayRange;
    final int lineCount = displayRange ~/ yIntervalCount;
    int i = 0;
    while (i <= lineCount) {
      final double y = s.height - (i * yIntervalCount) * valueToPixelRatio;
      canvas.drawLine(
        offset + Offset(0.0, y),
        offset + Offset(s.width, y),
        linePaint,
      );

      // Avoid drawing text on top of avg line if it's too close
      final textPainter = yAxisLabelFormatter(
        value: yIntervalCount * i,
        color: color,
      );

      bool labelCloseToAvg = (y - (s.height - barChartContext.avg * valueToPixelRatio)).abs() > 12;
      bool avgMakesSense = barChartContext.avg > 0.0;

      if (showLabelOnAverage || labelCloseToAvg || !avgMakesSense) {
        textPainter.paint(
          canvas,
          offset + Offset(
            s.width + 8,
            y - textPainter.height / 2
          )
        );
      }

      i++;
    }
  }

  void paintVerticalLines(
    Canvas canvas,
    Offset offset,
    Size size
  ) {

    // <= because we want to draw the last line
    // also because of this avoid trying to iterate empty list
    if (barChartContext.dataSource.isEmpty) {
      return;
    }

    int i = 0;
    while(i <= barChartContext.dataSource.length) {
      int remainder = i % xIntervalCount;
      double x = size.width / barChartContext.dataSource.length * i;

      if (remainder == 0) {
        paintDashedLine(
          canvas,
          offset + Offset(x, 0.0),
          offset + Offset(x, size.height),
          [5.0, 5.0],
          linePaint
        );
      }

      if (remainder == 0 && i < barChartContext.dataSource.length) {
        final textPainter = xAxisLabelFormatter(
          barData: barChartContext.dataSource[i],
          color: color,
        );

        double labelWidth = (size.width - barPadding.horizontal) /
            (barChartContext.dataSource.length / xIntervalCount) - linePaint.strokeWidth;
        textPainter.layout(
          minWidth: labelWidth,
          maxWidth: labelWidth,
        );

        textPainter.paint(
          canvas,
          offset + Offset(
            x + linePaint.strokeWidth,
            size.height - barPadding.bottom + 4
          ),
        );
      }

      i++;
    }
  }

  @override
  bool shouldRepaint(AxisPainter oldDelegate) =>
    oldDelegate.color != color ||
    oldDelegate.barChartContext != barChartContext ||
    oldDelegate.barPadding != barPadding ||
    oldDelegate.xIntervalCount != xIntervalCount ||
    oldDelegate.yIntervalCount != yIntervalCount ||
    oldDelegate.xAxisLabelFormatter != xAxisLabelFormatter ||
    oldDelegate.yAxisLabelFormatter != yAxisLabelFormatter ||
    oldDelegate.showLabelOnAverage != showLabelOnAverage ||
    oldDelegate.displayRange != displayRange;

  @override
  bool hitTest(Offset position) => false;

}

void paintDashedLine(
  Canvas canvas,
  Offset p1,
  Offset p2,
  Iterable<double> pattern,
  Paint paint,
) {
  assert(pattern.length.isEven);
  final distance = (p2 - p1).distance;
  final normalizedPattern = pattern.map((width) => width / distance).toList();
  final points = <Offset>[];
  double t = 0;
  int i = 0;
  while (t < 1) {
    points.add(Offset.lerp(p1, p2, t)!);
    t += normalizedPattern[i++];  // dashWidth
    points.add(Offset.lerp(p1, p2, t.clamp(0, 1))!);
    t += normalizedPattern[i++];  // dashSpace
    i %= normalizedPattern.length; // cap to pattern length
  }
  canvas.drawPoints(
    ui.PointMode.lines,
    points,
    paint
  );
}

TextPainter createTextPainter(
  String text,
  TextAlign textAlign, {
    double size = 12,
    Color color = Colors.red,
    double? width,
  }
) {
  TextStyle textStyle = TextStyle(
    color: color,
    fontSize: size,
    fontWeight: FontWeight.bold,
  );
  final textSpan = TextSpan(
    text: text,
    style: textStyle,
  );
  final textPainter = TextPainter(
    text: textSpan,
    textAlign: textAlign,
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(
    minWidth: width ?? 0,
    maxWidth: width ?? double.infinity,
  );

  return textPainter;
}

class AverageOverlayPainter extends CustomPainter {

  final double average;
  final String averageLabel;
  final Color color;
  final double lineProgress;
  final double textOpacity;
  final double displayRange;

  late final Paint linePaint;

  AverageOverlayPainter({
    required this.average,
    required this.averageLabel,
    required this.color,
    required this.displayRange,
    this.lineProgress = 0.0,
    this.textOpacity = 0.0,
  }) {
    linePaint = Paint()
      ..strokeWidth = 2.0
      ..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double valueToPixelRatio = size.height / displayRange;
    double hp = average * valueToPixelRatio;

    canvas.drawLine(
      Offset(0, size.height - hp),
      Offset(size.width * lineProgress, size.height - hp),
      linePaint,
    );

    final textPainter = createTextPainter(
      averageLabel,
      TextAlign.center,
      size: 13,
      color: color.withValues(alpha: textOpacity),
    );

    textPainter.paint(
      canvas,
      Offset(size.width + 8, size.height - hp - textPainter.height / 2),
    );

  }

  @override
  bool shouldRepaint(covariant AverageOverlayPainter oldDelegate) =>
    oldDelegate.color != color ||
    oldDelegate.average != average ||
    oldDelegate.lineProgress != lineProgress ||
    oldDelegate.textOpacity != textOpacity ||
    oldDelegate.displayRange != displayRange;

}
