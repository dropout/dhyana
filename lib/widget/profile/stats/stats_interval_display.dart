import 'package:dhyana/bloc/stats_interval/stats_interval_bloc.dart';
import 'package:dhyana/util/date_time_utils.dart';
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
      duration: Durations.short4,
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: (child, animation) {
        print('animationStatus: ${animation.isForwardOrCompleted}');

        if (animation.isForwardOrCompleted) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.25),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(
              opacity: animation,
              // opacity: Tween<double>(
              //   begin: 1.0,
              //   end: 0.0,
              // ).animate(animation),
              child: child,
            ),
          );
        } else {
          return FadeTransition(
            opacity: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(animation),
            child: child,
          );
        }
      },
      child: Text(
        key: ValueKey(widget.statsInterval.from),
        buildTimerangeText(
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
    );
  }

}
