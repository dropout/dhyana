import 'package:dhyana/modules/insights/domain/entity/calculated_stats.dart';
import 'package:dhyana/modules/insights/presentation/viewmodel/stats_bucket_cubit.dart';
import 'package:dhyana/modules/insights/public/model/stats_bucket.dart';
import 'package:dhyana/modules/insights/domain/entity/stats_interval.dart';
import 'package:dhyana/modules/insights/presentation/view/stats/bar_chart_page/months_bar_chart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MonthTab extends StatefulWidget {

  final String profileId;

  const MonthTab({
    required this.profileId,
    super.key,
  });

  @override
  State<MonthTab> createState() => MonthTabState();
}

class MonthTabState extends State<MonthTab> {

  // Intervals
  late final List<StatsInterval> intervals;

  // Calculated stats
  List<MonthStatsBucket> months = [];
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
                    calculatedStats = CalculatedStats.fromStatsBuckets(months);
                  });
                },
                itemBuilder: (context, index) {
                  return BlocProvider<StatsBucketCubit>(
                    create: (BuildContext context) {
                      return GetIt.I.get<StatsBucketCubit>()..query(
                        profileId: widget.profileId,
                        from: intervals[index].from,
                        to: intervals[index].to,
                        granularity: .month,
                      );
                    },
                    child: MonthsBarChartPage(
                      pageIndex: index,
                      statsInterval: intervals[index],
                      onMonthsLoaded: (List<MonthStatsBucket> loadedMonths) {
                        setState(() {
                          months = loadedMonths;
                          calculatedStats ??= CalculatedStats.fromStatsBuckets(months);
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
