import 'dart:async';

import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/bloc/stats_interval/stats_interval_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/util/all.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:bar_chart/bar_chart.dart';

import 'calculated_stats_view.dart';

class DaysStatsView extends StatelessWidget {

  final Profile profile;

  const DaysStatsView({
    required this.profile,
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
    StatsIntervalBloc statsIntervalBloc = BlocProvider.of<StatsIntervalBloc>(context);
    return DaysStatsViewContent(
      profile: profile,
      statsIntervalBloc: statsIntervalBloc,
    );
  }
}

class DaysStatsViewContent extends StatefulWidget {

  final Profile profile;
  final StatsIntervalBloc statsIntervalBloc;

  const DaysStatsViewContent({
    required this.profile,
    required this.statsIntervalBloc,
    super.key,
  });

  @override
  State<DaysStatsViewContent> createState() => _DaysStatsViewContentState();
}

class _DaysStatsViewContentState extends State<DaysStatsViewContent> {

  // PageView barchart swipe direction helper
  int _lastIndex = 0;

  // Overlay
  OverlayEntry? overlayEntry;
  Day? selectedData;

  // For calculated stats
  List<Day> days = [];
  CalculatedStats? calculatedStats;

  @override
  void initState() {
    super.initState();
  }

  void _swipeRight(BuildContext context) {
    StatsIntervalBloc bloc = BlocProvider.of<StatsIntervalBloc>(context);
    StatsInterval statsInterval = bloc.state.statsInterval;
    bloc.add(StatsIntervalEvent.changed(
      statsInterval: statsInterval.copyWith(
        from: statsInterval.from.subtract(Duration(days: statsInterval.intervalType.intervalInDays)),
        to: statsInterval.to.subtract(Duration(days: statsInterval.intervalType.intervalInDays)),
      )
    ));
  }

  void _swipeLeft(BuildContext context) {
    StatsIntervalBloc bloc = BlocProvider.of<StatsIntervalBloc>(context);
    StatsInterval statsInterval = bloc.state.statsInterval;
    bloc.add(StatsIntervalEvent.changed(
      statsInterval: statsInterval.copyWith(
        from: statsInterval.from.add(Duration(days: statsInterval.intervalType.intervalInDays)),
        to: statsInterval.to.add(Duration(days: statsInterval.intervalType.intervalInDays)),
      )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        // padding: const EdgeInsets.all(AppThemeData.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: SizedBox(
                height: 296,
                child: PageView.builder(
                  reverse: true,
                  itemCount: 4,
                  onPageChanged: (index) {
                    if (index > _lastIndex) {
                      _swipeRight(context);
                    } else {
                      _swipeLeft(context);
                    }
                    setState(() {
                      _lastIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return BlocProvider<DaysBloc>(
                      create: (BuildContext context) {
                        return DaysBloc(
                          statisticsRepository: context.repos.statisticsRepository,
                          crashlyticsService: context.services.crashlyticsService
                        )..add(DaysEvent.queryDays(
                          profileId: widget.profile.id,
                          from: widget.statsIntervalBloc.state.statsInterval.from,
                          to: widget.statsIntervalBloc.state.statsInterval.to,
                        ));
                      },
                      child: DaysStatsBarChartPage(
                        pageIndex: index,
                        onInfoTriggered: (index, day) {
                          showOverlay(context, day);
                        },
                        onInfoChanged: (index, day) {
                          updateOverlay(context, day);
                        },
                        onInfoDismissed: (index, day) {
                          hideOverlay(context);
                        },
                        onDaysLoaded: (List<Day> loadedDays) {
                          setState(() {
                            days = loadedDays;
                            calculatedStats = CalculatedStats.fromDays(days);
                          });
                        },
                      ),
                    );
                  },
                ),
              )
            ),
            Gap.medium(),
            Padding(
              padding: const EdgeInsets.all(AppThemeData.spacingMd),
              child: buildCalculatedStats(context),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCalculatedStats(BuildContext context) {
    if (calculatedStats == null) {
      return const SizedBox.shrink();
    }

    if (days.isEmpty) {
      return CalculatedStatsView(calculatedStats: const CalculatedStats(
        totalMinutes: 0,
        totalSessions: 0,
        averageMinutes: 0,
        averageSessions: 0,
      ));
    } else {
      return CalculatedStatsView(calculatedStats: calculatedStats!);
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
    super.dispose();
  }

}
