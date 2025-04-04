import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

final Function _eq = const ListEquality().equals;

typedef BarBuilder = Widget Function(
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

typedef XAxisLabelFormatter = TextPainter Function({
  required BarData barData,
  required Color color,
});

typedef YAxisLabelFormatter = TextPainter Function({
  required double value,
  required Color color,
});

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
  double valueToPixelRatio(Size size) => size.height / displayRange;

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
