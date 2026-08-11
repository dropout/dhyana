import 'package:dhyana/modules/stats/presentation/viewmodel/stats_bucket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bar_chart/bar_chart.dart';

import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/modules/stats/stats_module.dart';
import 'package:dhyana/core/util/date_time_utils.dart';
import 'package:dhyana/core/util/duration.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/bar_chart_page/bar_chart_error_page.dart';
import 'package:dhyana/core/presentation/view/util/gap.dart';

import 'bar_chart_info_trigger_box.dart';
import 'calculated_stats_view.dart';
import 'stats_bar_chart.dart';


class WeeksBarChartPage extends StatelessWidget {

  final int pageIndex;
  final StatsInterval statsInterval;

  final void Function(List<WeekStatsBucket> weeks)? onWeeksLoaded;

  const WeeksBarChartPage({
    required this.pageIndex,
    required this.statsInterval,
    this.onWeeksLoaded,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StatsBucketCubit, StatsBucketState>(
      builder: (context, state) {
        switch (state) {
          case StatsBucketLoadingState():
            return buildLoadingState(context, state);
          case StatsBucketLoadingErrorState():
            return BarChartPageError();
          case StatsBucketLoadedState():
            return buildLoadedState(context, state);
        }
      },
      listener: (context, state) {
        if (state is StatsBucketLoadedState) {
          onWeeksLoaded?.call(state.buckets.map((b) => switch(b) {
            WeekStatsBucket week => week,
            _ => throw Exception('Unexpected bucket type'),
          }).toList());
        }
      },
      listenWhen: (previous, current) =>
        current is StatsBucketLoadedState && previous is! StatsBucketLoadedState,
    );
  }

  Widget buildLoadingState(BuildContext context, StatsBucketLoadingState state) {
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

  Widget buildLoadedState(BuildContext context, StatsBucketLoadedState state) {
    return buildScaffolding(
      context,
      chart: StatsBarChart(
        key: ValueKey(pageIndex),
        barData: state.buckets.map((week) {
          return BarData(
            value: week.minutesCount.toDouble(),
            label: getWeekLabel(context, week),
          );
        }).toList(),
        infoBuilderDelegate: (context, index) =>
          buildBarInfo(context, index, state),
      ),
      calculatedStats: CalculatedStatsView(
        calculatedStats: CalculatedStats.fromStatsBuckets(state.buckets),
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
                left: DesignSpec.paddingLg,
                right: DesignSpec.paddingXl + 32,
              ),
              child: calculatedStats,
            )
        ),
      ],
    );
  }

  Widget buildBarInfo(BuildContext context, int index, StatsBucketState state) {
    Widget barInfo;
    switch (state) {
      case StatsBucketLoadingState():
        barInfo = buildBarInfoLoading(context, index);
        break;
      case StatsBucketLoadedState():
        barInfo = buildBarInfoFromWeeks(context, index, state.buckets.map((b) => switch(b) {
          WeekStatsBucket week => week,
          _ => throw Exception('Unexpected bucket type'),
        }).toList());
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

  Widget buildBarInfoIdle(BuildContext context, List<WeekStatsBucket> weeks) {
    final calculatedStats = CalculatedStats.fromStatsBuckets(weeks);
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
        ).toFormattedLocalizedString(context)
      ),
      postfix: Text(AppLocalizations.of(context).averagePerWeek.toLowerCase()),
    );
  }

  Widget buildBarInfoFromWeeks(
      BuildContext context,
      int index,
      List<WeekStatsBucket> weeks
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
            Duration(minutes: week.minutesCount).toFormattedLocalizedString(context)
          ),
          postfix: Padding(
            padding: const EdgeInsets.only(top: DesignSpec.paddingXs),
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

  // This is a workaround for the case when:
  // - the week starts in December
  // - the week considered first week according to ISO standards
  // (considered first week if the week contains the first Thursday of the year)
  String getWeekLabel(BuildContext context, StatsBucket week) {
    if (week.startDate.weekNumber == 1 && week.startDate.month == 12) {
      return AppLocalizations.of(context).weekNumber(
        week.startDate.year + 1,
        week.startDate.weekNumber,
      );
    } else {
      return  AppLocalizations.of(context).weekNumber(
        week.startDate.year,
        week.startDate.weekNumber,
      );
    }
  }

}



