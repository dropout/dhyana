import 'dart:math' as math;

import 'package:flutter/material.dart';

class BarChartContext {

  final List<BarData> dataSource;
  final EdgeInsets padding;

  final double Function(double displayRange) yAxisIntervalSetter;
  final int Function(int barCount) xAxisIntervalSetter;

  final double Function(double max) displayRangeSetter;
  final String Function(double value) yAxisLabelFormatter;
  final String Function(BarData barChartData) xAxisLabelFormatter;

  late final double max;
  late final double min;

  BarChartContext({
    required this.dataSource,
    required this.displayRangeSetter,
    required this.yAxisIntervalSetter,
    required this.xAxisIntervalSetter,
    required this.xAxisLabelFormatter,
    required this.yAxisLabelFormatter,
    required this.padding,
  }) :
    max = dataSource.isEmpty ? 0 : dataSource.map((data) => data.value).reduce(math.max),
    min = dataSource.isEmpty ? 0 : dataSource.map((data) => data.value).reduce(math.min);


  double get displayRange => displayRangeSetter(max);
  double get yAxisInterval => yAxisIntervalSetter(displayRange);
  int get xAxisInterval => xAxisIntervalSetter(dataSource.length);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BarChartContext &&
      other.dataSource == dataSource &&
      other.padding == padding &&
      other.xAxisInterval == xAxisInterval &&
      other.yAxisInterval == yAxisInterval &&
      other.displayRangeSetter == displayRangeSetter &&
      other.xAxisLabelFormatter == xAxisLabelFormatter &&
      other.yAxisLabelFormatter == yAxisLabelFormatter;
  }

  @override
  int get hashCode => Object.hash(
    dataSource,
    xAxisInterval,
    yAxisInterval,
    padding,
  );

}

class BarData {

  final double value;
  final String label;

  const BarData({
    required this.value,
    required this.label,

  });

  @override
  String toString() => 'BarData(value: $value, label: $label)';

  @override
  bool operator == (Object other) =>
    other is BarData && value == other.value && label == other.label ;

  @override
  int get hashCode => Object.hash(value, label);

}
