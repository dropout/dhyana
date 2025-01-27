import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'models.dart';

class YAxisDetail {

  final double min;
  final double primaryMarkerSizing;
  final double secondaryMarkerSizing;

  const YAxisDetail({
    required this.min,
    required this.primaryMarkerSizing,
    required this.secondaryMarkerSizing,
  });

  String toString() {
    return 'YAxisDetail(min: $min, primaryMarkerSizing: $primaryMarkerSizing, secondaryMarkerSizing: $secondaryMarkerSizing)';
  }

}

final Queue<YAxisDetail> detailConfiguration = Queue.from(const [
  YAxisDetail(min: 4096 * 60.0, primaryMarkerSizing: 2048 * 60.0, secondaryMarkerSizing: 1024 * 60.0),
  YAxisDetail(min: 2048 * 60.0, primaryMarkerSizing: 1024 * 60.0, secondaryMarkerSizing: 512 * 60.0),
  YAxisDetail(min: 1024 * 60.0, primaryMarkerSizing: 512 * 60.0, secondaryMarkerSizing: 256 * 60.0),
  YAxisDetail(min: 512 * 60.0, primaryMarkerSizing: 256 * 60.0, secondaryMarkerSizing: 128 * 60.0),
  YAxisDetail(min: 256 * 60.0, primaryMarkerSizing: 128 * 60.0, secondaryMarkerSizing: 64 * 60.0),
  YAxisDetail(min: 128 * 60.0, primaryMarkerSizing: 64 * 60.0, secondaryMarkerSizing: 32 * 60.0),
  YAxisDetail(min: 64 * 60.0, primaryMarkerSizing: 32 * 60.0, secondaryMarkerSizing: 16 * 60.0),
  YAxisDetail(min: 32 * 60.0, primaryMarkerSizing: 16 * 60.0, secondaryMarkerSizing: 8 * 60.0),
  YAxisDetail(min: 16 * 60.0, primaryMarkerSizing: 8 * 60.0, secondaryMarkerSizing: 4 * 60.0),
  YAxisDetail(min: 8 * 60.0, primaryMarkerSizing: 4 * 60.0, secondaryMarkerSizing: 2 * 60.0),
  YAxisDetail(min: 4 * 60.0, primaryMarkerSizing: 2 * 60.0, secondaryMarkerSizing: 60.0),
  YAxisDetail(min: 2 * 60.0, primaryMarkerSizing: 60.0, secondaryMarkerSizing: 30.0),
  YAxisDetail(min: 0 * 60.0, primaryMarkerSizing: 60.0, secondaryMarkerSizing: 15.0),
]);

class YAxisPainter extends CustomPainter {

  final BarChartContext barChartContext;
  final Color color = Colors.white;

  const YAxisPainter({
    required this.barChartContext,
  });

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2.0;

    Paint paint2 = Paint()
      ..color = color
      ..strokeWidth = 2.0;

    // draw vertical lines
    canvas.drawLine(Offset(size.width, 0.0), Offset(size.width, size.height), paint);

    final valueToSizeRatio = (size.height) / barChartContext.yAxisMaxValue;

    // select the right detail configuration
    YAxisDetail detail = detailConfiguration.firstWhere((element) => element.min <= barChartContext.yAxisMaxValue, orElse: () => detailConfiguration.last);

    // // draw primary markers
    final primaryMarkerCount = (barChartContext.yAxisMaxValue ~/ detail.primaryMarkerSizing) + 1;
    for (var i = 0; i < primaryMarkerCount; ++i) {
      final y = size.height - i * detail.primaryMarkerSizing * valueToSizeRatio;
      canvas.drawLine(Offset(size.width, y), Offset(size.width-5, y), paint);

      final textPainter = createTextPainter((i * detail.primaryMarkerSizing ~/ 60 ).toString(), TextAlign.center);
      textPainter.paint(canvas, Offset(size.width - textPainter.width - 8, y - textPainter.height / 2));
    }



    // draw secondary markers
    final secondaryMarkerCount = (barChartContext.yAxisMaxValue ~/ detail.secondaryMarkerSizing) + 1;
    for (var i = 0; i < secondaryMarkerCount; ++i) {
      final y = size.height - i * detail.secondaryMarkerSizing * valueToSizeRatio;
      canvas.drawLine(Offset(size.width, y), Offset(size.width - 5, y), paint2);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class XAxisPainter extends CustomPainter {

  final BarChartContext barChartContext;
  final Color color = Colors.white;

  XAxisPainter({
    required this.barChartContext,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2.0;

    canvas.drawLine(Offset(0,0), Offset(size.width, 0), paint);

    final data = barChartContext.barChartDataSource.barChartData;
    final xPositions = getBarXPositions(size, barChartContext.barChartDataSource.length);
    for (var i = 0; i < xPositions.length; ++i) {
      var x = xPositions[i];
      double y = 0;

      if (data[i].label.isNotEmpty) {
        // small vertical marker line
        canvas.drawLine(Offset(x, y), Offset(x, y + 5), paint);
        // actual label for the bar
        var textPainter = createTextPainter(data[i].label, TextAlign.center);
        textPainter.paint(canvas, Offset(x - textPainter.width / 2, y + 8));
      }
    }
  }

  List<double> getBarXPositions(Size size, int dataLength) {
    final drawingWidth = size.width;
    final barSpacing = drawingWidth / dataLength;
    final remainder = drawingWidth - barSpacing * (dataLength - 1);
    final xPositions = List<double>.generate(dataLength, (index) {
      return remainder / 2 + barSpacing * index;
    });
    return xPositions;
  }



  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

TextPainter createTextPainter(String text, TextAlign textAlign) {
  const textStyle = TextStyle(
    color: Colors.white,
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
    maxWidth: 30.0,
  );

  return textPainter;
}

class RenderBarChartBar extends RenderBox {

  final Paint _paint;

  int _index;
  double _width;
  BarData _barChartData;
  BarChartContext _barChartContext;

  RenderBarChartBar({
    required int index,
    required BarChartContext barChartContext,
    required BarData barChartData,
    Color color = Colors.white,
    double width = double.infinity,
  }) :
    _index = index,
    _barChartData = barChartData,
    _barChartContext = barChartContext,
    _width = width,
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
    _width = width;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    size = constraints.constrain(Size(double.infinity, double.infinity));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final double value = _barChartData.value;
    final valueToPixelRatio = size.height / _barChartContext.yAxisMaxValue;

    final renderOffset = offset.translate(
      0,
      math.max(size.height - (value * valueToPixelRatio).abs(), 0)
    );

    final Size renderSize = Size(
      size.width,
      math.min(value * valueToPixelRatio, size.height)
    );

    context.canvas.drawRect(renderOffset & renderSize, _paint);
  }

  @override
  bool hitTestSelf(Offset position) => size.contains(position);

}
