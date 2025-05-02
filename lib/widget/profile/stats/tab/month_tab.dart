
import 'package:dhyana/bloc/months/months_bloc.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/widget/profile/stats/bar_chart_page/months_bar_chart_page.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonthTab extends StatefulWidget {

  final Profile profile;

  const MonthTab({
    required this.profile,
    super.key,
  });

  @override
  State<MonthTab> createState() => _MonthTabState();
}

class _MonthTabState extends State<MonthTab> {

  // Intervals
  late final List<StatsInterval> intervals;

  // Calculated stats
  List<Month> months = [];
  CalculatedStats? calculatedStats;

  @override
  void initState() {
    intervals = StatsInterval.generateMonthIntervals(DateTime.now());
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
                    calculatedStats = CalculatedStats.fromMonths(months);
                  });
                },
                itemBuilder: (context, index) {
                  return BlocProvider<MonthsBloc>(
                    create: (BuildContext context) {
                      return MonthsBloc(
                          statisticsRepository: context.repos.statisticsRepository,
                          crashlyticsService: context.services.crashlyticsService
                      )..add(MonthsEvent.queryMonths(
                        profileId: widget.profile.id,
                        from: intervals[index].from,
                        to: intervals[index].to,
                      ));
                    },
                    child: MonthsBarChartPage(
                      pageIndex: index,
                      statsInterval: intervals[index],
                      onMonthsLoaded: (List<Month> loadedMonths) {
                        setState(() {
                          months = loadedMonths;
                          calculatedStats ??= CalculatedStats.fromMonths(months);
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
