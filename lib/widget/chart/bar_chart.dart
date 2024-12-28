import 'dart:collection';

import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'data/bar_chart_data.dart';

class YAxisDetail {

  final double min;
  final double primaryMarkerSizing;
  final double secondaryMarkerSizing;

  const YAxisDetail({
    required this.min,
    required this.primaryMarkerSizing,
    required this.secondaryMarkerSizing,
  });

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


class BarChart extends StatefulWidget {

  final String? title;
  final BarChartData data;
  final double? yZoom;

  const BarChart({
    required this.data,
    this.title,
    this.yZoom,
    super.key,
  });

  @override
  State<BarChart> createState() => _BarChartState();

}

class _BarChartState extends State<BarChart> {

  late double yZoom;

  late double minValue;
  late double maxValue;

  void _calculate() {
    setState(() {
      minValue = widget.data.data.map((e) => e.value).reduce((value, element) => value < element ? value : element);
      maxValue = widget.data.data.map((e) => e.value).reduce((value, element) => value > element ? value : element);

      int hours = (maxValue ~/ 60) + 1;
      yZoom = widget.yZoom ?? (60.0 * hours + 10.0);
    });
  }

  @override
  void initState() {
    _calculate();
    super.initState();
  }

  @override
  void didUpdateWidget(BarChart oldWidget) {
    _calculate();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(AppThemeData.borderRadiusLg),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppThemeData.spacingMd,
            vertical: AppThemeData.spacingXl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTitle(context),
              Gap.medium(),
              Expanded(
                child: CustomPaint(
                  painter: BarChartPainter(
                    data: widget.data,
                    maxValue: maxValue,
                    yScale: yZoom,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );

  }

  Widget buildTitle(BuildContext context) {
    if (widget.title == null || widget.title!.isEmpty) {
      return const SizedBox.shrink();
    } else {
      return Text(widget.title!,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }
  }

}

class BarChartPainter extends CustomPainter {

  final BarChartData data;
  final double maxValue;
  final double yScale;

  final barWidth = 12.0;
  final barHorizontalInset = 10.0;
  final yAxisSpace = 30.0;
  final xAxisSpace = 20.0;

  BarChartPainter({
    required this.data,
    required this.maxValue,
    required this.yScale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final valueToSizeRatio = (size.height - xAxisSpace) / yScale;

    paintYAxis(canvas, size, valueToSizeRatio);
    paintBars(canvas, size, valueToSizeRatio);
    paintXAxis(canvas, size);
  }

  void paintYAxis(Canvas canvas, Size size, double valueToSizeRatio) {
    Paint paint = Paint()
      ..color = AppColors.backgroundPaper.withAlpha(192)
      ..strokeWidth = 2.0;

    Paint paint2 = Paint()
      ..color = AppColors.backgroundPaper.withAlpha(128)
      ..strokeWidth = 1.0;

    // draw vertical lines
    canvas.drawLine(Offset(yAxisSpace, 0.0), Offset(yAxisSpace, size.height - xAxisSpace), paint);
    canvas.drawLine(Offset(size.width - yAxisSpace, 0.0), Offset(size.width - yAxisSpace, size.height - xAxisSpace), paint);

    // select the right detail configuration
    YAxisDetail detail = detailConfiguration.firstWhere((element) => element.min <= yScale, orElse: () => detailConfiguration.last);

    // draw primary markers
    final primaryMarkerCount = (yScale ~/ detail.primaryMarkerSizing) + 1;
    for (var i = 0; i < primaryMarkerCount; ++i) {
      final y = size.height - xAxisSpace - i * detail.primaryMarkerSizing * valueToSizeRatio;
      canvas.drawLine(Offset(yAxisSpace, y), Offset(size.width - yAxisSpace, y), paint);

      final textPainter = createTextPainter((i * detail.primaryMarkerSizing ~/ 60 ).toString(), TextAlign.center);
      textPainter.paint(canvas, Offset(yAxisSpace - textPainter.width - 8, y - textPainter.height / 2));
      textPainter.paint(canvas, Offset(size.width - yAxisSpace + 8, y - textPainter.height / 2));
    }

    // draw secondary markers
    final secondaryMarkerCount = (yScale ~/ detail.secondaryMarkerSizing) + 1;
    for (var i = 0; i < secondaryMarkerCount; ++i) {
      final y = size.height - xAxisSpace - i * detail.secondaryMarkerSizing * valueToSizeRatio;
      canvas.drawLine(Offset(yAxisSpace, y), Offset(size.width - yAxisSpace, y), paint2);
    }
  }

  void paintBars(Canvas canvas, Size size, double valueToSizeRatio) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1.0;

    final xPositions = getBarXPositions(size, data.data.length);
    for (var i = 0; i < xPositions.length; ++i) {
      var x = xPositions[i];
      final barHeight = data.data[i].value * valueToSizeRatio;

      final barRect = RRect.fromRectAndCorners(
        Rect.fromLTWH(x - barWidth/2, size.height - xAxisSpace - barHeight, barWidth, barHeight),
        topLeft: Radius.circular(4),
        topRight: Radius.circular(4),
      );
      canvas.drawRRect(barRect, paint);
    }
  }

  List<double> getBarXPositions(Size size, int dataLength) {
    final drawingWidth = size.width - barHorizontalInset * 2 - 2 * yAxisSpace;
    final barSpacing = drawingWidth / dataLength;
    final remainder = drawingWidth - barSpacing * (dataLength - 1);
    final xPositions = List<double>.generate(dataLength, (index) {
      return barHorizontalInset + yAxisSpace + remainder / 2 + barSpacing * index;
    });
    return xPositions;
  }

  void paintXAxis(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.backgroundPaper.withAlpha(192)
      ..strokeWidth = 2.0;

    canvas.drawLine(Offset(yAxisSpace, size.height - xAxisSpace), Offset(size.width - yAxisSpace, size.height - xAxisSpace), paint);

    final xPositions = getBarXPositions(size, data.data.length);
    for (var i = 0; i < xPositions.length; ++i) {
      var x = xPositions[i];
      var y = size.height - xAxisSpace;

      if (data.data[i].label.isNotEmpty) {
        // small vertical marker line
        canvas.drawLine(Offset(x, y), Offset(x, y + 5), paint);
        // actual label for the bar
        var textPainter = createTextPainter(data.data[i].label, TextAlign.center);
        textPainter.paint(canvas, Offset(x - textPainter.width / 2, y + 8));
      }
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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
