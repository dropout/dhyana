import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'models.dart';
import 'painting.dart';

typedef BarBuilder = Widget Function(
  BuildContext context,
  BarChartContext barChartContext
);

class BarChart extends StatefulWidget {

  final List<BarData> dataSource;

  final EdgeInsets axisSpacing;
  final BarBuilder barBuilder;

  final double Function(double max) displayRangeSetter;
  final double Function(double displayRange) yAxisIntervalSetter;
  final int Function(int barCount) xAxisIntervalSetter;

  final String Function(double value) yAxisLabelFormatter;
  final String Function(BarData barChartData) xAxisLabelFormatter;



  const BarChart({
    required this.dataSource,
    this.axisSpacing = const EdgeInsets.only(right: 20, bottom: 20),
    this.barBuilder = _defaultBarBuilder,
    this.displayRangeSetter = _defaultDisplayRangeSetter,
    this.xAxisIntervalSetter = _defaultXAxisIntervalSetter,
    this.yAxisIntervalSetter = _defaultYAxisIntervalSetter,
    this.xAxisLabelFormatter = _defaultXAxisLabelFormatter,
    this.yAxisLabelFormatter = _defaultYAxisLabelFormatter,
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
      padding: widget.axisSpacing,
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
      barChartContext = BarChartContext(
        dataSource: widget.dataSource,
        padding: widget.axisSpacing,
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
          padding: widget.axisSpacing,
          child: widget.barBuilder(context, barChartContext),
        ),
      ),
    );
  }

}

class BarChartBar extends LeafRenderObjectWidget {

  final BarData barChartData;
  final double barPadding;
  final BarChartContext barChartContext;
  final Color color;

  const BarChartBar({
    required this.barChartData,
    required this.barChartContext,
    this.barPadding = 1.0,
    this.color = Colors.white,
    super.key,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartBar(
      barChartData: barChartData,
      displayRange: barChartContext.displayRange,
      barPadding: barPadding,
      color: color,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderBarChartBar renderObject) {
    renderObject.barChartData = barChartData;
    renderObject.width = barPadding;
    renderObject.color = color;
  }
}


abstract class BarBuilderDelegate {

  const BarBuilderDelegate();

  Widget build(
    BuildContext context,
    BarChartContext barChartContext,
  );

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < widget.barChartContext.dataSource.length; i++)
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedBarIndex = i;
                  widget.onBarSelected?.call(i, widget.barChartContext.dataSource[i]);
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: i == selectedBarIndex ? Colors.red : Colors.blue,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: widget.barChartContext.dataSource[i].value,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

}


class SelectableBarBuilderDelegate extends BarBuilderDelegate {

  final int selectedIndex;
  final void Function(BarData barData, int index)? onBarSelected;

  const SelectableBarBuilderDelegate({
    required this.selectedIndex,
    this.onBarSelected,
  });

  @override
  Widget build(
    BuildContext context,
    BarChartContext barChartContext,
  ) {
    final barChartData = barChartContext.dataSource;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < barChartData.length; i++)
          Expanded(
            child: BarChartBar(
              barChartData: barChartData[i],
              barChartContext: barChartContext,
              color: i == selectedIndex ? Colors.red : Colors.white,
            ),
          )
      ],
    );
  }
}



class InfoTriggerBars extends StatefulWidget {

  final BarChartContext barChartContext;

  final void Function(BarData data)? onInfoTriggered;
  final void Function(BarData data)? onInfoChanged;
  final void Function(BarData data)? onInfoDismissed;

  const InfoTriggerBars({
    required this.barChartContext,
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < barChartData.length; i++)
          Expanded(
            child: GestureDetector(
              onLongPress: () {
                setState(() {
                  _isInfoTriggered = true;
                  selectedIndex = i;
                  widget.onInfoTriggered?.call(barChartData[i]);
                });
              }
            )
          )


      ],
    );

      // return Row(
      //   key: barContainerKey,
      //   children: [
      //     for (var i = 0; i < barChartData.length; i++)
      //       Expanded(
      //         child: GestureDetector(
      //           onTap: () {
      //             // widget.onBarTap?.call(barChartData[i]);
      //           },
      //           onLongPress: () {
      //             setState(() {
      //               _isInfoTriggered = true;
      //               _selectedBarData = barChartData[i];
      //               widget.onInfoTriggered?.call(barChartData[i]);
      //             });
      //           },
      //           onLongPressEnd: (details) {
      //             if (_isInfoTriggered) {
      //               setState(() {
      //                 _isInfoTriggered = false;
      //                 widget.onInfoDismissed?.call(_selectedBarData!);
      //                 _selectedBarData = null;
      //               });
      //             }
      //           },
      //           child: Listener(
      //             behavior: HitTestBehavior.opaque,
      //             onPointerMove: (PointerMoveEvent event) {
      //               BarData? targetBarData = _barHitTest(event);
      //               if (targetBarData != null && targetBarData != _selectedBarData) {
      //                 setState(() {
      //                   _selectedBarData = targetBarData;
      //                   widget.onInfoChanged?.call(targetBarData);
      //                 });
      //               }
      //             },
      //             child: widget.barBuilder(
      //               context,
      //               widget.barChartContext,
      //               barChartData[i],
      //               i,
      //             ),
      //           )
      //         ),
      //       )
      //   ],
      // );

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

double _defaultDisplayRangeSetter(double max) => max;
String _defaultYAxisLabelFormatter(double value) => value.toStringAsFixed(0);
String _defaultXAxisLabelFormatter(BarData barChartData) => barChartData.label;
double _defaultYAxisIntervalSetter(double displayRange) => (displayRange / 4);
int _defaultXAxisIntervalSetter(int barCount) => 1;

Widget _defaultBarBuilder(
  BuildContext context,
  BarChartContext barChartContext,
) {
  final barChartData = barChartContext.dataSource;
  return Row(
    children: [
      for (var i = 0; i < barChartData.length; i++)
        Expanded(
          child: BarChartBar(
            barChartData: barChartData[i],
            barChartContext: barChartContext,
          ),
        )
    ],
  );
}
