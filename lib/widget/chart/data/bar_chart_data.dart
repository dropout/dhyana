class BarChartData {

  final List<BarChartDataItem> data;

  BarChartData(this.data);

}

class BarChartDataItem {

  final double value;
  final String label;

  BarChartDataItem({
    required this.value,
    required this.label,
  });

}
