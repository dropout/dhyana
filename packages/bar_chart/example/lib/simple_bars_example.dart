
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
      title: 'Simple bars example',
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
    MyData(name: 'M', minutes: 10),
    MyData(name: 'T', minutes: 20),
    MyData(name: 'W', minutes: 30),
    MyData(name: 'T', minutes: 40),
    MyData(name: 'F', minutes: 50),
    MyData(name: 'S', minutes: 60),
    MyData(name: 'S', minutes: 70),
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
                    dataSource: testWeekData.map((d) => BarData(
                      value: d.minutes,
                      label: d.name,
                    )).toList(),
                    displayRangeSetter: (max) => 100,
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }

}
