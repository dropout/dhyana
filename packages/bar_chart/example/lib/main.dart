import 'package:bar_chart/bar_chart.dart';
import 'package:flutter/material.dart';

class MyData {
  final String name;
  final double value;
  const MyData({
    required this.name,
    required this.value,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarChart Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BarChartExamplePage(),
    );
  }
}


class BarChartExamplePage extends StatelessWidget {
  const BarChartExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 100,
          child: BarChart(
            dataSource: BarChartDataSource(
              source: const <MyData>[
                MyData(name: 'A', value: 10),
                MyData(name: 'B', value: 20),
                MyData(name: 'C', value: 30),
                MyData(name: 'D', value: 40),
              ],
              mapper: (data) =>
                BarChartData(
                  value: data.value,
                  label: data.name,
                ),
            ),
          ),
        )
      )
    );
  }

}
