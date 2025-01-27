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
  final List<MyData> testData = const <MyData>[
    MyData(name: 'A', value: 100),
    MyData(name: 'B', value: 50),
    MyData(name: 'C', value: 150),
    MyData(name: 'D', value: 200),
  ];

  // Overlay
  OverlayEntry? overlayEntry;
  MyData? selectedData;

  // Settings
  bool disableYMaxValue = false;
  double yMaxValue = 200;

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

              Container(
                padding: const EdgeInsets.all(16),
                height: 200,
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

                  displayRange: disableYMaxValue ? null : yMaxValue,

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

              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: disableYMaxValue,
                    onChanged: (value) {
                      setState(() {
                        disableYMaxValue = value ?? false;
                      });
                    }
                  ),
                  Slider(
                    value: yMaxValue,
                    min: 10,
                    max: 1000,
                    onChanged: (value) {
                      setState(() {
                        yMaxValue = value;
                      });
                    }
                  ),
                ]
              )
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
