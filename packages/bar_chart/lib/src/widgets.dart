import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'enums.dart';
import 'models.dart';
import 'painting.dart';

class BarChart extends StatefulWidget {

  final BarChartDataSource dataSource;
  final XAxisLayout xAxisLayout;
  final double xAxisHeight;
  final YAxisLayout yAxisLayout;
  final double yAxisWidth;

  final void Function(int index)? onTapBar;
  final void Function(int index)? onLongPressBar;
  final void Function(int index)? onBarHover;
  final void Function()? onLongPressBarEnd;

  const BarChart({
    required this.dataSource,
    this.xAxisLayout = XAxisLayout.bottom,
    this.xAxisHeight = 20,
    this.yAxisLayout = YAxisLayout.left,
    this.yAxisWidth = 20,
    this.onTapBar,
    this.onLongPressBar,
    this.onLongPressBarEnd,
    this.onBarHover,
    super.key,
  });

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {

  late BarChartContext barChartContext;
  final List<BarChartData> barChartData = [];
  final barContainerKey = GlobalKey();

  @override
  void initState() {
    barChartData.addAll(widget.dataSource.barChartData);
    barChartContext = BarChartContext(
      barChartDataSource: widget.dataSource,
      xAxisLayout: widget.xAxisLayout,
      xAxisHeight: widget.xAxisHeight,
      yAxisLayout: widget.yAxisLayout,
      yAxisWidth: widget.yAxisWidth,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant BarChart oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final bool buildMirroredYAxis = (
      widget.yAxisLayout == YAxisLayout.right ||
      widget.yAxisLayout == YAxisLayout.both
    );

    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              buildYAxis(context),
              Expanded(
                child: buildBars(context),
              ),
              if (buildMirroredYAxis)
                buildYAxis(context),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: widget.yAxisWidth),
          child: buildXAxis(context),
        )
      ],
    );

  }

  Widget buildYAxis(BuildContext context) {
    return SizedBox(
      width: 20,
      height: double.infinity,
      child: CustomPaint(
        painter: YAxisPainter(
          barChartContext: barChartContext,
        ),
      )
    );
  }

  Widget buildBars(BuildContext context) {

    return Row(
      key: barContainerKey,
      children: [
        for (final data in barChartData)
          Expanded(
            child: Listener(
              onPointerDown: _barHitTest,
              child: BarChartBar(
                barChartContext: barChartContext,
                value: data.value,
              ),
            ),
          ),
      ],
    );

  }

  Widget buildXAxis(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 20,
      child: CustomPaint(
        painter: XAxisPainter(
          barChartContext: barChartContext,
        ),
      )
    );
  }

  void _barHitTest(PointerEvent event) {
    final RenderBox box = barContainerKey.currentContext!.findAncestorRenderObjectOfType<RenderBox>()!;
    final result = BoxHitTestResult();
    Offset local = box.globalToLocal(event.position);
    if (box.hitTest(result, position: local)) {
      for (final hit in result.path) {
        /// temporary variable so that the [is] allows access of [index]
        final target = hit.target;
        if (target is RenderBarChartBar) {
          print(target.value);
        }
      }
    }
  }

}

class BarChartBar extends LeafRenderObjectWidget {

  final double value;
  final double width;
  final BarChartContext barChartContext;
  final Color color;

  const BarChartBar({
    required this.value,
    required this.barChartContext,
    this.width = double.infinity,
    this.color = Colors.white,
    super.key,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartBar(
      barChartContext: barChartContext,
      value: value,
      width: width,
      color: color,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderBarChartBar renderObject) {
    renderObject.barChartContext = barChartContext;
    renderObject.value = value;
    renderObject.width = width;
    renderObject.color = color;
  }
}

