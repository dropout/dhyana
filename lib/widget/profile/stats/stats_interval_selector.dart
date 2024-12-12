import 'package:dhyana/bloc/stats_interval/stats_interval_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StatsIntervalSelector extends StatefulWidget {

  final StatsInterval statsInterval;

  const StatsIntervalSelector({
    required this.statsInterval,
    super.key,
  });

  @override
  State<StatsIntervalSelector> createState() => _StatsIntervalSelectorState();
}

class _StatsIntervalSelectorState extends State<StatsIntervalSelector> {


  void _onLeftTapped(BuildContext context) {
    StatsIntervalBloc bloc = BlocProvider.of<StatsIntervalBloc>(context);
    bloc.add(StatsIntervalEvent.changed(
      statsInterval: widget.statsInterval.copyWith(
        from: widget.statsInterval.from.subtract(Duration(days: widget.statsInterval.intervalType.intervalInDays)),
        to: widget.statsInterval.to.subtract(Duration(days: widget.statsInterval.intervalType.intervalInDays)),
      )
    ));
  }

  void _onRightTapped(BuildContext context) {
    StatsIntervalBloc bloc = BlocProvider.of<StatsIntervalBloc>(context);
    bloc.add(StatsIntervalEvent.changed(
      statsInterval: widget.statsInterval.copyWith(
        from: widget.statsInterval.from.add(Duration(days: widget.statsInterval.intervalType.intervalInDays)),
        to: widget.statsInterval.to.add(Duration(days: widget.statsInterval.intervalType.intervalInDays)),
      )
    ));
  }

  @override
  Widget build(BuildContext context) {

    return Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => _onLeftTapped(context),
          ),
          Expanded(
              child: Center(
                child: buildTimerangeText(
                  context,
                  widget.statsInterval.from,
                  widget.statsInterval.to
                ),
              )
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => _onRightTapped(context),
          ),
        ]
    );
  }

  buildTimerangeText(BuildContext context, DateTime from, DateTime to) {
    return Text(
      '${DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(from)} - ${DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(to)}',
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

}
