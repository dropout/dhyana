import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'models.dart';
import 'painting.dart';

typedef BarBuilder = Widget Function(
  BuildContext context,
  BarChartContext barChartContext
);

typedef AxisBuilder = Widget Function(
  BuildContext context,
  BarChartContext barChartContext
);

typedef OverlayBuilder = Widget Function(
  BuildContext context,
  BarChartContext barChartContext
);

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
        /// temporary variable so that the [is] allows access of [index]
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
