import 'dart:math' as math;

import 'package:bar_chart/bar_chart.dart';
import 'package:flutter/material.dart';

import 'enums.dart';

typedef BarBuilder = Widget Function(
  BuildContext context,
  BarChartContext barChartContext,
  BarData barChartData,
  int index,
);

typedef YAxisBuilder = Widget Function(
  BuildContext context,
  BarChartContext barChartContext
);

typedef XAxisBuilder = Widget Function(
  BuildContext context,
  BarChartContext barChartContext
);

class BarChartContext {

  final BarChartDataSource dataSource;
  final EdgeInsets padding;

  final int xAxisIntervalFactor;
  final int yAxisIntervalFactor;

  final double Function(BarChartDataSource dataSource) displayRangeSetter;
  final String Function(double value)? yAxisLabelFormatter;
  final String Function(BarData barChartData)? xAxisLabelFormatter;

  const BarChartContext({
    required this.dataSource,
    required this.xAxisIntervalFactor,
    required this.yAxisIntervalFactor,
    this.padding = EdgeInsets.zero,
    this.displayRangeSetter = _defaultDisplayRangeSetter,
    this.xAxisLabelFormatter = _defaultXAxisLabelFormatter,
    this.yAxisLabelFormatter = _defaultYAxisLabelFormatter,
  });

  double get displayRange => displayRangeSetter(dataSource);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BarChartContext &&
      other.dataSource == dataSource &&
      other.padding == padding &&
      other.xAxisIntervalFactor == xAxisIntervalFactor &&
      other.yAxisIntervalFactor == yAxisIntervalFactor &&
      other.displayRangeSetter == displayRangeSetter &&
      other.xAxisLabelFormatter == xAxisLabelFormatter &&
      other.yAxisLabelFormatter == yAxisLabelFormatter;
  }

  @override
  int get hashCode => Object.hash(
    dataSource,
    xAxisIntervalFactor,
    yAxisIntervalFactor,
    padding,
  );

}

class BarData<T> {

  final double value;
  final String label;
  final T source;

  const BarData({
    required this.value,
    required this.label,
    required this.source,
  });

  @override
  String toString() => 'BarData(value: $value, label: $label, source: $source)';

  @override
  bool operator == (Object other) =>
    other is BarData && value == other.value && label == other.label ;

  @override
  int get hashCode => Object.hash(value, label);

}

class BarChartDataSource<T> {

  final List<T> source;
  final BarData Function(T) dataMapper;

  const BarChartDataSource({
    required this.source,
    required this.dataMapper,
  });

  double get max => source.map(dataMapper).map((data) => data.value).reduce(math.max);
  double get min => source.map(dataMapper).map((data) => data.value).reduce(math.min);
  int get length => source.length;

  List<BarData> get barChartData => source.map(dataMapper).toList();

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
