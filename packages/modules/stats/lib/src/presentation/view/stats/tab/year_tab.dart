import 'package:stats/src/stats_module.dart';
import 'package:stats/src/presentation/view/stats/bar_chart_page/years_bar_chart_page.dart';
import 'package:stats/src/presentation/viewmodel/stats_bucket_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class YearTab extends StatefulWidget {
  final String profileId;

  const YearTab({required this.profileId, super.key});

  @override
  State<YearTab> createState() => YearTabState();
}

class YearTabState extends State<YearTab> {
  // Intervals
  late final List<StatsInterval> intervals;

  // Calculated stats
  List<YearStatsBucket> years = [];
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
          decoration: BoxDecoration(color: Colors.black),
          child: SizedBox(
            height: 540,
            child: PageView.builder(
              reverse: true,
              itemCount: 4,
              onPageChanged: (index) {
                setState(() {
                  calculatedStats = CalculatedStats.fromStatsBuckets(years);
                });
              },
              itemBuilder: (context, index) {
                return BlocProvider<StatsBucketCubit>(
                  create: (BuildContext context) {
                    return GetIt.I.get<StatsBucketCubit>()..query(
                      profileId: widget.profileId,
                      from: intervals[index].from,
                      to: intervals[index].to,
                      granularity: .years,
                    );
                  },
                  child: YearsBarChartPage(
                    pageIndex: index,
                    statsInterval: intervals[index],
                    onYearsLoaded: (List<YearStatsBucket> loadedYears) {
                      setState(() {
                        years = loadedYears;
                        calculatedStats ??= CalculatedStats.fromStatsBuckets(years);
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
