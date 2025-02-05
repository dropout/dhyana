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
      title: 'Info trigger example',
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
    MyData(name: 'M', value: 10),
    MyData(name: 'T', value: 20),
    MyData(name: 'W', value: 30),
    MyData(name: 'T', value: 40),
    MyData(name: 'F', value: 50),
    MyData(name: 'S', value: 60),
    MyData(name: 'S', value: 70),
  ];

  // Overlay
  OverlayEntry? overlayEntry;
  MyData? selectedData;

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
                          dataSource: testWeekData.map((d) => BarData(
                            value: d.value,
                            label: d.name,
                          )).toList(),
                          displayRangeSetter: (max) => 100,
                          yAxisIntervalSetter: (dataSource) {
                            return 10.0;
                          },
                          barBuilder: (context, barChartContext) {
                            return InfoTriggerBars(
                              barChartContext: barChartContext,
                              onInfoTriggered: (index, data) {
                                showOverlay(context, testWeekData[index]);
                                print('onInfoTriggered: $data');
                              },
                              onInfoChanged: (index, data) {
                                updateOverlay(context, testWeekData[index]);
                                print('onInfoChanged: $data');
                              },
                              onInfoDismissed: (index, data) {
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
