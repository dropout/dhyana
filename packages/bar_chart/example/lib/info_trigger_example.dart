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

  // Example data source
  final List<MyData> testWeekData = <MyData>[
    MyData(name: 'M', value: math.Random().nextDouble() * 20),
    MyData(name: 'T', value: math.Random().nextDouble() * 50),
    MyData(name: 'W', value: math.Random().nextDouble() * 50),
    MyData(name: 'T', value: math.Random().nextDouble() * 10),
    MyData(name: 'F', value: math.Random().nextDouble() * 30),
    MyData(name: 'S', value: math.Random().nextDouble() * 50),
    MyData(name: 'S', value: math.Random().nextDouble() * 30),
  ];

  // Overlay
  OverlayEntry? overlayEntry;
  MyData? selectedData;

  // Settings
  bool autoDisplayRange = false;
  double displayRange = 200;

  int selectedBarIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  Widget overlayEntryBuilder(BuildContext context, MyData data) {
    if (selectedData == null) {
      return SizedBox.shrink();
    }

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.red,
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                selectedData.toString(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
                      Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        height: 200,
                        color: Colors.black,
                        child: BarChart(
                          dataSource: testWeekData.map((d) => BarData<MyData>(
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
                          barBuilder: (context, barChartContext) {
                            return InfoTriggerBars(
                              barChartContext: barChartContext,
                              onInfoTriggered: (data) {
                                showOverlay(context, data.source);
                                print('onInfoTriggered: $data');
                              },
                              onInfoChanged: (data) {
                                updateOverlay(context, data.source);
                                print('onInfoChanged: $data');
                              },
                              onInfoDismissed: (data) {
                                hideOverlay(context);
                                print('onInfoDismissed $data');
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

  void showOverlay(BuildContext context, MyData data) {
    setState(() {
      selectedData = data;
      overlayEntry = OverlayEntry(
        builder: (context) => overlayEntryBuilder(context, data),
      );
      Overlay.of(context).insert(overlayEntry!);
    });
  }

  void updateOverlay(BuildContext context, MyData data) {
    setState(() {
      selectedData = data;
    });
    overlayEntry?.markNeedsBuild();
  }

  void hideOverlay(BuildContext context) {
    if (overlayEntry != null && overlayEntry!.mounted) {
      overlayEntry?.remove();
      overlayEntry = null;
    }
  }

}
