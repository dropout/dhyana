// import 'dart:math' as math;
//
// import 'package:bar_chart/bar_chart.dart';
// import 'package:flutter/material.dart';
//
// class MyData {
//   final String name;
//   final double value;
//   const MyData({
//     required this.name,
//     required this.value,
//   });
//   @override
//   toString() => 'MyData(name: $name, value: $value)';
// }
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'BarChart Example',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const BarChartExamplePage(),
//     );
//   }
// }
//
// class BarChartExamplePage extends StatefulWidget {
//   const BarChartExamplePage({super.key});
//
//   @override
//   State<BarChartExamplePage> createState() => _BarChartExamplePageState();
// }
//
// class _BarChartExamplePageState extends State<BarChartExamplePage> {
//
//   // Example data source
//   final List<MyData> testWeekData = <MyData>[
//     MyData(name: 'M', value: math.Random().nextDouble() * 20),
//     MyData(name: 'T', value: math.Random().nextDouble() * 50),
//     MyData(name: 'W', value: math.Random().nextDouble() * 50),
//     MyData(name: 'T', value: math.Random().nextDouble() * 10),
//     MyData(name: 'F', value: math.Random().nextDouble() * 30),
//     MyData(name: 'S', value: math.Random().nextDouble() * 50),
//     MyData(name: 'S', value: math.Random().nextDouble() * 30),
//   ];
//
//   final List<MyData> testDayData = <MyData>[
//     MyData(name: '0', value: 50 + math.Random().nextDouble() * 20),
//     MyData(name: '1', value: 50 + math.Random().nextDouble() * 50),
//     MyData(name: '2', value: 50 + math.Random().nextDouble() * 50),
//     MyData(name: '3', value: 50 + math.Random().nextDouble() * 10),
//     MyData(name: '4', value: 50 + math.Random().nextDouble() * 30),
//     MyData(name: '5', value: 50 + math.Random().nextDouble() * 50),
//     MyData(name: '6', value: 50 + math.Random().nextDouble() * 30),
//     MyData(name: '7', value: 50 + math.Random().nextDouble() * 50),
//     MyData(name: '8', value: 50 + math.Random().nextDouble() * 50),
//     MyData(name: '9', value: 50 + math.Random().nextDouble() * 10),
//     MyData(name: '10', value: 50 + math.Random().nextDouble() * 30),
//     MyData(name: '11', value: 50 + math.Random().nextDouble() * 50),
//     MyData(name: '12', value: 50 + math.Random().nextDouble() * 30),
//     MyData(name: '13', value: 50 + math.Random().nextDouble() * 50),
//     MyData(name: '14', value: 50 + math.Random().nextDouble() * 50),
//     MyData(name: '15', value: 50 + math.Random().nextDouble() * 10),
//     MyData(name: '16', value: 50 + math.Random().nextDouble() * 30),
//     MyData(name: '17', value: 50 + math.Random().nextDouble() * 50),
//     MyData(name: '18', value: 50 + math.Random().nextDouble() * 30),
//     MyData(name: '19', value: 50 + math.Random().nextDouble() * 30),
//     MyData(name: '20', value: 50 + math.Random().nextDouble() * 30),
//     MyData(name: '21', value: 50 + math.Random().nextDouble() * 30),
//     MyData(name: '22', value: 50 + math.Random().nextDouble() * 30),
//     MyData(name: '23', value: 50 + math.Random().nextDouble() * 30),
//   ];
//
//   // Overlay
//   OverlayEntry? overlayEntry;
//   MyData? selectedData;
//
//   // Settings
//   bool autoDisplayRange = false;
//   double displayRange = 200;
//
//   int selectedBarIndex = -1;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Widget overlayEntryBuilder(BuildContext context, MyData data) {
//     if (selectedData == null) {
//       return SizedBox.shrink();
//     }
//
//     return SafeArea(
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Material(
//           color: Colors.transparent,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.red,
//               ),
//               padding: EdgeInsets.all(16),
//               child: Text(
//                 selectedData.toString(),
//                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amberAccent.shade100,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 200,
//                 child: Center(
//                   child: Text(
//                     'BarChart Example',
//                     style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               ),
//               Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     width: double.infinity,
//                     height: 200,
//                     color: Colors.black,
//                     child: BarChart(
//                       dataSource: BarChartDataSource<MyData>(
//                         source: testWeekData,
//                         dataMapper: (MyData data) =>
//                           BarData<MyData>(
//                             value: data.value,
//                             label: data.name,
//                             source: data,
//                           ),
//                       ),
//                       axisSpacing: EdgeInsets.only(
//                         right: 20,
//                         bottom: 20,
//                       ),
//                       displayRangeSetter: (dataSource) {
//                         int hourCount = dataSource.max.toInt() ~/ 60;
//                         hourCount = math.max(1, hourCount + 1);
//                         return hourCount.toDouble() * 60;
//                       },
//                       yAxisIntervalSetter: (dataSource) {
//                         return 30.0;
//                       },
//
//                       onInfoTriggered: (data) {
//                         showOverlay(context, data.source);
//                         print('onInfoTriggered: $data');
//                       },
//                       onInfoChanged: (data) {
//                         updateOverlay(context, data.source);
//                         print('onInfoChanged: $data');
//                       },
//                       onInfoDismissed: (data) {
//                         hideOverlay(context);
//                         print('onInfoDismissed $data');
//                       },
//                     ),
//                   ),
//
//                 ]
//               ),
//
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Checkbox(
//                     value: autoDisplayRange,
//                     onChanged: (value) {
//                       setState(() {
//                         autoDisplayRange = value ?? false;
//                       });
//                     }
//                   ),
//                   Slider(
//                     value: displayRange,
//                     min: 10,
//                     max: 1000,
//                     onChanged: (value) {
//                       setState(() {
//                         displayRange = value;
//                         autoDisplayRange = false;
//                       });
//                     }
//                   ),
//
//                 ]
//               )
//             ],
//           ),
//         )
//       ),
//     );
//   }
//
//   void showOverlay(BuildContext context, MyData data) {
//     setState(() {
//       selectedData = data;
//       overlayEntry = OverlayEntry(
//         builder: (context) => overlayEntryBuilder(context, data),
//       );
//       Overlay.of(context).insert(overlayEntry!);
//     });
//   }
//
//   void updateOverlay(BuildContext context, MyData data) {
//     setState(() {
//       selectedData = data;
//     });
//     overlayEntry?.markNeedsBuild();
//   }
//
//   void hideOverlay(BuildContext context) {
//     if (overlayEntry != null && overlayEntry!.mounted) {
//       overlayEntry?.remove();
//       overlayEntry = null;
//     }
//   }
//
// }
