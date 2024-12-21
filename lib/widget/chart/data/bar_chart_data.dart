import 'dart:math';

class BarChartData {

  final List<BarChartDataItem> data;

  const BarChartData(this.data);

  double get maxValue {
    return data.map((e) => e.value).reduce((value, max) => value > max ? value : max);
  }
  
}

class BarChartDataItem {

  final double value;
  final String label;

  const BarChartDataItem({
    required this.value,
    required this.label,
  });

}
