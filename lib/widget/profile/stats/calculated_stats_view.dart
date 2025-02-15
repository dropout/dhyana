import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_animation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CalculatedStatsView extends StatefulWidget {

  final CalculatedStats calculatedStats;

  const CalculatedStatsView({
    required this.calculatedStats,
    super.key,
  });

  @override
  State<CalculatedStatsView> createState() => _CalculatedStatsViewState();
}

class _Entry {
  final String label;
  final String value;

  _Entry(this.label, this.value);

}

class _CalculatedStatsViewState extends State<CalculatedStatsView>
  with SingleTickerProviderStateMixin {

  String uuid = Uuid().v4();
  int totalSessions = 0;
  int totalMinutes = 0;
  int averageSessions = 0;
  int averageMinutes = 0;
  List<_Entry> entries = [];

  late final AnimationController _animationController;
  late final Animation<double> _mainAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.long4,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CalculatedStatsView oldWidget) {
    if (oldWidget.calculatedStats != widget.calculatedStats) {
      setState(() {
        uuid = Uuid().v4();
      });

      _animationController.reverse(from: 1.0).then((_) {
        _animationController.forward(from: 0.0);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {

    // ret
    //
    //
    // // return AnimatedList(
    // //   shrinkWrap: true,
    // //   initialItemCount: 4,
    // //   itemBuilder: (
    // //     BuildContext context,
    // //     int index,
    // //     Animation<double> animation
    // //   ) {
    // //     return buildColumnItem(
    // //       context,
    // //       label: entries[index].label,
    // //       value: entries[index].value,
    // //     );
    // //   },
    //   // children: [
    //   //   buildColumnItem(
    //   //     context,
    //   //     label: AppLocalizations.of(context).statsTotalSessions,
    //   //     value: '$totalSessions ${AppLocalizations.of(context).sessions}',
    //   //   ),
    //   //   buildColumnItem(
    //   //     context,
    //   //     label: AppLocalizations.of(context).statsTotalTimeSpent,
    //   //     value: AppLocalizations.of(context).minutesPluralWithNumber(totalMinutes),
    //   //   ),
    //   //   buildColumnItem(
    //   //     context,
    //   //     label: AppLocalizations.of(context).statsAverageSessions,
    //   //     value: '$averageSessions ${AppLocalizations.of(context).sessions}',
    //   //   ),
    //   //   buildColumnItem(
    //   //     context,
    //   //     label: AppLocalizations.of(context).statsAverageTimeSpent,
    //   //     value: AppLocalizations.of(context).minutesPluralWithNumber(averageMinutes),
    //   //   ),
    //   // ],
    // );

    return Column(
      children: [
        buildColumnItem(
          context,
          label: AppLocalizations.of(context).statsTotalSessions,
          value: '$totalSessions ${AppLocalizations.of(context).sessions}',
          order: 0,
        ),
        buildColumnItem(
          context,
          label: AppLocalizations.of(context).statsTotalTimeSpent,
          value: AppLocalizations.of(context).minutesPluralWithNumber(widget.calculatedStats.totalMinutes),
          order: 1,
        ),
        buildColumnItem(
          context,
          label: AppLocalizations.of(context).statsAverageSessions,
          value: '$averageSessions ${AppLocalizations.of(context).sessions}',
          order: 2,
        ),
        buildColumnItem(
          context,
          label: AppLocalizations.of(context).statsAverageTimeSpent,
          value: AppLocalizations.of(context).minutesPluralWithNumber(averageMinutes),
          order: 3,
        ),
      ]
    );
  }

  Widget buildColumnItem(
    BuildContext context, {
    required String label,
    required String value,
    int order = 0,
  }) {
    // return Card(
    //     key: ValueKey<String>('$uuid-$label-$value'),
    //     color: AppColors.backgroundPaperLight,
    //     child: Padding(
    //       padding: const EdgeInsets.all(AppThemeData.paddingMd),
    //       child: Row(
    //         children: [
    //           Text(
    //             label.toUpperCase(),
    //             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
    //               color: Colors.black,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           const Spacer(),
    //           Text(
    //             value,
    //             style: Theme.of(context).textTheme.titleLarge!.copyWith(
    //               color: Colors.black,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ],
    //       ),
    //     )
    // );


    return AnimatedSwitcher(
      // duration: Durations.extralong3,
      duration: Duration(seconds: 1),
      transitionBuilder: (child, animation) {

        if (animation.isForwardOrCompleted) {
          // fading out in unison
          return FadeTransition(
            opacity: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Interval(
                0.5,
                1.0,
                curve: Curves.easeInOutCubicEmphasized
              ),
            )),
            child: child,
          );

        }

        double interval = 0.1 * order;

        // fading in staggered
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.5 + interval,
                  1.0,
                ),
              )
          ),
          child: child,
        );


        // return animatedSwitcherTransition(child, animation);
        // animation.drive(_animationController.value);

        // print(animation.isForwardOrCompleted);

        // return SlideTransition(
        //   position: Tween<Offset>(
        //     begin: Offset(0.0, 1.0),
        //     end: Offset.zero,
        //   ).animate(
        //     CurvedAnimation(
        //       parent: animation,
        //       curve: Interval(
        //         interval,
        //         interval + 0.25,
        //       ),
        //     )
        //   ),
        //   child: child,
        // );

        // return FadeTransition(
        //   opacity: Tween<double>(
        //     begin: 0.0,
        //     end: 1.0,
        //   ).animate(CurvedAnimation(
        //     parent: animation,
        //     curve: Interval(
        //       0.5,
        //       1.0,
        //     ),
        //   )),
        //   child: child,
        // );
      },
      child: Card(
        key: ValueKey(widget.calculatedStats),
        color: AppColors.backgroundPaperLight,
        child: Padding(
          padding: const EdgeInsets.all(AppThemeData.paddingMd),
          child: Row(
            children: [
              Text(
                label.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                value,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      )
    );
  }

  // // @override
  // Widget buildOld(BuildContext context) {
  //   return Wrap(
  //     spacing: 8.0,
  //     runSpacing: 8.0,
  //     children: [
  //       buildRowItem(
  //           context,
  //           AppLocalizations.of(context).statsTotalTimeSpent,
  //           '${calculatedStats.totalMinutes} minutes'
  //       ),
  //       buildRowItem(
  //           context,
  //           AppLocalizations.of(context).statsTotalSessions,
  //           '${calculatedStats.totalSessions} sessions'
  //       ),
  //       buildRowItem(
  //           context,
  //           AppLocalizations.of(context).statsAverageTimeSpent,
  //           '${calculatedStats.averageMinutes.toInt()} minutes'
  //       ),
  //       buildRowItem(
  //           context,
  //           AppLocalizations.of(context).statsAverageSessions,
  //           '${calculatedStats.averageSessions.toInt()} sessions'
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget buildRowItem(BuildContext context, String label, String value) {
  //   return LayoutBuilder(
  //     builder: (BuildContext context, BoxConstraints constraints) {
  //       return Container(
  //           decoration: const BoxDecoration(
  //               color: Colors.black,
  //               borderRadius: BorderRadius.all(Radius.circular(AppThemeData.borderRadiusLg))
  //           ),
  //           width: constraints.maxWidth / 2 - 4,
  //           height: 120,
  //           padding: const EdgeInsets.all(AppThemeData.paddingMd),
  //           child: Stack(
  //             fit: StackFit.expand,
  //             children: [
  //               Align(
  //                 alignment: Alignment.topLeft,
  //                 child: Text(
  //                     label.toUpperCase(),
  //                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
  //                       color: Colors.white,
  //                       shadows: [
  //                         const Shadow(
  //                           blurRadius: 48.0,
  //                           color: Colors.black87,
  //                         ),
  //                       ],
  //                       fontWeight: FontWeight.bold,
  //                       height: 1.0,
  //                     )
  //                 ),
  //               ),
  //               Align(
  //                 alignment: Alignment.bottomRight,
  //                 child: Text(
  //                     value,
  //                     style: Theme.of(context).textTheme.titleLarge!.copyWith(
  //                       color: Colors.white,
  //                       shadows: [
  //                         const Shadow(
  //                           blurRadius: 48.0,
  //                           color: Colors.black87,
  //                         ),
  //                       ],
  //                       fontWeight: FontWeight.bold,
  //                       height: 1.0,
  //                     )
  //                 ),
  //               ),
  //             ],
  //           )
  //       );
  //     },
  //   );
  // }

}
