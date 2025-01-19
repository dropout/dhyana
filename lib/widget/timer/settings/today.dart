import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Today extends StatefulWidget {

  const Today({
    super.key
  });

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today>
  with WidgetsBindingObserver {

  late DateTime today;

  @override
  void initState() {
    today = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TodayPainter(
        dateText: TextSpan(
          text: '${DateFormat('MMMMd').format(today)}.',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        weekDayText: TextSpan(
          text: DateFormat('EEEE').format(today),
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        setState(() {
          today = DateTime.now();
        });
      default:
    }
    super.didChangeAppLifecycleState(state);
  }

}

class TodayPainter extends CustomPainter {

  final TextPainter weekDayPainter = TextPainter(
    textDirection: ui.TextDirection.ltr,
  );

  final TextPainter datePainter = TextPainter(
    textDirection: ui.TextDirection.ltr,
  );

  final TextSpan dateText;
  final TextSpan weekDayText;

  TodayPainter({
    required this.dateText,
    required this.weekDayText,
  }) {
    weekDayPainter.text = weekDayText;
    weekDayPainter.layout();
    datePainter.text = dateText;
    datePainter.layout();
  }

  @override
  void paint(Canvas canvas, Size size) {
    datePainter.paint(canvas, Offset(0, 0));
    weekDayPainter.paint(canvas, Offset(0, datePainter.height - 5));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
