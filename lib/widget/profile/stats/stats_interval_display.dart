import 'package:dhyana/bloc/stats_interval/stats_interval_bloc.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StatsIntervalDisplay extends StatefulWidget {

  final StatsInterval statsInterval;

  const StatsIntervalDisplay({
    required this.statsInterval,
    super.key,
  });

  @override
  State<StatsIntervalDisplay> createState() => _StatsIntervalDisplayState();
}

class _StatsIntervalDisplayState extends State<StatsIntervalDisplay>
  with SingleTickerProviderStateMixin{

  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.short4,
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant StatsIntervalDisplay oldWidget) {
    if (oldWidget.statsInterval != widget.statsInterval) {
      _animationController.reset();
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Durations.long2,
      transitionBuilder: (child, animation) {
        return animatedSwitcherTransition(child, animation);
      },
      child: SizedBox(
        key: ValueKey(widget.statsInterval.from),
        width: double.infinity,
        child: Text(
          createIntervalString(
            context,
            widget.statsInterval.from,
            widget.statsInterval.to,
          ),
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildTextWidget(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

}
