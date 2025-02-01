import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'models.dart';
import 'painting.dart';

class BarChart extends StatefulWidget {

  final BarChartDataSource dataSource;

  final EdgeInsets barPadding;
  final BarBuilder barBuilder;

  final double Function(BarChartDataSource dataSource) displayRangeSetter;
  final double Function(double displayRange) yAxisIntervalSetter;
  final int Function(int barCount) xAxisIntervalSetter;

  final String Function(double value) yAxisLabelFormatter;
  final String Function(BarData barChartData) xAxisLabelFormatter;

  final void Function(BarData data)? onInfoTriggered;
  final void Function(BarData data)? onInfoChanged;
  final void Function(BarData data)? onInfoDismissed;

  const BarChart({
    required this.dataSource,
    this.barPadding = EdgeInsets.zero,
    this.barBuilder = _defaultBarBuilder,
    this.displayRangeSetter = _defaultDisplayRangeSetter,
    this.xAxisIntervalSetter = _defaultXAxisIntervalSetter,
    this.yAxisIntervalSetter = _defaultYAxisIntervalSetter,
    this.xAxisLabelFormatter = _defaultXAxisLabelFormatter,
    this.yAxisLabelFormatter = _defaultYAxisLabelFormatter,

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
      padding: widget.barPadding,
      displayRangeSetter: widget.displayRangeSetter,
      xAxisLabelFormatter: widget.xAxisLabelFormatter,
      yAxisLabelFormatter: widget.yAxisLabelFormatter,
      xAxisIntervalSetter: widget.xAxisIntervalSetter,
      yAxisIntervalSetter: widget.yAxisIntervalSetter,
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
        padding: widget.barPadding,
        xAxisIntervalSetter: widget.xAxisIntervalSetter,
        yAxisIntervalSetter: widget.yAxisIntervalSetter,
        displayRangeSetter: widget.displayRangeSetter,
        xAxisLabelFormatter: widget.xAxisLabelFormatter,
        yAxisLabelFormatter: widget.yAxisLabelFormatter,
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
          padding: widget.barPadding,
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

double _defaultDisplayRangeSetter(BarChartDataSource dataSource) {
  return dataSource.max;
}

String _defaultYAxisLabelFormatter(double value) {
  return value.toStringAsFixed(0);
}

String _defaultXAxisLabelFormatter(BarData barChartData) {
  return barChartData.label;
}

double _defaultYAxisIntervalSetter(double displayRange) {
  return displayRange / 4;
}

int _defaultXAxisIntervalSetter(int barCount) {
  return 1;
}
