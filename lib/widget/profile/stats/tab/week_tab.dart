
import 'package:dhyana/bloc/weeks/weeks_bloc.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/widget/profile/stats/bar_chart_page/weeks_bar_chart_page.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeekTab extends StatefulWidget {

  final Profile profile;

  const WeekTab({
    required this.profile,
    super.key,
  });

  @override
  State<WeekTab> createState() => WeekTabState();
}

class WeekTabState extends State<WeekTab> {

  // Intervals
  late final List<StatsInterval> intervals;

  // Calculated stats
  List<Week> weeks = [];
  CalculatedStats? calculatedStats;

  @override
  void initState() {
    intervals = StatsInterval.generateWeekIntervals(DateTime.now());
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
                    calculatedStats = CalculatedStats.fromWeeks(weeks);
                  });
                },
                itemBuilder: (context, index) {
                  return BlocProvider<WeeksBloc>(
                    create: (BuildContext context) {
                      return WeeksBloc(
                        statisticsRepository: context.repos.statisticsRepository,
                        crashlyticsService: context.services.crashlyticsService
                      )..add(WeeksEvent.queryWeeks(
                        profileId: widget.profile.id,
                        from: intervals[index].from,
                        to: intervals[index].to,
                      ));
                    },
                    child: WeeksBarChartPage(
                      pageIndex: index,
                      statsInterval: intervals[index],
                      onWeeksLoaded: (List<Week> loadedWeeks) {
                        setState(() {
                          weeks = loadedWeeks;
                          calculatedStats ??= CalculatedStats.fromWeeks(weeks);
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
