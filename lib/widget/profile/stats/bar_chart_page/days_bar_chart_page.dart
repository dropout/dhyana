import 'package:bar_chart/bar_chart.dart';
import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class DaysBarChartPage extends StatelessWidget {

  final int pageIndex;
  final StatsInterval statsInterval;

  final void Function(List<Day> days)? onDaysLoaded;

  const DaysBarChartPage({
    required this.pageIndex,
    required this.statsInterval,
    this.onDaysLoaded,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DaysBloc, DaysState>(
      builder: (context, state) {
        switch (state) {
          case DaysLoadingState():
            return buildLoadingState(context, state);
          case DaysLoadingErrorState():
            return BarChartPageError();
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

  Widget buildLoadingState(BuildContext context, DaysLoadingState state) {
    Duration difference = statsInterval.from.difference(statsInterval.to);
    return buildScaffolding(context,
      chart: StatsBarChart(
        key: ValueKey(pageIndex),
        barData: List.generate(difference.inDays.abs(), (index) {
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

  Widget buildLoadedState(BuildContext context, DaysLoadedState state) {
    return buildScaffolding(
      context,
      chart: StatsBarChart(
        key: ValueKey(pageIndex),
        barData: state.days.map((day) {
          return BarData(
            value: day.minutesCount.toDouble(),
            label: DateFormat.E(
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

  Widget buildBarInfo(BuildContext context, int index, DaysState state) {
    Widget barInfo;
    switch (state) {
      case DaysLoadingState():
        barInfo = buildBarInfoLoading(context, index);
        break;
      case DaysLoadedState():
        barInfo = buildBarInfoFromDays(context, index, state.days);
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

  Widget buildBarInfoIdle(BuildContext context, List<Day> days) {
    final calculatedStats = CalculatedStats.fromDays(days);
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
        ).toFormattedString(context),
      ),
      postfix: Text(AppLocalizations.of(context).averagePerDay.toLowerCase()),
    );
  }

  Widget buildBarInfoFromDays(
    BuildContext context,
    int index,
    List<Day> days
  ) {
    if (index < 0) {
      return buildBarInfoIdle(context, days);
    } else {
      final day = days[index];
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
                Gap.small(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Circle shape
                        color: AppColors.backgroundPaperLight,
                      ),
                      child: Icon(
                        Icons.link_rounded,
                        size: 18,
                      ),
                    ),
                    Gap.xs(),
                    Text(day.consecutiveDaysCount.toString()),
                  ],
                )
              ],
            ),
          ),

        ),
      );
    }
  }

}



