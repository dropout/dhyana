class BarChartData {

  final List<BarChartDataItem> data;

  const BarChartData(this.data);

}

class BarChartDataItem {

  final double value;
  final String label;

  const BarChartDataItem({
    required this.value,
    required this.label,
  });

}
