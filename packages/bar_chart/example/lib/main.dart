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
          child: Container(
            color: Colors.blue,
            child: Text('Details of: $selectedData'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 100,
          color: Colors.black,
          child: BarChart(
            dataSource: BarChartDataSource<MyData>(
              source: testData,
              dataMapper: (MyData data) =>
                BarData<MyData>(
                  value: data.value,
                  label: data.name,
                  source: data,
                ),
            ),

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

          ),
        )
      )
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
