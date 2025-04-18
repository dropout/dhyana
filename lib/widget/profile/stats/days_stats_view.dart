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

  // Intervals
  late final List<StatsInterval> intervals;

  // Calculated stats
  List<Day> days = [];
  CalculatedStats? calculatedStats;

  @override
  void initState() {
    intervals = StatsInterval.generateDayIntervals(DateTime.now());
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
                height: 420,
                child: PageView.builder(
                  reverse: true,
                  itemCount: 4,
                  onPageChanged: (index) {
                    setState(() {
                      calculatedStats = CalculatedStats.fromDays(days);
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
                          from: intervals[index].from,
                          to: intervals[index].to,
                        ));
                      },
                      child: DaysStatsBarChartPage(
                        pageIndex: index,
                        statsInterval: intervals[index],
                        onDaysLoaded: (List<Day> loadedDays) {
                          setState(() {
                            days = loadedDays;
                            calculatedStats ??= CalculatedStats.fromDays(loadedDays);
                          });
                        },
                      ),
                    );
                  },
                ),
              )
            ),
            // DecoratedBox(
            //   decoration: BoxDecoration(
            //     color: Colors.black,
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(
            //       AppThemeData.spacingMd
            //     ),
            //     child: buildCalculatedStats(context),
            //   ),
            // )
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
      return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: CalculatedStatsView(
            calculatedStats: CalculatedStats()
        )
      );
      return const CalculatedStatsView(
        calculatedStats: CalculatedStats()
      );
    } else {
      return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: CalculatedStatsView(
            calculatedStats: calculatedStats!
          )
      );
    }
  }

}
