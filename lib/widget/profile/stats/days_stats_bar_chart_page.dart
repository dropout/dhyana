import 'package:bar_chart/bar_chart.dart';
import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DaysStatsBarChartPage extends StatelessWidget {

  final int pageIndex;

  // forward these to the actual barchart infotrigger bars implementation
  final void Function(int index, Day day)? onInfoTriggered;
  final void Function(int index, Day day)? onInfoChanged;
  final void Function(int index, Day day)? onInfoDismissed;

  final void Function(List<Day> days)? onDaysLoaded;

  const DaysStatsBarChartPage({
    required this.pageIndex,
    this.onInfoTriggered,
    this.onInfoChanged,
    this.onInfoDismissed,
    this.onDaysLoaded,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DaysBloc, DaysState>(
      builder: (context, state) {
        switch (state) {
          case DaysLoadingState():
            return buildLoadingState(context);
          case DaysLoadingErrorState():
            return const SizedBox.shrink();
          case DaysLoadedState():
            return buildLoadedState(context, state);
        }
      },
      listener: (context, state) {
        if (state is DaysLoadedState) {
          onDaysLoaded?.call(state.days);
        }
      },
      listenWhen: (previous, current) =>
        current is DaysLoadedState && previous is! DaysLoadedState,
    );
  }

  Widget buildLoadingState(BuildContext context) {

    StatsInterval defaultInterval = StatsInterval.days(
      now: DateTime.now()
    );

    Duration difference = defaultInterval.from.difference(defaultInterval.to);

    return StatsBarChart(
      key: ValueKey(pageIndex),
      barData: List.generate(difference.inDays.abs(), (index) {
        DateTime day = defaultInterval.from.add(Duration(days: index));
        return BarData(
          value: 0,
          label: DateFormat.EEEE(Localizations.localeOf(context).toString()).format(day).toUpperCase(),
        );
      }),
    );

  }

  Widget buildLoadedState(BuildContext context, DaysLoadedState state) {
    return StatsBarChart(
      key: ValueKey(pageIndex),
      barData: state.days.map((day) {
        return BarData(
          value: day.minutesCount.toDouble(),
          label: DateFormat.EEEE(Localizations.localeOf(context).toString()).format(day.startDate).toUpperCase(),
        );
      }).toList(),
      onInfoTriggered: (index, _) => onInfoTriggered?.call(index, state.days[index]),
      onInfoChanged: (index, _) => onInfoChanged?.call(index, state.days[index]),
      onInfoDismissed: (index, _) => onInfoDismissed?.call(index, state.days[index]),
    );
  }

}


class StatsBarChart extends StatefulWidget {

  final List<BarData> barData;

  final void Function(int index, BarData data)? onInfoTriggered;
  final void Function(int index, BarData data)? onInfoChanged;
  final void Function(int index, BarData data)? onInfoDismissed;

  const StatsBarChart({
    this.barData = const [],
    this.onInfoTriggered,
    this.onInfoChanged,
    this.onInfoDismissed,
    super.key,
  });

  factory StatsBarChart.empty() =>
    const StatsBarChart(
      barData: [],
    );

  @override
  State<StatsBarChart> createState() => _StatsBarChartState();
}

class _StatsBarChartState extends State<StatsBarChart> {

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets barPadding = EdgeInsets.only(
      top: 10,
      right: 32,
      bottom: 21,
      left: 0,
    );
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: BarChart(
        dataSource: widget.barData,
        displayRangeSetter: setDisplayRange,
        axisBuilder: (context, barChartContext) {
          return DefaultBarChartAxis(
            barPadding: barPadding,
            color: Colors.grey.shade700,
            barChartContext: barChartContext,
            xAxisIntervalSetter: (dataSource) {
              return 1;
            },
            yAxisIntervalSetter: (dataSource) {
              return 30.0;
            },
            showLabelOnAverage: false,
          );
        },
        barBuilder: (context, barChartContext) {
          return Padding(
            padding: barPadding,
            child: InfoTriggerBars(
              barColor: Colors.grey.shade500,
              selectedBarColor: Colors.white,
              barChartContext: barChartContext,
              onInfoTriggered: (index, data) =>
                widget.onInfoTriggered?.call(index, data),
              onInfoChanged: (index, data) =>
                widget.onInfoChanged?.call(index, data),
              onInfoDismissed: (index, data) =>
                widget.onInfoDismissed?.call(index, data),
            ),
          );
        },
        overlayBuilder: (context, barChartContext) {
          return Padding(
            padding: barPadding,
            child: AverageBarChartOverlay(
              barChartContext: barChartContext,
              labelText: AppLocalizations.of(context).averageAbbr.toLowerCase(),
            ),
          );
        },
      ),
    );
  }

  double setDisplayRange(double max) {
    // if (max < 90) {
    //   return 1;
    // }

    return max;
  }

}
