import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'enums.dart';
import 'models.dart';
import 'painting.dart';

class BarChart extends StatefulWidget {

  final BarChartDataSource dataSource;
  final double? displayRange;

  final double xAxisPadding;
  final int xAxisFactor;
  final double yAxisPadding;
  final int yAxisFactor;

  final double barPadding;
  final BarBuilder barBuilder;

  final void Function(BarData data)? onInfoTriggered;
  final void Function(BarData data)? onInfoChanged;
  final void Function(BarData data)? onInfoDismissed;

  const BarChart({
    required this.dataSource,
    this.displayRange,
    this.barPadding = 0,
    this.xAxisPadding = 20,
    this.xAxisFactor = 60,
    this.yAxisPadding = 20,
    this.yAxisFactor = 1,
    this.barBuilder = _defaultBarBuilder,
    this.onInfoTriggered,
    this.onInfoChanged,
    this.onInfoDismissed,
    super.key,
  });

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {

  late BarChartContext barChartContext;
  final List<BarData> barChartData = [];
  final barContainerKey = GlobalKey();

  bool _isInfoTriggered = false;
  BarData? _selectedBarData;
  int selectedIndex = -1;

  @override
  void initState() {
    barChartData.addAll(widget.dataSource.barChartData);
    barChartContext = BarChartContext(
      dataSource: widget.dataSource,
      xAxisPadding: widget.xAxisPadding,
      xAxisFactor: widget.xAxisFactor,
      yAxisPadding: widget.yAxisPadding,
      yAxisFactor: widget.yAxisFactor,
      displayRange: widget.displayRange,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant BarChart oldWidget) {
    setState(() {
      barChartData.clear();
      barChartData.addAll(widget.dataSource.barChartData);
      barChartContext = BarChartContext(
        dataSource: widget.dataSource,
        xAxisPadding: widget.xAxisPadding,
        xAxisFactor: widget.xAxisFactor,
        yAxisPadding: widget.yAxisPadding,
        yAxisFactor: widget.yAxisFactor,
        displayRange: widget.displayRange,
      );
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: AxisPainter(
          color: Colors.grey.shade600,
          barChartContext: barChartContext,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: barChartContext.yAxisPadding,
            right: barChartContext.xAxisPadding,
          ),
          child: buildBars(context),
        ),
      ),
    );
  }

  Widget buildBars(BuildContext context) {
    return Row(
      key: barContainerKey,
      children: [
        for (var i = 0; i < barChartData.length; i++)
          Expanded(
            child: GestureDetector(
              onTap: () {
                // widget.onBarTap?.call(barChartData[i]);
              },
              onLongPress: () {
                setState(() {
                  _isInfoTriggered = true;
                  _selectedBarData = barChartData[i];
                  widget.onInfoTriggered?.call(barChartData[i]);
                });
              },
              onLongPressEnd: (details) {
                if (_isInfoTriggered) {
                  setState(() {
                    _isInfoTriggered = false;
                    widget.onInfoDismissed?.call(_selectedBarData!);
                    _selectedBarData = null;
                  });
                }
              },
              child: Listener(
                behavior: HitTestBehavior.opaque,
                onPointerMove: (PointerMoveEvent event) {
                  BarData? targetBarData = _barHitTest(event);
                  if (targetBarData != null && targetBarData != _selectedBarData) {
                    setState(() {
                      _selectedBarData = targetBarData;
                      widget.onInfoChanged?.call(targetBarData);
                    });
                  }
                },
                child: widget.barBuilder(
                  context,
                  barChartContext,
                  barChartData[i],
                  i,
                ),
              )
            ),
          )
      ],
    );
  }

  BarData? _barHitTest(PointerEvent event) {
    final RenderBox box = barContainerKey.currentContext!.findAncestorRenderObjectOfType<RenderBox>()!;
    final result = BoxHitTestResult();
    Offset local = box.globalToLocal(event.position);
    if (box.hitTest(result, position: local)) {
      for (final hit in result.path) {
        /// temporary variable so that the [is] allows access of [index]
        final target = hit.target;
        if (target is RenderBarChartBar) {
          return target.barChartData;
        }
      }
    }
    return null;
  }

}

class BarChartBar extends LeafRenderObjectWidget {

  final int index;
  final BarData barChartData;
  final double barPadding;
  final BarChartContext barChartContext;
  final Color color;

  const BarChartBar({
    required this.index,
    required this.barChartData,
    required this.barChartContext,
    this.barPadding = double.infinity,
    this.color = Colors.white,
    super.key,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartBar(
      index: index,
      barChartContext: barChartContext,
      barChartData: barChartData,
      barPadding: barPadding,
      color: color,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderBarChartBar renderObject) {
    renderObject.barChartContext = barChartContext;
    renderObject.barChartData = barChartData;
    renderObject.width = barPadding;
    renderObject.color = color;
  }
}

Widget _defaultBarBuilder(
  BuildContext context,
  BarChartContext barChartContext,
  BarData data,
  int index,
) {
  return BarChartBar(
    index: index,
    barChartContext: barChartContext,
    barChartData: data,
    barPadding: 1,
  );
}
