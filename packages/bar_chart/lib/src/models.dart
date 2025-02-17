import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

final Function _eq = const ListEquality().equals;

class BarChartContext {

  final List<BarData> _dataSource;
  final EdgeInsets padding;

  final double Function(double displayRange) yAxisIntervalSetter;
  final int Function(int barCount) xAxisIntervalSetter;

  final double Function(double max) displayRangeSetter;
  final String Function(double value) yAxisLabelFormatter;
  final String Function(BarData barChartData) xAxisLabelFormatter;

  late final double max;
  late final double min;
  late final double avg;

  BarChartContext({
    required List<BarData >dataSource,
    required this.displayRangeSetter,
    required this.yAxisIntervalSetter,
    required this.xAxisIntervalSetter,
    required this.xAxisLabelFormatter,
    required this.yAxisLabelFormatter,
    required this.padding,
  }) :
    _dataSource = List.unmodifiable(dataSource),
    max = dataSource.isEmpty ? 0 : dataSource.map((data) => data.value).reduce(math.max),
    min = dataSource.isEmpty ? 0 : dataSource.map((data) => data.value).reduce(math.min),
    avg = dataSource.isEmpty ? 0 : dataSource.map((data) => data.value).reduce((a, b) => a + b) / dataSource.length;


  List<BarData> get dataSource => _dataSource;

  double get displayRange => displayRangeSetter(max);
  double get yAxisInterval => yAxisIntervalSetter(displayRange);
  int get xAxisInterval => xAxisIntervalSetter(dataSource.length);
  double valueToPixelRatio(Size size) => size.height / displayRange;

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;
    return other is BarChartContext &&
      _eq(other.dataSource, dataSource) &&
      other.padding == padding &&
      other.displayRange == displayRange &&
      other.xAxisInterval == xAxisInterval &&
      other.yAxisInterval == yAxisInterval;
  }

  @override
  int get hashCode => Object.hash(
    dataSource,
    padding,
    displayRange,
    xAxisInterval,
    yAxisInterval,
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
