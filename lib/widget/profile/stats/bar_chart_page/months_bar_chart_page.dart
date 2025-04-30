import 'package:bar_chart/bar_chart.dart';
import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/bloc/months/months_bloc.dart';
import 'package:dhyana/bloc/weeks/weeks_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/month.dart';
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
import 'package:intl/intl.dart';

import 'stats_bar_chart.dart';

class MonthsBarChartPage extends StatelessWidget {

  final int pageIndex;
  final StatsInterval statsInterval;

  final void Function(List<Month> months)? onMonthsLoaded;

  const MonthsBarChartPage({
    required this.pageIndex,
    required this.statsInterval,
    this.onMonthsLoaded,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MonthsBloc, MonthsState>(
      builder: (context, state) {
        switch (state) {
          case MonthsLoadingState():
            return buildLoadingState(context, state);
          case MonthsLoadingErrorState():
            return const SizedBox.shrink();
          case MonthsLoadedState():
            return buildLoadedState(context, state);
        }
      },
      listener: (context, state) {
        if (state is MonthsLoadedState) {
          onMonthsLoaded?.call(state.months);
        }
      },
      listenWhen: (previous, current) =>
        current is MonthsLoadedState && previous is! MonthsLoadedState,
    );
  }

  Widget buildLoadingState(BuildContext context, MonthsLoadingState state) {
    Duration difference = statsInterval.to.difference(statsInterval.from);
    int weeksCount = (difference.inDays / 7).ceil();
    return buildScaffolding(context,
      chart: StatsBarChart(
        key: ValueKey(pageIndex),
        barData: List.generate(weeksCount, (index) {
          DateTime day = statsInterval.from.add(Duration(days: index));
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

  Widget buildLoadedState(BuildContext context, MonthsLoadedState state) {
    return buildScaffolding(
      context,
      chart: StatsBarChart(
        key: ValueKey(pageIndex),
        barData: state.months.map((month) {
          return BarData(
              value: month.minutesCount.toDouble(),
              label: AppLocalizations.of(context).weekNumber(
                month.startDate.year,
                month.startDate.weekNumber,
              )
          );
        }).toList(),
        infoBuilderDelegate: (context, index) =>
          buildBarInfo(context, index, state),
      ),
      calculatedStats: CalculatedStatsView(
        calculatedStats: CalculatedStats.fromMonths(state.months),
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

  Widget buildBarInfo(BuildContext context, int index, MonthsState state) {
    Widget barInfo;
    switch (state) {
      case MonthsLoadingState():
        barInfo = buildBarInfoLoading(context, index);
        break;
      case MonthsLoadedState():
        barInfo = buildBarInfoFromMonths(context, index, state.months);
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
      ),
      mainText: AppLocalizations.of(context).statsLoadingData,
      postfix: AppLocalizations.of(context).pleaseWait,
    );
  }

  Widget buildBarInfoIdle(BuildContext context, List<Month> months) {
    final calculatedStats = CalculatedStats.fromMonths(months);
    return BarChartInfoTriggerBox(
      prefix: Text(createIntervalString(
        context,
        statsInterval.from,
        statsInterval.to,
      )),
      mainText: Text(
        Duration(
          minutes: calculatedStats.averageMinutes.toInt()
        ).toFormattedString(context)
      ),
      postfix: Text(AppLocalizations.of(context).averagePerDay.toLowerCase()),
    );
  }

  Widget buildBarInfoFromMonths(
      BuildContext context,
      int index,
      List<Month> months
      ) {
    if (index < 0) {
      return buildBarInfoIdle(context, months);
    } else {
      final day = months[index];
      return UnconstrainedBox(
        child: BarChartInfoTriggerBox(
          prefix: Text(
              DateFormat.yMMMMEEEEd(
                  Localizations.localeOf(context).toString()
              ).format(day.startDate)
          ),
          mainText: Text(
              Duration(minutes: day.minutesCount).toFormattedString(context)
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
                    Text(day.sessionCount.toString()),
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



