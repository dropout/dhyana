import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/chart/all.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class DaysStatsView extends StatefulWidget {
  const DaysStatsView({super.key});

  @override
  State<DaysStatsView> createState() => _DaysStatsViewState();
}

class _DaysStatsViewState extends State<DaysStatsView> {

  late DateTime from;
  late DateTime to;

  @override
  void initState() {



    super.initState();
  }

  @override
  void didUpdateWidget(covariant DaysStatsView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppThemeData.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context).days, style: Theme.of(context).textTheme.titleLarge),
          Gap.medium(),
          SizedBox(
              height: 350,
              child: BarChart(
                  data: BarChartData(
                      <BarChartDataItem>[
                        BarChartDataItem(value: 100, label: 'Mon'),
                        BarChartDataItem(value: 200, label: 'Tue'),
                        BarChartDataItem(value: 300, label: 'Wed'),
                        BarChartDataItem(value: 400, label: 'Thu'),
                        BarChartDataItem(value: 500, label: 'Fri'),
                        BarChartDataItem(value: 600, label: 'Sat'),
                        BarChartDataItem(value: 700, label: 'Sun'),
                      ]
                  )
              )
          ),

        ],
      ),
    );


    // return SliverSafeArea(
    //   top: false,
    //   sliver: SliverToBoxAdapter(
    //     child: Padding(
    //       padding: const EdgeInsets.all(AppThemeData.spacingMd),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(AppLocalizations.of(context).days, style: Theme.of(context).textTheme.titleLarge),
    //           Gap.medium(),
    //           SizedBox(
    //               height: 350,
    //               child: BarChart(
    //                   data: BarChartData(
    //                       <BarChartDataItem>[
    //                         BarChartDataItem(value: 100, label: 'Mon'),
    //                         BarChartDataItem(value: 200, label: 'Tue'),
    //                         BarChartDataItem(value: 300, label: 'Wed'),
    //                         BarChartDataItem(value: 400, label: 'Thu'),
    //                         BarChartDataItem(value: 500, label: 'Fri'),
    //                         BarChartDataItem(value: 600, label: 'Sat'),
    //                         BarChartDataItem(value: 700, label: 'Sun'),
    //                       ]
    //                   )
    //               )
    //           ),
    //
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

}
