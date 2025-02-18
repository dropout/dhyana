import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'models.dart';

class AxisPainter extends CustomPainter {

  final Color color;
  final BarChartContext barChartContext;
  late final Paint linePaint;

  AxisPainter({
    required this.color,
    required this.barChartContext,
  }) {
    linePaint = Paint()
      ..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {

    paintHorizontalLines(
      canvas,
      Offset(barChartContext.padding.left, barChartContext.padding.top),
      Size(
        size.width - barChartContext.padding.horizontal,
        size.height - barChartContext.padding.vertical,
      )
    );

    paintVerticalLines(
      canvas,
      Offset(barChartContext.padding.left, barChartContext.padding.top),
      Size(
        size.width - barChartContext.padding.horizontal,
        // this axis painter paints vertical lines to the bottom
        // regardless of bar chart padding
        size.height - barChartContext.padding.top,
      )
    );
  }

  void paintHorizontalLines(
    Canvas canvas,
    Offset offset,
    Size s
  ) {
    final double valueToPixelRatio = s.height / barChartContext.displayRange;
    final int lineCount = barChartContext.displayRange ~/ barChartContext.yAxisInterval;
    int i = 0;
    while (i <= lineCount) {
      final double y = s.height - (i * barChartContext.yAxisInterval) * valueToPixelRatio;
      canvas.drawLine(
        offset + Offset(0.0, y),
        offset + Offset(s.width, y),
        Paint()
          ..color = color
          ..strokeWidth = 1.0,
      );

      final textPainter = createTextPainter(
        barChartContext.yAxisLabelFormatter(barChartContext.yAxisInterval * i),
        TextAlign.center,
        color: color,
      );

      textPainter.paint(
        canvas,
        offset + Offset(
          s.width + 8,
          y - textPainter.height / 2
        )
      );

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
      int remainder = i % barChartContext.xAxisInterval;
      double x = size.width / barChartContext.dataSource.length * i;

      if (remainder == 0) {
        paintDashedLine(
          canvas,
          offset + Offset(x, 0.0),
          offset + Offset(x, size.height),
          [5.0, 5.0],
          Paint()
            ..color = color
            ..strokeWidth = 1.0,
        );

      }

      if (remainder == 0 && i < barChartContext.dataSource.length) {
        final textPainter = createTextPainter(
          barChartContext.dataSource[i].label,
          TextAlign.center,
          color: color,
          width: size.width / barChartContext.dataSource.length,
        );

        textPainter.paint(
          canvas,
          offset + Offset(x, size.height - barChartContext.padding.bottom + 4),
        );
      }

      i++;
    }
  }

  @override
  bool shouldRepaint(AxisPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.barChartContext != barChartContext;

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

  final Color color;
  final BarChartContext barChartContext;
  late final Paint linePaint;


  AverageOverlayPainter({
    required this.color,
    required this.barChartContext,
  }) {
    linePaint = Paint()
      ..strokeWidth = 2.0
      ..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double valueToPixelRatio = barChartContext.valueToPixelRatio(size);
    double hp = barChartContext.avg * valueToPixelRatio;
    paintDashedLine(
      canvas,
      Offset(0, size.height - hp),
      Offset(size.width, size.height - hp),
      [10,5],
      linePaint
    );

    final textPainter = createTextPainter(
      'avg',
      TextAlign.center,
      size: 13,
      color: color,
    );

    textPainter.paint(
      canvas,
      Offset(size.width + 4, size.height - hp - textPainter.height / 2),
    );

  }

  @override
  bool shouldRepaint(covariant AverageOverlayPainter oldDelegate) =>
    oldDelegate.color != color ||
    oldDelegate.barChartContext != barChartContext;

}
