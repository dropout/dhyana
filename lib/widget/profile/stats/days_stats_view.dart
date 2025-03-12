
import 'package:dhyana/enum/all.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/bloc/stats_interval/stats_interval_bloc.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';

import 'calculated_stats_view.dart';

class DaysStatsView extends StatefulWidget {

  final Profile profile;

  const DaysStatsView({
    required this.profile,
    super.key,
  });

  @override
  State<DaysStatsView> createState() => _DaysStatsViewState();
}

class _DaysStatsViewState extends State<DaysStatsView> {

  int _currentPageIndex = 0;

  late final List<StatsInterval> intervals;
  late StatsInterval selectedInterval;

  // Overlay
  OverlayEntry? overlayEntry;
  Day? selectedData;

  // For calculated stats
  List<Day> days = [];
  CalculatedStats? calculatedStats;

  @override
  void initState() {
    intervals = StatsInterval.generateDayIntervals(DateTime.now());
    selectedInterval = intervals[0];
    // BlocProvider.of is safe to use in initState
    // https://github.com/felangel/bloc/issues/210
    BlocProvider.of<StatsIntervalBloc>(context).add(
      StatsIntervalEvent.changed(
        statsInterval: selectedInterval
      )
    );
    super.initState();
  }

  void handlePageChange(BuildContext context, int index) {
    StatsIntervalBloc bloc = BlocProvider.of<StatsIntervalBloc>(context);
    StatsInterval statsInterval = bloc.state.statsInterval;

    setState(() {
      _currentPageIndex = index;
      BlocProvider.of<StatsIntervalBloc>(context).add(StatsIntervalEvent.changed(
        statsInterval: statsInterval.copyWith(
          from: intervals[index].from,
          to: intervals[index].to,
        )
      ));
    });
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
                  onPageChanged: (index) => handlePageChange(context, index),
                  itemBuilder: (context, index) {
                    return BlocBuilder<StatsIntervalBloc, StatsIntervalState>(
                      builder: (context, statsIntervalState) {
                        return BlocProvider<DaysBloc>(
                          create: (BuildContext context) {
                            return DaysBloc(
                                statisticsRepository: context.repos.statisticsRepository,
                                crashlyticsService: context.services.crashlyticsService
                            )..add(DaysEvent.queryDays(
                              profileId: widget.profile.id,
                              from: selectedInterval.from,
                              to: selectedInterval.to,
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
                      }
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
      return const CalculatedStatsView(
        calculatedStats: CalculatedStats() // empty
      );
    } else {
      return CalculatedStatsView(calculatedStats: calculatedStats!);
    }
  }

  void showOverlay(BuildContext context, Day data) {
    setState(() {
      selectedData = data;
      overlayEntry = OverlayEntry(
        builder: (context) => DaysOverlay(day: selectedData!),
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

}
