import 'dart:collection';
import 'dart:math' as math;
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
      Offset.zero,
      Size(
        size.width - barChartContext.padding.horizontal,
        size.height - barChartContext.padding.vertical,
      )
    );

    paintVerticalLines(
      canvas,
      Offset.zero,
      Size(
        size.width - barChartContext.padding.horizontal,
        size.height
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
        Offset(0.0, y),
        Offset(s.width, y),
        Paint()
          ..color = color
          ..strokeWidth = 1.0,
      );

      final textPainter = createTextPainter(
        barChartContext.yAxisLabelFormatter(barChartContext.yAxisInterval * i),
        TextAlign.right,
        color: color,
      );

      textPainter.paint(
        canvas,
        Offset(
          s.width + 4,
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
    int i = 0;
    while(i <= barChartContext.dataSource.length) {
      int remainder = i % barChartContext.xAxisInterval;
      double x = size.width / barChartContext.dataSource.length * i;

      if (remainder == 0) {
        paintDashedLine(
          canvas,
          Offset(x, 0.0),
          Offset(x, size.height),
          [5.0, 5.0],
          Paint()
            ..color = color
            ..strokeWidth = 1.0,
        );

      }

      if (remainder == 0 && i < barChartContext.dataSource.length) {
        final textPainter = createTextPainter(
          barChartContext.dataSource[i].label,
          TextAlign.left,
          color: color,
        );

        textPainter.paint(
          canvas,
          Offset(
            x + textPainter.width / 2,
            size.height - barChartContext.padding.horizontal + 4
          )
        );
      }

      i++;
    }
  }

  @override
  bool shouldRepaint(AxisPainter oldPainter) {
    return true;
    // return oldPainter.color != color
    //     || oldPainter.horizontalDivisions != hashCode
    //     || oldPainter.verticalDivisions != verticalDivisions;
  }

  @override
  bool hitTest(Offset position) => false;

}

class RenderBarChartBar extends RenderBox {

  final Paint _paint;

  int _barIndex;
  double _heightFactor;
  double _barPadding;

  RenderBarChartBar({
    required int barIndex,
    required double heightFactor,
    Color color = Colors.white,
    double barPadding = 1.0,
  }) :
    _barIndex = barIndex,
    _heightFactor = heightFactor,
    _barPadding = barPadding,
    _paint = Paint()..color = color;

  int get barIndex => _barIndex;
  double get heightFactor => _heightFactor;

  set barIndex(int barIndex) {
    _barIndex = barIndex;
    markNeedsLayout();
  }

  set heightFactor(double heightFactor) {
    _heightFactor = heightFactor;
    markNeedsLayout();
  }

  set color(Color color) {
    _paint.color = color;
    markNeedsPaint();
  }

  set width(double width) {
    _barPadding = width;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    size = constraints.constrain(Size(double.infinity, double.infinity));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Size renderSize = Size(
      size.width - _barPadding * 2,
      size.height * _heightFactor
    );
    final renderOffset = Offset(
      offset.dx + _barPadding,
      offset.dy + size.height - renderSize.height
    );
    context.canvas.drawRect(renderOffset & renderSize, _paint);
  }

  @override
  bool hitTestSelf(Offset position) => size.contains(position);

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
  TextAlign textAlign,
  { Color color = Colors.red, }
) {
  TextStyle textStyle = TextStyle(
    color: color,
    fontSize: 12,
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
    minWidth: 0,
  );

  return textPainter;
}

