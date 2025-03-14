import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

import 'stats_text.dart';

class CalculatedStatsView extends StatefulWidget {

  final CalculatedStats calculatedStats;

  const CalculatedStatsView({
    required this.calculatedStats,
    super.key,
  });

  @override
  State<CalculatedStatsView> createState() => _CalculatedStatsViewState();
}

class _CalculatedStatsViewState extends State<CalculatedStatsView>
  with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CalculatedStats calculatedStats = widget.calculatedStats;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: buildColumnItem(
                context,
                label: AppLocalizations.of(context).statsTotalSessions,
                child: StatsNumValueText(
                  value: calculatedStats.totalSessions,
                  postFix: ' ${AppLocalizations.of(context).sessionsPlural(calculatedStats.totalSessions)}'),
                order: 0,
              ),
            ),
            Gap.medium(),
            Expanded(
              child: buildColumnItem(
                context,
                label: AppLocalizations.of(context).statsTotalTimeSpent,
                child: StatsDurationText(duration: Duration(minutes: calculatedStats.totalMinutes)),
                order: 1,
              ),
            ),
          ],
        ),
        Gap.medium(),
        Row(
          children: [
            Expanded(
              child: buildColumnItem(
                context,
                label: AppLocalizations.of(context).statsAverageSessions,
                child: StatsNumValueText(
                  value: calculatedStats.averageSessions,
                  postFix: ' ${AppLocalizations.of(context).sessionsPlural(calculatedStats.averageSessions)}'),
                order: 2,
              ),
            ),
            Gap.medium(),
            Expanded(
              child: buildColumnItem(
                context,
                label: AppLocalizations.of(context).statsAverageTimeSpent,
                child: StatsDurationText(duration: Duration(minutes: calculatedStats.averageMinutes.toInt())),
                order: 3,
              ),
            ),
          ],
        ),

      ]
    );
  }

  Widget buildColumnItem(
    BuildContext context, {
    required String label,
    required Widget child,
    int order = 0,
  }) {
    return AnimatedSwitcher(
      duration: Durations.extralong2,
      transitionBuilder: (child, animation) {
        double staggerGap = 0.1 * order;
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
                curve: Curves.easeOutCubic,
              ),
            )),
            child: child,
          );
        }

        // fading in staggered
        // double staggerGap = 0.1 * order;
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(
                0.5 + staggerGap,
                0.5 + staggerGap + 0.1,
                curve: Curves.easeOutCubic,
              ),
            )
          ),
          child: child,
        );
      },

      child: AppCard(
        key: ValueKey(widget.calculatedStats),
        title: label,
        children: [
          Gap.medium(),
          child,
        ],
      )

    );
  }

}




