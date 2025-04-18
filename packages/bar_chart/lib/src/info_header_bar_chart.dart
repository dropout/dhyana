import 'dart:math' as math;

import 'package:bar_chart/bar_chart.dart';
import 'package:bar_chart/src/label_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'models.dart';
import 'painting.dart';

typedef InfoBuilderDelegate = Widget Function(
  BuildContext context,
  int index,
);

class InfoHeaderBarChart extends StatefulWidget {

  final List<BarData> dataSource;
  final InfoBuilderDelegate infoBuilderDelegate;

  final AxisBuilder? axisBuilder;
  final OverlayBuilder? overlayBuilder;

  final DisplayRangeSetter displayRangeSetter;

  final XAxisIntervalSetter xAxisIntervalSetter;
  final XAxisLabelFormatter xAxisLabelFormatter;
  final YAxisIntervalSetter yAxisIntervalSetter;

  final EdgeInsets barPadding;
  final String averageLabel;

  const InfoHeaderBarChart({
    required this.dataSource,
    required this.displayRangeSetter,
    required this.xAxisIntervalSetter,
    required this.xAxisLabelFormatter,
    required this.yAxisIntervalSetter,
    required this.yAxisLabelFormatter,
    required this.infoBuilderDelegate,
    required this.averageLabel,
    this.barPadding = const EdgeInsets.only(
      // top: 100,
      right: 32,
      bottom: 21,
      left: 0,
    ),
    this.axisBuilder,
    this.overlayBuilder,
    super.key,
  });

  final YAxisLabelFormatter yAxisLabelFormatter;

  @override
  State<InfoHeaderBarChart> createState() => _InfoHeaderBarChartState();
}

class _InfoHeaderBarChartState extends State<InfoHeaderBarChart> {

  late BarChartContext barChartContext;
  int selectedIndex = -1;

  @override
  void initState() {
    barChartContext = BarChartContext(
      dataSource: widget.dataSource,
      displayRangeSetter: widget.displayRangeSetter,
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant InfoHeaderBarChart oldWidget) {
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
        ConstrainedBox(
          constraints: BoxConstraints.loose(
            Size(double.infinity, 100)
          ),
          child: Padding(
            padding: widget.barPadding.copyWith(left: 0, top:0, bottom: 0),
            child: buildInfoArea(context),
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: buildBarArea(context),
        ),
      ],
    );
  }

  Widget buildInfoArea(BuildContext context) {
    return CustomSingleChildLayout(
      delegate: MyLayoutDelegate(
        barCount: barChartContext.dataSource.length,
        selectedIndex: selectedIndex,
      ),
      child: widget.infoBuilderDelegate(context, selectedIndex),
    );
  }

  Widget buildBarArea(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        (widget.axisBuilder != null) ? widget.axisBuilder!(context, barChartContext) : buildAxis(context),
        buildBars(context),
        (widget.overlayBuilder != null) ? widget.overlayBuilder!(context, barChartContext) : buildOverlay(context),
      ],
    );
  }

  Widget buildBars(BuildContext context) {
    return Padding(
      padding: widget.barPadding,
      child: InfoTriggerBars(
        barColor: Colors.grey.shade500,
        selectedBarColor: Colors.white,
        barChartContext: barChartContext,
        onInfoTriggered: (index, barData) {
          setState(() {
            selectedIndex = index;
          });
        },
        onInfoChanged: (index, barData) {
          setState(() {
            selectedIndex = index;
          });
        },
        onInfoDismissed: (index, barData) {
          setState(() {
            selectedIndex = -1;
          });
        },
      ),
    );
  }

  Widget buildAxis(BuildContext context) {
    return DefaultBarChartAxis(
      barPadding: widget.barPadding,
      color: Colors.grey.shade700,
      barChartContext: barChartContext,
      xAxisIntervalSetter: widget.xAxisIntervalSetter,
      xAxisLabelFormatter: widget.xAxisLabelFormatter,
      yAxisIntervalSetter: widget.yAxisIntervalSetter,
      yAxisLabelFormatter: widget.yAxisLabelFormatter,
      showLabelOnAverage: false,
    );
  }

  Widget buildOverlay(BuildContext context) {
    return Padding(
      padding: widget.barPadding,
      child: AverageBarChartOverlay(
        barChartContext: barChartContext,
        labelText: widget.averageLabel,
      ),
    );
  }

}

class MyLayoutDelegate extends SingleChildLayoutDelegate {

  final int barCount;
  final int selectedIndex;

  MyLayoutDelegate({
    required this.barCount,
    required this.selectedIndex,
  });

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double barWidth = size.width / barCount;
    final int bracketSize = barCount ~/ 3;

    if (selectedIndex < 0) {
      return Offset(
        0,
        size.height - childSize.height,
      );
    }


    if (selectedIndex < bracketSize) {
      return Offset(
        barWidth * selectedIndex,
        size.height - childSize.height,
      );
    }

    if (selectedIndex >= barCount - bracketSize) {
      return Offset(
        size.width - childSize.width,
        size.height - childSize.height,
      );
    }

    return Offset(
      getBarCenter(size, selectedIndex) - childSize.width / 2,
      size.height - childSize.height,
    );

  }

  double getBarCenter(Size size, int selectedIndex) {
    double barWidth = size.width / barCount;
    return barWidth * selectedIndex + barWidth / 2;
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) => true;

}
