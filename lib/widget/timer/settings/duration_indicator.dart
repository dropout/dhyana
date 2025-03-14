import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dhyana/model/timer_settings.dart';

class DurationIndicator extends StatefulWidget {

  final TimerSettings timerSettings;

  const DurationIndicator({
    required this.timerSettings,
    super.key
  });

  @override
  State<DurationIndicator> createState() => _DurationIndicatorState();
}

class _DurationIndicatorState extends State<DurationIndicator> {

  late final Timer _timer;

  late DateTime now;
  late DateTime end;

  final DateFormat formatter = DateFormat('H:mm');

  @override
  void initState() {
    now = DateTime.now();
    end = now.add(widget.timerSettings.warmup + widget.timerSettings.duration);

    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (Timer t) => setState(() {
        now = DateTime.now();
        end = now.add(widget.timerSettings.warmup + widget.timerSettings.duration);
      }),
    );

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: formatter.format(now),
          ),
          const WidgetSpan(
            child: Icon(
              Icons.arrow_right_alt_rounded,
              color: Colors.white,
            ),
            alignment: PlaceholderAlignment.middle,
          ),
          TextSpan(
            text: formatter.format(end),
          ),
        ]
      )
    );
  }
}
