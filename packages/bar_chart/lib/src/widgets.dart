import 'dart:math' as math;

import 'package:bar_chart/src/label_formatter.dart';
import 'package:flutter/material.dart';

import 'models.dart';
import 'painting.dart';

class BarChart extends StatefulWidget {

  final List<BarData> dataSource;

  final AxisBuilder? axisBuilder;
  final BarHeaderBuilder? barHeaderBuilder;
  final BarBuilder barBuilder;
  final OverlayBuilder? overlayBuilder;


  final double Function(double max) displayRangeSetter;

  const BarChart({
    required this.dataSource,
    this.axisBuilder = _defaultAxisBuilder,
    this.barBuilder = _defaultBarBuilder,
    this.barHeaderBuilder = _defaultBarHeaderBuilder,
    this.overlayBuilder,
    this.displayRangeSetter = _defaultDisplayRangeSetter,
    super.key,
  });

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {

  late BarChartContext barChartContext;

  @override
  void initState() {
    barChartContext = BarChartContext(
      dataSource: widget.dataSource,
      displayRangeSetter: widget.displayRangeSetter,
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BarChart oldWidget) {
    setState(() {
      barChartContext = BarChartContext(
        dataSource: widget.dataSource,
        displayRangeSetter: widget.displayRangeSetter,
      );
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildHeaderArea(context),
        buildBarArea(context),
      ],
    );
  }

  Widget buildHeaderArea(BuildContext context) {
    return
      widget.barHeaderBuilder == null
        ? const SizedBox.shrink()
        : widget.barHeaderBuilder!(context, barChartContext);
  }

  Widget buildBarArea(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (widget.axisBuilder != null) widget.axisBuilder!(context, barChartContext),
        widget.barBuilder(context, barChartContext),
        if (widget.overlayBuilder != null) widget.overlayBuilder!(context, barChartContext),
      ],
    );
  }

}

class SelectableBars extends StatefulWidget {

  final BarChartContext barChartContext;
  final Function(int index, BarData barData)? onBarSelected;

  const SelectableBars({
    required this.barChartContext,
    this.onBarSelected,
    super.key,
  });

  @override
  State<SelectableBars> createState() => _SelectableBarsState();

}

class _SelectableBarsState extends State<SelectableBars> {

  int selectedBarIndex = -1;

  @override
  Widget build(BuildContext context) {
    final barChartData = widget.barChartContext.dataSource;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < barChartData.length; i++)
          Expanded(
            child: FractionallySizedBox(
              heightFactor: math.min(
                barChartData[i].value / widget.barChartContext.displayRange,
                1.0,
              ),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    selectedBarIndex = i;
                    widget.onBarSelected?.call(i, barChartData[i]);
                  });
                },
                child: AnimatedContainer(
                  duration: Durations.short4,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  color: i == selectedBarIndex ? Colors.red : Colors.white,
                ),
              )
            ),
          ),
      ],
    );
  }

}




double _defaultDisplayRangeSetter(double max) => max;

Widget _defaultBarBuilder(
  BuildContext context,
  BarChartContext barChartContext,
) {
  final barChartData = barChartContext.dataSource;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      for (var i = 0; i < barChartData.length; i++)
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1),
            child: FractionallySizedBox(
              heightFactor: math.min(
                barChartData[i].value / barChartContext.displayRange,
                1.0,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            )
          )
        )
    ],
  );
}

Widget _defaultBarHeaderBuilder(
  BuildContext context,
  BarChartContext barChartContext,
) {
  return SizedBox.shrink();
}

Widget _defaultAxisBuilder(
  BuildContext context,
  BarChartContext barChartContext,
) {
  return SizedBox.shrink();
  // return CustomPaint(
  //   painter: AxisPainter(
  //     color: Colors.grey.shade600,
  //     barChartContext: barChartContext,
  //   ),
  // );
}

double _defaultYAxisIntervalSetter(double displayRange) => (displayRange / 4);
int _defaultXAxisIntervalSetter(int barCount) => 1;

class DefaultBarChartAxis extends StatefulWidget {

  final Color color;
  final BarChartContext barChartContext;
  final EdgeInsets barPadding;

  final double Function(double displayRange) yAxisIntervalSetter;
  final int Function(int barCount) xAxisIntervalSetter;

  final YAxisLabelFormatter yAxisLabelFormatter;
  final XAxisLabelFormatter xAxisLabelFormatter;

  final bool showLabelOnAverage;

  const DefaultBarChartAxis({
    required this.barChartContext,
    required this.color,
    required this.barPadding,
    this.yAxisIntervalSetter = _defaultYAxisIntervalSetter,
    this.xAxisIntervalSetter = _defaultXAxisIntervalSetter,
    this.yAxisLabelFormatter = const YAxisLabelFormatter(),
    this.xAxisLabelFormatter = const XAxisLabelFormatter(),
    this.showLabelOnAverage = true,
    super.key,
  });

  @override
  State<DefaultBarChartAxis> createState() => _DefaultBarChartAxisState();
}

class _DefaultBarChartAxisState extends State<DefaultBarChartAxis>
  with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AxisPainter(
        xIntervalCount: widget.xAxisIntervalSetter(widget.barChartContext.dataSource.length),
        yIntervalCount: widget.yAxisIntervalSetter(widget.barChartContext.displayRange),
        xAxisLabelFormatter: widget.xAxisLabelFormatter,
        yAxisLabelFormatter: widget.yAxisLabelFormatter,
        color: widget.color,
        displayRange: widget.barChartContext.displayRange,
        barChartContext: widget.barChartContext,
        barPadding: widget.barPadding,
        showLabelOnAverage: widget.showLabelOnAverage,
      ),
    );
  }

}

class AverageBarChartOverlay extends StatefulWidget {

  final BarChartContext barChartContext;
  final String labelText;

  const AverageBarChartOverlay({
    required this.barChartContext,
    this.labelText = 'Avg',
    super.key,
  });

  @override
  State<AverageBarChartOverlay> createState() => _AverageBarChartOverlayState();
}

class _AverageBarChartOverlayState extends State<AverageBarChartOverlay>
    with SingleTickerProviderStateMixin {

  late final AnimationController animationController;
  late final Animation<double> lineProgressAnimation;
  late final Animation<double> textOpacityAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Durations.long2,
    );
    lineProgressAnimation = Tween(begin: 0.0, end: 1.0)
      .chain(CurveTween(curve: Curves.easeOutExpo))
      .animate(CurvedAnimation(parent: animationController, curve: Interval(0.0, 0.5)));
    textOpacityAnimation = Tween(begin: 0.0, end: 1.0)
      .chain(CurveTween(curve: Curves.easeOutExpo))
      .animate(CurvedAnimation(parent: animationController, curve: Interval(0.5, 1.0)));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AverageBarChartOverlay oldWidget) {
    if (widget.barChartContext.avg > 0.0 && oldWidget.barChartContext.avg == 0.0) {
      animationController.reset();
      animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return CustomPaint(
              painter: AverageOverlayPainter(
                average: widget.barChartContext.avg,
                averageLabel: widget.labelText,
                displayRange: widget.barChartContext.displayRangeSetter(widget.barChartContext.max),
                color: Colors.white,
                lineProgress: lineProgressAnimation.value,
                textOpacity: textOpacityAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}
