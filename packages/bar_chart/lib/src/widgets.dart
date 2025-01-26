import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'enums.dart';
import 'models.dart';
import 'painting.dart';

class BarChart extends StatefulWidget {

  final BarChartDataSource dataSource;

  final XAxisLayout xAxisLayout;
  final XAxisBuilder xAxisBuilder;
  final double xAxisHeight;

  final YAxisLayout yAxisLayout;
  final YAxisBuilder yAxisBuilder;
  final double yAxisWidth;

  final BarBuilder barBuilder;

  final void Function(BarData data)? onInfoTriggered;
  final void Function(BarData data)? onInfoChanged;
  final void Function(BarData data)? onInfoDismissed;

  const BarChart({
    required this.dataSource,
    this.xAxisLayout = XAxisLayout.bottom,
    this.xAxisBuilder = _defaultXAxisBuilder,
    this.xAxisHeight = 20,
    this.yAxisLayout = YAxisLayout.left,
    this.yAxisBuilder = _defaultYAxisBuilder,
    this.yAxisWidth = 20,
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
              widget.yAxisBuilder(context, barChartContext),
              Expanded(
                child: buildBars(context),
              ),
              if (buildMirroredYAxis)
                widget.yAxisBuilder(context, barChartContext),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: widget.yAxisWidth),
          child: widget.xAxisBuilder(context, barChartContext),
        )
      ],
    );

  }

  Widget buildBars(BuildContext context) {
    return Row(
      key: barContainerKey,
      children: [
        for (var i = 0; i < barChartData.length; i++)
          Expanded(
            child: GestureDetector(
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
  final double width;
  final BarChartContext barChartContext;
  final Color color;

  const BarChartBar({
    required this.index,
    required this.barChartData,
    required this.barChartContext,
    this.width = double.infinity,
    this.color = Colors.white,
    super.key,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartBar(
      index: index,
      barChartContext: barChartContext,
      barChartData: barChartData,
      width: width,
      color: color,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderBarChartBar renderObject) {
    renderObject.barChartContext = barChartContext;
    renderObject.barChartData = barChartData;
    renderObject.width = width;
    renderObject.color = color;
  }
}

Widget _defaultXAxisBuilder(BuildContext context, BarChartContext barChartContext) {
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

Widget _defaultYAxisBuilder(BuildContext context, BarChartContext barChartContext) {
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
  );
}
