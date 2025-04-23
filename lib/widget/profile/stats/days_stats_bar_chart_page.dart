import 'package:bar_chart/bar_chart.dart';
import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'stats_bar_chart.dart';

class DaysStatsBarChartPage extends StatelessWidget {

  final int pageIndex;
  final StatsInterval statsInterval;

  // forward these to the actual barchart infotrigger bars implementation
  final void Function(int index, Day day)? onInfoTriggered;
  final void Function(int index, Day day)? onInfoChanged;
  final void Function(int index, Day day)? onInfoDismissed;

  final void Function(List<Day> days)? onDaysLoaded;

  const DaysStatsBarChartPage({
    required this.pageIndex,
    required this.statsInterval,
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
    Duration difference = statsInterval.from.difference(statsInterval.to);
    return buildScaffolding(context,
      chart: StatsBarChart(
        key: ValueKey(pageIndex),
        barData: List.generate(difference.inDays.abs(), (index) {
          DateTime day = statsInterval.from.add(Duration(days: index));
          return BarData(
            value: 0,
            label: DateFormat.EEEE(Localizations.localeOf(context).toString())
                .format(day).toUpperCase(),
          );
        }),
      ),
      calculatedStats: CalculatedStatsView(calculatedStats: CalculatedStats()),
    );
  }

  Widget buildLoadedState(BuildContext context, DaysLoadedState state) {
    return buildScaffolding(
      context,
      chart: StatsBarChart(
        key: ValueKey(pageIndex),
        barData: state.days.map((day) {
          return BarData(
            value: day.minutesCount.toDouble(),
            label: DateFormat.EEEE(
                Localizations.localeOf(context).toString()
            ).format(day.startDate).toUpperCase(),
          );
        }).toList(),
        infoBuilderDelegate: (context, index) =>
          buildBarInfo(context, index, state),
      ),
      calculatedStats: CalculatedStatsView(
        calculatedStats: CalculatedStats.fromDays(state.days),
      ),
    );
  }

  Widget buildScaffolding(BuildContext context, {
    required Widget chart,
    required Widget calculatedStats,
  }) {
    return Column(
     children: [
       SizedBox(
         height: 420,
         child: chart,
       ),
       Expanded(
         child: Padding(
           padding: const EdgeInsets.only(
             left: AppThemeData.paddingLg,
             right: AppThemeData.paddingXl + 32,
           ),
           child: calculatedStats,
         )
       ),
     ],
    );
  }

  Widget buildBarInfo(BuildContext context, int index, DaysLoadedState state) {
    if (index < 0) {
      final calculatedStats = CalculatedStats.fromDays(state.days);
      return DaysOverlayIdle(
        dateRangeText: createIntervalString(
          context,
          statsInterval.from,
          statsInterval.to,
        ),
        averageMinutes: calculatedStats.averageMinutes.toInt(),
        averageSessionCount: calculatedStats.averageSessions.toInt(),
      );
    } else {
      return UnconstrainedBox(
        child: DaysOverlay(
          day: state.days[index],
        ),
      );
    }
  }

}



