import 'dart:async';

import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/bloc/stats_interval/stats_interval_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:bar_chart/bar_chart.dart';

import 'calculated_stats_view.dart';

class DaysStatsView extends StatelessWidget {

  final Profile profile;
  final StatsIntervalBloc statsIntervalBloc;

  const DaysStatsView({
    required this.profile,
    required this.statsIntervalBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DaysBloc>(
      create: (BuildContext context) {
        return DaysBloc(
          statisticsRepository: context.repos.statisticsRepository,
          crashlyticsService: context.services.crashlyticsService
        );
      },
      child: DaysStatsViewContentBuilder(
        profile: profile,
      ),
    );
  }

}

class DaysStatsViewContentBuilder extends StatelessWidget {

  final Profile profile;

  const DaysStatsViewContentBuilder({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    DaysBloc daysBloc = BlocProvider.of<DaysBloc>(context);
    StatsIntervalBloc statsIntervalBloc = BlocProvider.of<StatsIntervalBloc>(context);
    return DaysStatsViewContent(
      profile: profile,
      daysBloc: daysBloc,
      statsIntervalBloc: statsIntervalBloc,
    );
  }
}

class DaysStatsViewContent extends StatefulWidget {

  final Profile profile;
  final DaysBloc daysBloc;
  final StatsIntervalBloc statsIntervalBloc;

  const DaysStatsViewContent({
    required this.profile,
    required this.daysBloc,
    required this.statsIntervalBloc,
    super.key,
  });

  @override
  State<DaysStatsViewContent> createState() => _DaysStatsViewContentState();
}

class _DaysStatsViewContentState extends State<DaysStatsViewContent> {

  bool isLoading = true;

  // Overlay
  OverlayEntry? overlayEntry;
  Day? selectedData;

  StreamSubscription<DaysState>? _daysBlocSubscription;
  StreamSubscription<StatsIntervalState>? _statsIntervalBlocSubscription;

  @override
  void initState() {

    widget.daysBloc.add(
      DaysEvent.queryDays(
        profileId: widget.profile.id,
        from: widget.statsIntervalBloc.state.statsInterval.from,
        to: widget.statsIntervalBloc.state.statsInterval.to,
      )
    );

    _statsIntervalBlocSubscription = widget.statsIntervalBloc.stream.listen((StatsIntervalState state) {
      widget.daysBloc.add(
        DaysEvent.queryDays(
          profileId: widget.profile.id,
          from: widget.statsIntervalBloc.state.statsInterval.from,
          to: widget.statsIntervalBloc.state.statsInterval.to,
        )
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(AppThemeData.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 350,
              child: BlocBuilder<DaysBloc, DaysState>(
                builder: (context, state) {
                  if (state is DaysLoadedState) {
                    List<BarData> barData = state.days.map((day) {
                      return BarData(
                        value: day.minutesCount.toDouble(),
                        label: DateFormat.E(Localizations.localeOf(context).toString()).format(day.startDate).substring(0,1),
                      );
                    }).toList();
                    return BarChart(
                      dataSource: barData,
                      displayRangeSetter: (max) => 100,
                      yAxisIntervalSetter: (dataSource) {
                        return 10.0;
                      },
                      barBuilder: (context, barChartContext) {
                        return InfoTriggerBars(
                          barChartContext: barChartContext,
                          onInfoTriggered: (index, data) {
                            showOverlay(context, state.days[index]);
                            print('onInfoTriggered: $data');
                          },
                          onInfoChanged: (index, data) {
                            updateOverlay(context, state.days[index]);
                            print('onInfoChanged: $data');
                          },
                          onInfoDismissed: (index, data) {
                            hideOverlay(context);
                            print('onInfoDismissed $data');
                          },

                        );

                        // return Row(
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        //     for (var i = 0; i < barChartData.length; i++)
                        //       Expanded(
                        //           child: Padding(
                        //               padding: EdgeInsets.symmetric(horizontal: 1),
                        //               child: FractionallySizedBox(
                        //                 heightFactor: math.min(
                        //                   barChartData[i].value / barChartContext.displayRange,
                        //                   1.0,
                        //                 ),
                        //                 child: DecoratedBox(
                        //                   decoration: BoxDecoration(
                        //                     color: Colors.white,
                        //                   ),
                        //                 ),
                        //               )
                        //           )
                        //       )
                        //   ],
                        // );


                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            Gap.medium(),
            buildCalculatedStats(context),
          ],
        ),
      ),
    );
  }

  Widget buildCalculatedStats(BuildContext context) {
    if (isLoading) {
      return CalculatedStatsView(calculatedStats: const CalculatedStats(
        totalMinutes: 0,
        totalSessions: 0,
        averageMinutes: 0,
        averageSessions: 0,
      ));
    } else {
      DaysLoadedState daysLoadedState = widget.daysBloc.state as DaysLoadedState;
      CalculatedStats calculatedStats = daysLoadedState.calculatedStats;
      return CalculatedStatsView(calculatedStats: calculatedStats);
    }
  }

  void showOverlay(BuildContext context, Day data) {
    setState(() {
      selectedData = data;
      overlayEntry = OverlayEntry(
        builder: (context) => overlayEntryBuilder(context, data),
      );
      Overlay.of(context).insert(overlayEntry!);
    });
  }

  void updateOverlay(BuildContext context, Day data) {
    setState(() {
      selectedData = data;
    });
    overlayEntry?.markNeedsBuild();
  }

  void hideOverlay(BuildContext context) {
    if (overlayEntry != null && overlayEntry!.mounted) {
      overlayEntry?.remove();
      overlayEntry = null;
    }
  }

  Widget overlayEntryBuilder(BuildContext context, Day data) {
    if (selectedData == null) {
      return SizedBox.shrink();
    }

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppThemeData.borderRadiusMd),
                ),
                color: AppColors.backgroundPaperLight,
                child: Padding(
                  padding: const EdgeInsets.all(AppThemeData.paddingMd),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateFormat.yMMMMEEEEd(Localizations.localeOf(context).toString()).format(selectedData!.startDate),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap.small(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                selectedData!.sessionCount.toString(),
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap.small(),
                              Text(
                                'Sessions'.toUpperCase(),
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                selectedData!.minutesCount.toString(),
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap.small(),
                              Text(
                                'Minutes'.toUpperCase(),
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                selectedData!.consecutiveDaysCount.toString(),
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap.small(),
                              Text(
                                'Consecutive days'.toUpperCase(),
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )

                        ],
                      ),

                      // Text(
                      //   'Minutes: ${selectedData!.minutesCount}',
                      //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      //     color: Colors.black,
                      //   ),
                      // ),
                      // Gap.small(),
                      // Text(
                      //   'Sessions: ${selectedData!.sessionCount}',
                      //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      //     color: Colors.black,
                      //   ),
                      // ),
                      // Gap.small(),
                      // Text(
                      //   'Consecutive days count: ${selectedData!.minutesCount}',
                      //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      //     color: Colors.black,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            )


          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _daysBlocSubscription?.cancel();
    _statsIntervalBlocSubscription?.cancel();
    super.dispose();
  }



}
