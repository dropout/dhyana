import 'dart:collection';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'models.dart';

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

class RenderBarChartBar extends RenderBox {

  final Paint _paint;

  int _index;
  double _barPadding;
  BarData _barChartData;
  BarChartContext _barChartContext;

  RenderBarChartBar({
    required int index,
    required BarChartContext barChartContext,
    required BarData barChartData,
    Color color = Colors.white,
    double barPadding = 0.0,
  }) :
    _index = index,
    _barChartData = barChartData,
    _barChartContext = barChartContext,
    _barPadding = barPadding,
    _paint = Paint()..color = color;

  BarData get barChartData => _barChartData;
  double get value => _barChartData.value;
  int get index => _index;

  set barChartData(BarData barChartData) {
    _barChartData = barChartData;
    markNeedsLayout();
  }

  set barChartContext(BarChartContext barChartContext) {
    _barChartContext = barChartContext;
    markNeedsLayout();
  }

  set color(Color color) {
    _paint.color = color;
    markNeedsLayout();
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
    final double value = _barChartData.value;
    final valueToPixelRatio = size.height / _barChartContext.displayRange;

    final renderOffset = offset.translate(
      _barPadding,
      math.max(size.height - (value * valueToPixelRatio).abs(), 0)
    );

    final Size renderSize = Size(
      size.width - _barPadding * 2,
      math.min(value * valueToPixelRatio, size.height)
    );

    context.canvas.drawRect(renderOffset & renderSize, _paint);
  }

  @override
  bool hitTestSelf(Offset position) => size.contains(position);

}

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
          barChartContext.dataSource.barChartData[i].label,
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


