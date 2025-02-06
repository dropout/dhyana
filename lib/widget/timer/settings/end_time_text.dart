import 'dart:async';

import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EndTimeText extends StatefulWidget {

  final TimerSettings timerSettings;

  const EndTimeText({
    required this.timerSettings,
    super.key
  });

  @override
  State<EndTimeText> createState() => _EndTimeTextState();
}

class _EndTimeTextState extends State<EndTimeText> {

  late DateTime end;
  late Timer _timer;

  @override
  void initState() {
    end = DateTime.now().add(widget.timerSettings.warmup + widget.timerSettings.duration);
    _timer = Timer.periodic(const Duration(minutes: 1), _onTimerTick);
    super.initState();
  }

  void _onTimerTick(Timer timer) {
    setState(() {
      end = DateTime.now().add(widget.timerSettings.warmup + widget.timerSettings.duration);
    });
  }

  @override
  void didUpdateWidget(covariant EndTimeText oldWidget) {
    final bool warmupChanged = (oldWidget.timerSettings.warmup != widget.timerSettings.warmup);
    final bool durationChanged = (oldWidget.timerSettings.duration != widget.timerSettings.duration);

    if (warmupChanged || durationChanged) {
      end = DateTime.now().add(widget.timerSettings.warmup + widget.timerSettings.duration);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppThemeData.spacingMd,
        vertical: AppThemeData.spacingSm,
      ),
      child: Text(
        DateFormat.Hm().format(end),
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
