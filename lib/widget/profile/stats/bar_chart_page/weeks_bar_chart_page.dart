import 'package:bar_chart/bar_chart.dart';
import 'package:dhyana/bloc/weeks/weeks_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/model/week.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeeksBarChartPage extends StatelessWidget {

  final int pageIndex;
  final StatsInterval statsInterval;

  final void Function(List<Week> weeks)? onWeeksLoaded;

  const WeeksBarChartPage({
    required this.pageIndex,
    required this.statsInterval,
    this.onWeeksLoaded,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeeksBloc, WeeksState>(
      builder: (context, state) {
        switch (state) {
          case WeeksLoadingState():
            return buildLoadingState(context, state);
          case WeeksLoadingErrorState():
            return BarChartPageError();
          case WeeksLoadedState():
            return buildLoadedState(context, state);
        }
      },
      listener: (context, state) {
        if (state is WeeksLoadedState) {
          onWeeksLoaded?.call(state.weeks);
        }
      },
      listenWhen: (previous, current) =>
        current is WeeksLoadedState && previous is! WeeksLoadedState,
    );
  }

  Widget buildLoadingState(BuildContext context, WeeksLoadingState state) {
    Duration difference = statsInterval.to.difference(statsInterval.from);
    int weeksCount = (difference.inDays / 7).ceil();
    return buildScaffolding(context,
      chart: StatsBarChart(
        key: ValueKey(pageIndex),
        barData: List.generate(weeksCount, (index) {
          return BarData(
            value: 0,
            label: '',
          );
        }),
        infoBuilderDelegate: (context, index) =>
          buildBarInfo(context, index, state),
      ),
      calculatedStats: CalculatedStatsView(calculatedStats: CalculatedStats()),
    );
  }

  Widget buildLoadedState(BuildContext context, WeeksLoadedState state) {
    return buildScaffolding(
      context,
      chart: StatsBarChart(
        key: ValueKey(pageIndex),
        barData: state.weeks.map((week) {
          return BarData(
            value: week.minutesCount.toDouble(),
            label: AppLocalizations.of(context).weekNumber(
              week.startDate.year,
              week.startDate.weekNumber,
            )
          );
        }).toList(),
        infoBuilderDelegate: (context, index) =>
            buildBarInfo(context, index, state),
      ),
      calculatedStats: CalculatedStatsView(
        calculatedStats: CalculatedStats.fromWeeks(state.weeks),
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

  Widget buildBarInfo(BuildContext context, int index, WeeksState state) {
    Widget barInfo;
    switch (state) {
      case WeeksLoadingState():
        barInfo = buildBarInfoLoading(context, index);
        break;
      case WeeksLoadedState():
        barInfo = buildBarInfoFromWeeks(context, index, state.weeks);
        break;
      default:
        barInfo = SizedBox.shrink();
        break;
    }
    return AnimatedSwitcher(
      duration: Durations.short4,
      child: barInfo,
    );
  }

  Widget buildBarInfoLoading(BuildContext context, int index) {
    return BarChartInfoTriggerBox.withText(
      key: ValueKey(index),
      prefix: createIntervalString(
        context,
        statsInterval.from,
        statsInterval.to,
        subtractOneDay: true,
      ),
      mainText: AppLocalizations.of(context).statsLoadingData,
      postfix: AppLocalizations.of(context).pleaseWait,
    );
  }

  Widget buildBarInfoIdle(BuildContext context, List<Week> weeks) {
    final calculatedStats = CalculatedStats.fromWeeks(weeks);
    return BarChartInfoTriggerBox(
      prefix: Text(createIntervalString(
        context,
        statsInterval.from,
        statsInterval.to,
        subtractOneDay: true,
      )),
      mainText: Text(
        Duration(
          minutes: calculatedStats.averageMinutes.toInt()
        ).toFormattedString(context)
      ),
      postfix: Text(AppLocalizations.of(context).averagePerWeek.toLowerCase()),
    );
  }

  Widget buildBarInfoFromWeeks(
      BuildContext context,
      int index,
      List<Week> weeks
      ) {
    if (index < 0) {
      return buildBarInfoIdle(context, weeks);
    } else {
      final week = weeks[index];
      return UnconstrainedBox(
        child: BarChartInfoTriggerBox(
          prefix: Text(
            createIntervalString(
              context,
              week.startDate,
              week.startDate.add(Duration(days: 7)),
              subtractOneDay: true,
            ),
          ),
          mainText: Text(
            Duration(minutes: week.minutesCount).toFormattedString(context)
          ),
          postfix: Padding(
            padding: const EdgeInsets.only(top: AppThemeData.paddingXs),
            child: Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Circle shape
                        color: AppColors.backgroundPaperLight,
                      ),
                      child: Icon(
                        Icons.self_improvement_rounded,
                        size: 18,
                        // color: textColor,
                      ),
                    ),
                    Gap.xs(),
                    Text(week.sessionCount.toString()),
                  ],
                ),
              ],
            ),
          ),

        ),
      );
    }
  }

}



