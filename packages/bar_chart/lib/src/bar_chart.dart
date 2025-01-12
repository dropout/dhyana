import 'package:flutter/material.dart';

class BarChart extends StatefulWidget {

  final BarChartDataSource dataSource;

  const BarChart({
    required this.dataSource,
    super.key,
  });

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {

  final List<BarChartData> barChartData = [];

  @override
  void initState() {
    barChartData.addAll(widget.dataSource.barChartData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            children: barChartData.map((data) =>
              BarChartBar(value: data.value, width: 10)).toList(),
        )
      )
    ));
  }

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
  final BarChartData Function(T) mapper;

  const BarChartDataSource({
    required this.source,
    required this.mapper,
  });

  List<BarChartData> get barChartData => source.map(mapper).toList();

}

class BarChartBar extends LeafRenderObjectWidget {

  final double value;
  final double width;

  const BarChartBar({
    required this.value,
    required this.width,
    super.key,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBarChartBar(
      value: value,
      width: width,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderBarChartBar renderObject) {
    renderObject.value = value;
    renderObject.label = label;
  }
}

class RenderBarChartBar extends RenderBox {

  double value;
  double width;

  RenderBarChartBar({
    required this.value,
    required this.width,
  });

  @override
  void performLayout() {
    size = constraints.constrain(Size(100, 100));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    context.canvas.drawRect(offset & size, paint);
  }

}
