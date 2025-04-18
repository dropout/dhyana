import 'dart:math' as math;

import 'package:bar_chart/bar_chart.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

final Function _eq = const ListEquality().equals;

typedef BarBuilder = Widget Function(
  BuildContext context,
  BarChartContext barChartContext
);

typedef BarHeaderBuilder = Widget Function(
  BuildContext context,
  BarChartContext barChartContext
);

typedef AxisBuilder = Widget Function(
  BuildContext context,
  BarChartContext barChartContext
);

typedef OverlayBuilder = Widget Function(
  BuildContext context,
  BarChartContext barChartContext
);

typedef DisplayRangeSetter = double Function(double max);
typedef YAxisIntervalSetter = double Function(double displayRange);
typedef XAxisIntervalSetter = int Function(int barCount);

class BarChartContext {

  final List<BarData> _dataSource;

  final double Function(double max) displayRangeSetter;

  late final double max;
  late final double min;
  late final double avg;

  BarChartContext({
    required List<BarData> dataSource,
    required this.displayRangeSetter,
  }) :
    _dataSource = List.unmodifiable(dataSource),
    max = dataSource.isEmpty ? 0 : dataSource.map((data) => data.value).reduce(math.max),
    min = dataSource.isEmpty ? 0 : dataSource.map((data) => data.value).reduce(math.min),
    avg = dataSource.isEmpty ? 0 : dataSource.map((data) => data.value).reduce((a, b) => a + b) / dataSource.length;

  List<BarData> get dataSource => _dataSource;

  double get displayRange => displayRangeSetter(max);
  // double valueToPixelRatio(Size size) => size.height / displayRange;

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;
    return other is BarChartContext &&
      _eq(other.dataSource, dataSource) &&
      other.displayRange == displayRange;
  }

  @override
  int get hashCode => Object.hash(
    dataSource,
    displayRange,
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

class DisplayRangeSetters {
  static const defaultDisplayRangeSetter = _defaultDisplayRangeSetter;
  static const durationDisplayRangeSetter = _durationDisplayRangeSetter;
}

double _defaultDisplayRangeSetter(double max) => max * 1.1;
double _durationDisplayRangeSetter(double max) {
  List<int> intervals = [
    (10 * 3),
    (30 * 3),
    (60 * 3),
    (4 * 60 * 3),
    (6 * 60 * 3),
    (12 * 60 * 3),
    (24 * 60 * 3),
    (42 * 60 * 3),
    (84 * 60 * 3),
    (168 * 60 * 3),
    (336 * 60 * 3),
    (672 * 60 * 3),
    (1344 * 60 * 3),
    (2688 * 60 * 3),
    (5376 * 60 * 3),
    (10752 * 60 * 3),
  ];

  int index = 0;
  for (var i = 0; i < intervals.length; ++i) {
    if (intervals[i] > max) {
      index = i;
      break;
    }
  }

  return intervals[index].toDouble();
}
