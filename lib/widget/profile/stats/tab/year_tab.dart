
import 'package:dhyana/bloc/years/years_cubit.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/widget/profile/stats/bar_chart_page/years_bar_chart_page.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YearTab extends StatefulWidget {

  final Profile profile;

  const YearTab({
    required this.profile,
    super.key,
  });

  @override
  State<YearTab> createState() => YearTabState();
}

class YearTabState extends State<YearTab> {

  // Intervals
  late final List<StatsInterval> intervals;

  // Calculated stats
  List<Year> years = [];
  CalculatedStats? calculatedStats;

  @override
  void initState() {
    intervals = StatsInterval.generateYearIntervals(DateTime.now());
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
                    calculatedStats = CalculatedStats.fromYears(years);
                  });
                },
                itemBuilder: (context, index) {
                  return BlocProvider<YearsCubit>(
                    create: (BuildContext context) {
                      return YearsCubit(
                        statisticsRepository: context.repos.statisticsRepository,
                        crashlyticsService: context.services.crashlyticsService
                      )..queryYears(
                        widget.profile.id,
                        intervals[index].from,
                        to: intervals[index].to,
                      );
                    },
                    child: YearsBarChartPage(
                      pageIndex: index,
                      statsInterval: intervals[index],
                      onYearsLoaded: (List<Year> loadedYears) {
                        setState(() {
                          years = loadedYears;
                          calculatedStats ??= CalculatedStats.fromYears(years);
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
