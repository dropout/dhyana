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
  final double? displayRange;
  final double xAxisPadding;
  final int xAxisFactor;
  final double yAxisPadding;
  final int yAxisFactor;

  double get yAxisMaxValue {
    return displayRange ?? dataSource.max + 10.0;
  }

  const BarChartContext({
    required this.dataSource,
    required this.xAxisPadding,
    required this.xAxisFactor,
    required this.yAxisPadding,
    required this.yAxisFactor,
    this.displayRange,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BarChartContext &&
      other.dataSource == dataSource &&
      other.xAxisPadding == xAxisPadding &&
      other.yAxisPadding == yAxisPadding &&
      other.displayRange == displayRange;
  }

  @override
  int get hashCode => Object.hash(
    dataSource,
    xAxisPadding,
    yAxisPadding,
    displayRange,
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
