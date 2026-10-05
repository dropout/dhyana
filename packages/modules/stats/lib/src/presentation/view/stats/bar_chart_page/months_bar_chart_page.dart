import 'package:bar_chart/bar_chart.dart';
import 'package:core/core.dart';
import 'package:stats/l10n/stats_localizations.dart';
import 'package:stats/src/stats_module.dart';
import 'package:stats/src/presentation/viewmodel/stats_bucket_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bar_chart_error_page.dart';
import 'bar_chart_info_trigger_box.dart';
import 'calculated_stats_view.dart';
import 'stats_bar_chart.dart';


class MonthsBarChartPage extends StatelessWidget {

  final int pageIndex;
  final StatsInterval statsInterval;

  final void Function(List<MonthStatsBucket> months)? onMonthsLoaded;

  const MonthsBarChartPage({
    required this.pageIndex,
    required this.statsInterval,
    this.onMonthsLoaded,
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
          onMonthsLoaded?.call(state.buckets.map((b) => switch(b) {
            MonthStatsBucket month => month,
            _ => throw Exception('Unexpected bucket type'),
          }).toList());
        }
      },
      listenWhen: (previous, current) =>
        current is StatsBucketLoadedState && previous is! StatsBucketLoadedState,
    );
  }

  Widget buildLoadingState(BuildContext context, StatsBucketLoadingState state) {
    int monthsCount = DateUtils.monthDelta(
      statsInterval.from,
      statsInterval.to
    );
    return buildScaffolding(context,
      chart: StatsBarChart(
        key: ValueKey(pageIndex),
        barData: List.generate(monthsCount, (index) {
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
        barData: state.buckets.map((month) {
          return BarData(
            value: month.minutesCount.toDouble(),
            label: DateFormat.yMMM(
              Localizations.localeOf(context).toString()
            ).format(month.startDate).toUpperCase(),
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
        barInfo = buildBarInfoFromMonths(context, index, state.buckets.map((b) => switch(b) {
          MonthStatsBucket() => b,
          _ => null
        }).whereType<MonthStatsBucket>().toList());
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
      mainText: StatsLocalizations.of(context).statsLoadingData,
      postfix: StatsLocalizations.of(context).pleaseWait,
    );
  }

  Widget buildBarInfoIdle(BuildContext context, List<MonthStatsBucket> months) {
    final calculatedStats = CalculatedStats.fromStatsBuckets(months);
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
      postfix: Text(StatsLocalizations.of(context).averagePerMonth.toLowerCase()),
    );
  }

  Widget buildBarInfoFromMonths(
      BuildContext context,
      int index,
      List<MonthStatsBucket> months
      ) {
    if (index < 0) {
      return buildBarInfoIdle(context, months);
    } else {
      final month = months[index];
      return UnconstrainedBox(
        child: BarChartInfoTriggerBox(
          prefix: Text(
            DateFormat.yMMMM(
              Localizations.localeOf(context).toString()
            ).format(month.startDate),
          ),
          mainText: Text(
            Duration(minutes: month.minutesCount).toFormattedLocalizedString(context)
          ),
          postfix: Padding(
            padding: EdgeInsets.only(top: DesignSpec.paddingXs),
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
                    Text(month.sessionCount.toString()),
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



