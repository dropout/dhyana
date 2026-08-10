import 'package:bar_chart/bar_chart.dart';
import 'package:dhyana/modules/stats/presentation/viewmodel/stats_bucket_cubit.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/modules/stats/domain/entity/calculated_stats.dart';
import 'package:dhyana/modules/stats/domain/entity/stats_interval.dart';
import 'package:dhyana/core/util/date_time_utils.dart';
import 'package:dhyana/core/util/duration.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/view/util/gap.dart';
import 'package:dhyana/modules/stats/public/model/stats_bucket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bar_chart_error_page.dart';
import 'bar_chart_info_trigger_box.dart';
import 'calculated_stats_view.dart';
import 'stats_bar_chart.dart';


class YearsBarChartPage extends StatelessWidget {

  final int pageIndex;
  final StatsInterval statsInterval;

  final void Function(List<YearStatsBucket> months)? onYearsLoaded;

  const YearsBarChartPage({
    required this.pageIndex,
    required this.statsInterval,
    this.onYearsLoaded,
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
          onYearsLoaded?.call(state.buckets.map((bucket) => switch(bucket) {
            YearStatsBucket() => bucket,
            _ => throw Exception('Unexpected bucket type: ${bucket.runtimeType}'),
          }).toList());
        }
      },
      listenWhen: (previous, current) =>
      current is StatsBucketLoadedState && previous is! StatsBucketLoadedState,
    );
  }

  Widget buildLoadingState(BuildContext context, StatsBucketLoadingState state) {
    int yearsCount = statsInterval.to.year - statsInterval.from.year;
    return buildScaffolding(context,
      chart: StatsBarChart(
        key: ValueKey(pageIndex),
        barData: List.generate(yearsCount, (index) {
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
        barData: state.buckets.map((year) {
          return BarData(
            value: year.minutesCount.toDouble(),
            label: DateFormat.y(
              Localizations.localeOf(context).toString()
            ).format(year.startDate).toUpperCase(),
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
        barInfo = buildBarInfoFromYears(context, index, state.buckets);
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

  Widget buildBarInfoIdle(BuildContext context, List<StatsBucket> years) {
    final calculatedStats = CalculatedStats.fromStatsBuckets(years);
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
      postfix: Text(AppLocalizations.of(context).averagePerYear.toLowerCase()),
    );
  }

  Widget buildBarInfoFromYears(
      BuildContext context,
      int index,
      List<StatsBucket> years
      ) {
    if (index < 0) {
      return buildBarInfoIdle(context, years);
    } else {
      final year = years[index];
      return UnconstrainedBox(
        child: BarChartInfoTriggerBox(
          prefix: Text(
            DateFormat.y(
              Localizations.localeOf(context).toString()
            ).format(year.startDate),
          ),
          mainText: Text(
            Duration(minutes: year.minutesCount).toFormattedLocalizedString(context)
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
                    Text(year.sessionCount.toString()),
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
