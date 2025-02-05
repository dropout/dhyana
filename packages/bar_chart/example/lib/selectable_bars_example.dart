import 'dart:math' as math;

import 'package:bar_chart/bar_chart.dart';
import 'package:flutter/material.dart';

class MyData {
  final String name;
  final double value;
  const MyData({
    required this.name,
    required this.value,
  });
  @override
  toString() => 'MyData(name: $name, value: $value)';
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

  final List<MyData> testDayData = <MyData>[
    MyData(name: '0', value: 50 + math.Random().nextDouble() * 20),
    MyData(name: '1', value: 50 + math.Random().nextDouble() * 50),
    MyData(name: '2', value: 50 + math.Random().nextDouble() * 50),
    MyData(name: '3', value: 50 + math.Random().nextDouble() * 10),
    MyData(name: '4', value: 50 + math.Random().nextDouble() * 30),
    MyData(name: '5', value: 50 + math.Random().nextDouble() * 50),
    MyData(name: '6', value: 50 + math.Random().nextDouble() * 30),
    MyData(name: '7', value: 50 + math.Random().nextDouble() * 50),
    MyData(name: '8', value: 50 + math.Random().nextDouble() * 50),
    MyData(name: '9', value: 50 + math.Random().nextDouble() * 10),
    MyData(name: '10', value: 50 + math.Random().nextDouble() * 30),
    MyData(name: '11', value: 50 + math.Random().nextDouble() * 50),
    MyData(name: '12', value: 50 + math.Random().nextDouble() * 30),
    MyData(name: '13', value: 50 + math.Random().nextDouble() * 50),
    MyData(name: '14', value: 50 + math.Random().nextDouble() * 50),
    MyData(name: '15', value: 50 + math.Random().nextDouble() * 10),
    MyData(name: '16', value: 50 + math.Random().nextDouble() * 30),
    MyData(name: '17', value: 50 + math.Random().nextDouble() * 50),
    MyData(name: '18', value: 50 + math.Random().nextDouble() * 30),
    MyData(name: '19', value: 50 + math.Random().nextDouble() * 30),
    MyData(name: '20', value: 50 + math.Random().nextDouble() * 30),
    MyData(name: '21', value: 50 + math.Random().nextDouble() * 30),
    MyData(name: '22', value: 50 + math.Random().nextDouble() * 30),
    MyData(name: '23', value: 50 + math.Random().nextDouble() * 30),
  ];

  MyData? selectedData;

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
                Column(
                    children: [
                      selectedData != null ? Text(selectedData.toString()) : SizedBox.shrink(),
                      Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        height: 200,
                        color: Colors.black,
                        child: BarChart(
                          dataSource: testDayData.map((d) => BarData<MyData>(
                            value: d.value,
                            label: d.name,
                            source: d,
                          )).toList(),
                          displayRangeSetter: (max) {
                            int hourCount = max.toInt() ~/ 60;
                            hourCount = math.max(1, hourCount + 1);
                            return hourCount.toDouble() * 60;
                          },
                          yAxisIntervalSetter: (dataSource) {
                            return 30.0;
                          },
                          xAxisIntervalSetter: (dataSource) {
                            return 4;
                          },
                          barBuilder: (context, barChartContext) {
                            return SelectableBars(
                              barChartContext: barChartContext,
                              onBarSelected: (index, barData) {
                                setState(() {
                                  selectedData = testDayData[index];
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ]
                ),
              ],
            ),
          )
      ),
    );
  }

}
