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

  final List<MyData> testData = const <MyData>[
    MyData(name: 'A', value: 100),
    MyData(name: 'B', value: 50),
    MyData(name: 'C', value: 150),
    MyData(name: 'D', value: 200),
  ];

  bool isOverlayVisible = false;
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 100,
          color: Colors.black,
          child: BarChart(
            dataSource: BarChartDataSource(
              source: testData,
              dataMapper: (data) =>
                BarChartData(
                  value: data.value,
                  label: data.name,
                ),
            ),

            onTapBar: (index) => print('tap: ${testData[index]}'),
            onLongPressBar: (index) => showOverlay(context, testData[index]),
            onLongPressBarEnd: () => hideOverlay(context),
            onBarHover: (index) => print('hover: ${testData[index]}'),

          ),
        )
      )
    );
  }

  void showOverlay(BuildContext context, MyData data) {
    isOverlayVisible = true;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              child: Container(
                color: Colors.blue,
                child: Text('Details of: $data'),
              ),
            ),
          ),
        );
      }
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void hideOverlay(BuildContext context) {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
      isOverlayVisible = false;
    }
  }

}
