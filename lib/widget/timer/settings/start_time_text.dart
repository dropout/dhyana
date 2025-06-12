import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StartTimeText extends StatefulWidget {
  const StartTimeText({super.key});

  @override
  State<StartTimeText> createState() => _StartTimeTextState();
}

class _StartTimeTextState extends State<StartTimeText> {
  late DateTime now;
  late Timer _timer;

  @override
  void initState() {
    now = DateTime.now();
    _timer = Timer.periodic(const Duration(minutes: 1), _onTimerTick);
    super.initState();
  }

  void _onTimerTick(Timer timer) {
    setState(() {
      now = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Text(
        DateFormat.Hm().format(now),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
