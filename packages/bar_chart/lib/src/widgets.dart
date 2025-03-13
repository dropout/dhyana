import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'models.dart';
import 'painting.dart';

class BarChart extends StatefulWidget {

  final List<BarData> dataSource;

  final AxisBuilder? axisBuilder;
  final BarBuilder barBuilder;
  final OverlayBuilder? overlayBuilder;

  final double Function(double max) displayRangeSetter;

  const BarChart({
    required this.dataSource,
    this.axisBuilder = _defaultAxisBuilder,
    this.barBuilder = _defaultBarBuilder,
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

class InfoTriggerBars extends StatefulWidget {

  final Color barColor;
  final Color selectedBarColor;
  final BarChartContext barChartContext;

  final void Function(int index, BarData data)? onInfoTriggered;
  final void Function(int index, BarData data)? onInfoChanged;
  final void Function(int index, BarData data)? onInfoDismissed;

  const InfoTriggerBars({
    required this.barChartContext,
    this.barColor = Colors.grey,
    this.selectedBarColor = Colors.white,
    this.onInfoTriggered,
    this.onInfoChanged,
    this.onInfoDismissed,
    super.key,
  });

  @override
  State<InfoTriggerBars> createState() => _InfoTriggerBarsState();
}

class _InfoTriggerBarsState extends State<InfoTriggerBars> {

  final barContainerKey = GlobalKey();
  bool _isInfoTriggered = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final barChartData = widget.barChartContext.dataSource;
    return Row(
      key: barContainerKey,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < barChartData.length; i++)
          Expanded(
            child: GestureDetector(
              onLongPress: () {
                setState(() {
                  _isInfoTriggered = true;
                  selectedIndex = i;
                  widget.onInfoTriggered?.call(i, barChartData[i]);
                });
              },
              onLongPressEnd: (details) {
                if (_isInfoTriggered) {
                  setState(() {
                    _isInfoTriggered = false;
                    selectedIndex = -1;
                    widget.onInfoDismissed?.call(i, barChartData[i]);
                  });
                }
              },
              child: Listener(
                behavior: HitTestBehavior.opaque,
                onPointerMove: (PointerMoveEvent event) {
                  int? targetBarIndex = _barHitTest(event);
                  if (_isInfoTriggered && targetBarIndex != null && targetBarIndex != selectedIndex) {
                    setState(() {
                      selectedIndex = targetBarIndex;
                    });
                    widget.onInfoChanged?.call(targetBarIndex, barChartData[targetBarIndex]);
                  }
                },
                child: InfoTriggerArea(
                  barIndex: i,
                  child: AnimatedFractionallySizedBox(
                    duration: Durations.long2,
                    curve: Curves.easeInOutCubicEmphasized,
                    heightFactor: math.min((barChartData[i].value / widget.barChartContext.displayRange), 1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: AnimatedContainer(
                        duration: Durations.short2,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: HSLColor.fromColor(widget.barColor).withLightness(0.8).toColor(),
                              width: 2.0,
                            ),
                          ),
                          color: (selectedIndex == i) ? widget.selectedBarColor : widget.barColor,
                        ),
                      ),
                    )

                  )
                )
              )
            )
          )
      ],
    );
  }

  int? _barHitTest(PointerEvent event) {
    if (mounted == false) return null;
    final RenderBox box = barContainerKey.currentContext!.findAncestorRenderObjectOfType<RenderBox>()!;
    final result = BoxHitTestResult();
    Offset local = box.globalToLocal(event.position);
    if (box.hitTest(result, position: local)) {
      for (final hit in result.path) {
        // temporary variable so that the [is] allows access of [index]
        final target = hit.target;
        if (target is RenderInfoTriggerArea) {
          return target.barIndex;
        }
      }
    }
    return null;
  }

}

class InfoTriggerArea extends SingleChildRenderObjectWidget {

  final int barIndex;

  const InfoTriggerArea({
    required this.barIndex,
    super.child,
    super.key,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderInfoTriggerArea(
      barIndex: barIndex,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderInfoTriggerArea renderObject) {
    renderObject.barIndex = barIndex;
  }

}

class RenderInfoTriggerArea extends RenderProxyBox {

  int barIndex;

  RenderInfoTriggerArea({
    required this.barIndex,
    RenderBox? child,
  }) : super(child);

  @override
  void performLayout() {
    size = constraints.constrain(Size(double.infinity, double.infinity));
    child?.layout(constraints, parentUsesSize: false);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;
    if (child == null) {
      return;
    }
    context.paintChild(
      child,
      Offset(offset.dx, offset.dy + (size.height - child.size.height)),
    );
  }

  @override
  bool hitTestSelf(Offset position) => size.contains(position);

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
TextPainter _defaultYAxisLabelFormatter({
  required double value,
  required Color color,
}) {
  return createTextPainter(value.toStringAsFixed(0), TextAlign.left, color: color);
}

int _defaultXAxisIntervalSetter(int barCount) => 1;
TextPainter _defaultXAxisLabelFormatter({
  required double labelWidth,
  required BarData barData,
  required Color color,
}) {

  TextStyle textStyle = TextStyle(
    color: color,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  final textSpan = TextSpan(
    text: barData.label.substring(0, 1),
    style: textStyle,
  );
  final textPainter = TextPainter(
    text: textSpan,
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(
    minWidth: labelWidth,
    maxWidth: labelWidth,
  );

  return textPainter;
}

class DefaultBarChartAxis extends StatefulWidget {

  final Color color;
  final BarChartContext barChartContext;
  final EdgeInsets barPadding;

  final double Function(double displayRange) yAxisIntervalSetter;
  final int Function(int barCount) xAxisIntervalSetter;

  final YAxisLabelFormatter yAxisLabelFormatter;
  final XAxisLabelFormatter xAxisLabelFormatter;

  const DefaultBarChartAxis({
    required this.barChartContext,
    required this.color,
    required this.barPadding,
    this.yAxisIntervalSetter = _defaultYAxisIntervalSetter,
    this.xAxisIntervalSetter = _defaultXAxisIntervalSetter,
    this.yAxisLabelFormatter = _defaultYAxisLabelFormatter,
    this.xAxisLabelFormatter = _defaultXAxisLabelFormatter,
    super.key,
  });

  @override
  State<DefaultBarChartAxis> createState() => _DefaultBarChartAxisState();
}

class _DefaultBarChartAxisState extends State<DefaultBarChartAxis> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AxisPainter(
        xIntervalCount: widget.xAxisIntervalSetter(widget.barChartContext.dataSource.length),
        yIntervalCount: widget.yAxisIntervalSetter(widget.barChartContext.displayRange),
        xAxisLabelFormatter: widget.xAxisLabelFormatter,
        yAxisLabelFormatter: widget.yAxisLabelFormatter,
        color: widget.color,
        barChartContext: widget.barChartContext,
        barPadding: widget.barPadding,
      ),
    );
  }
}


class AverageBarChartOverlay extends StatefulWidget {

  final BarChartContext barChartContext;

  const AverageBarChartOverlay({
    required this.barChartContext,
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
                displayRange: widget.barChartContext.displayRange,
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
