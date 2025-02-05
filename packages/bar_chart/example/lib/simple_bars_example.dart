import 'dart:math' as math;

import 'package:bar_chart/bar_chart.dart';
import 'package:flutter/material.dart';

class MyData {
  final String name;
  final double minutes;
  const MyData({
    required this.name,
    required this.minutes,
  });
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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

class BarChartExamplePage extends StatefulWidget {
  const BarChartExamplePage({super.key});

  @override
  State<BarChartExamplePage> createState() => _BarChartExamplePageState();
}

class _BarChartExamplePageState extends State<BarChartExamplePage> {

  // Example data source
  final List<MyData> testWeekData = <MyData>[
    MyData(name: 'M', minutes: math.Random().nextDouble() * 20),
    MyData(name: 'T', minutes: math.Random().nextDouble() * 50),
    MyData(name: 'W', minutes: math.Random().nextDouble() * 50),
    MyData(name: 'T', minutes: math.Random().nextDouble() * 50 + 30),
    MyData(name: 'F', minutes: math.Random().nextDouble() * 30),
    MyData(name: 'S', minutes: math.Random().nextDouble() * 50),
    MyData(name: 'S', minutes: math.Random().nextDouble() * 30),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade100,
      body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [

                SizedBox(
                    height: 200,
                    child: Center(
                      child: Text(
                        'BarChart Example',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                ),

                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  height: 300,
                  color: Colors.black,
                  child: BarChart(
                    dataSource: testWeekData.map((d) => BarData<MyData>(
                      value: d.minutes,
                      label: d.name,
                      source: d,
                    )).toList(),
                    axisSpacing: EdgeInsets.only(
                      right: 20,
                      bottom: 20,
                    ),
                    displayRangeSetter: (max) {
                      int hourCount = max.toInt() ~/ 60;
                      hourCount = math.max(1, hourCount + 1);
                      return hourCount.toDouble() * 60;
                    },
                    yAxisIntervalSetter: (dataSource) {
                      return 30.0;
                    },
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }

}
