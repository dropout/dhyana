import 'package:dhyana/modules/stats/stats_module.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/bar_chart_page/weeks_bar_chart_page.dart';
import 'package:dhyana/modules/stats/presentation/viewmodel/stats_bucket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class WeekTab extends StatefulWidget {

  final String profileId;

  const WeekTab({
    required this.profileId,
    super.key,
  });

  @override
  State<WeekTab> createState() => WeekTabState();
}

class WeekTabState extends State<WeekTab> {

  // Intervals
  late final List<StatsInterval> intervals;

  // Calculated stats
  List<WeekStatsBucket> weeks = [];
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
                    calculatedStats = CalculatedStats.fromStatsBuckets(weeks);
                  });
                },
                itemBuilder: (context, index) {
                  return BlocProvider<StatsBucketCubit>(
                    create: (BuildContext context) {
                      return GetIt.I.get<StatsBucketCubit>()..query(
                        profileId: widget.profileId,
                        from: intervals[index].from,
                        to: intervals[index].to,
                        granularity: .weeks,
                      );
                    },
                    child: WeeksBarChartPage(
                      pageIndex: index,
                      statsInterval: intervals[index],
                      onWeeksLoaded: (List<WeekStatsBucket> loadedWeeks) {
                        setState(() {
                          weeks = loadedWeeks;
                          calculatedStats ??= CalculatedStats.fromStatsBuckets(weeks);
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
