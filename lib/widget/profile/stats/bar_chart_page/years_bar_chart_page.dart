import 'package:bar_chart/bar_chart.dart';
import 'package:dhyana/bloc/years/years_cubit.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/model/year.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class YearsBarChartPage extends StatelessWidget {

  final int pageIndex;
  final StatsInterval statsInterval;

  final void Function(List<Year> months)? onYearsLoaded;

  const YearsBarChartPage({
    required this.pageIndex,
    required this.statsInterval,
    this.onYearsLoaded,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<YearsCubit, YearsState>(
      builder: (context, state) {
        switch (state) {
          case YearsLoadingState():
            return buildLoadingState(context, state);
          case YearsLoadingErrorState():
            return BarChartPageError();
          case YearsLoadedState():
            return buildLoadedState(context, state);
        }
      },
      listener: (context, state) {
        if (state is YearsLoadedState) {
          onYearsLoaded?.call(state.years);
        }
      },
      listenWhen: (previous, current) =>
      current is YearsLoadedState && previous is! YearsLoadedState,
    );
  }

  Widget buildLoadingState(BuildContext context, YearsLoadingState state) {
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

  Widget buildLoadedState(BuildContext context, YearsLoadedState state) {
    return buildScaffolding(
      context,
      chart: StatsBarChart(
        key: ValueKey(pageIndex),
        barData: state.years.map((year) {
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
        calculatedStats: CalculatedStats.fromYears(state.years),
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

  Widget buildBarInfo(BuildContext context, int index, YearsState state) {
    Widget barInfo;
    switch (state) {
      case YearsLoadingState():
        barInfo = buildBarInfoLoading(context, index);
        break;
      case YearsLoadedState():
        barInfo = buildBarInfoFromYears(context, index, state.years);
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

  Widget buildBarInfoIdle(BuildContext context, List<Year> years) {
    final calculatedStats = CalculatedStats.fromYears(years);
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
      List<Year> years
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
