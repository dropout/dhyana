import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/widget/util/app_context.dart';

class DaysTab extends StatefulWidget {

  final Profile profile;

  const DaysTab({
    required this.profile,
    super.key,
  });

  @override
  State<DaysTab> createState() => DaysTabState();
}

class DaysTabState extends State<DaysTab> {

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: SizedBox(
            height: 540,
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
                  child: DaysBarChartPage(
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
      ],
    );
  }

}
