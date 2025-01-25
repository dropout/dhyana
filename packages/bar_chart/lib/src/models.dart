import 'dart:math' as math;

import 'package:bar_chart/bar_chart.dart';

import 'enums.dart';

class BarChartContext {

  final BarChartDataSource barChartDataSource;
  final XAxisLayout xAxisLayout;
  final double xAxisHeight;
  final YAxisLayout yAxisLayout;
  final double yAxisWidth;
  final double? maxValueToDisplay;

  double get yAxisMaxValue {
    return maxValueToDisplay ?? barChartDataSource.max + 10.0;
  }

  const BarChartContext({
    required this.barChartDataSource,
    required this.xAxisLayout,
    required this.xAxisHeight,
    required this.yAxisLayout,
    required this.yAxisWidth,
    this.maxValueToDisplay,
  });

}

class BarChartData {

  final double value;
  final String label;

  const BarChartData({
    required this.value,
    required this.label,
  });

}

class BarChartDataSource<T> {

  final List<T> source;
  final BarChartData Function(T) dataMapper;

  const BarChartDataSource({
    required this.source,
    required this.dataMapper,
  });

  double get max => source.map(dataMapper).map((data) => data.value).reduce(math.max);
  double get min => source.map(dataMapper).map((data) => data.value).reduce(math.min);
  int get length => source.length;

  List<BarChartData> get barChartData => source.map(dataMapper).toList();

}
