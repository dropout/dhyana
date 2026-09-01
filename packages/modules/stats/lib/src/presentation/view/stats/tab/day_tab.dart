import 'package:stats/src/presentation/view/stats/bar_chart_page/days_bar_chart_page.dart';
import 'package:stats/src/presentation/viewmodel/stats_bucket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stats/src/stats_module.dart';
import 'package:get_it/get_it.dart';

class DaysTab extends StatefulWidget {
  final String profileId;

  const DaysTab({
    required this.profileId, super.key
  });

  @override
  State<DaysTab> createState() => DaysTabState();
}

class DaysTabState extends State<DaysTab> {
  // Intervals
  late final List<StatsInterval> intervals;

  // Calculated stats
  List<DayStatsBucket> days = [];
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
          decoration: BoxDecoration(color: Colors.black),
          child: SizedBox(
            height: 540,
            child: PageView.builder(
              reverse: true,
              itemCount: 4,
              onPageChanged: (index) {
                setState(() {
                  calculatedStats = CalculatedStats.fromStatsBuckets(days);
                });
              },
              itemBuilder: (context, index) {
                return BlocProvider<StatsBucketCubit>(
                  create: (BuildContext context) {
                    return GetIt.I.get<StatsBucketCubit>()..query(
                      profileId: widget.profileId,
                      from: intervals[index].from,
                      to: intervals[index].to,
                      granularity: .days,
                    );
                  },
                  child: DaysBarChartPage(
                    pageIndex: index,
                    statsInterval: intervals[index],
                    onDaysLoaded: (List<DayStatsBucket> loadedDays) {
                      setState(() {
                        days = loadedDays;
                        calculatedStats ??= CalculatedStats.fromStatsBuckets(
                          loadedDays,
                        );
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
