import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

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
        buildColumnItem(
          context,
          label: AppLocalizations.of(context).statsTotalSessions,
          value: '${calculatedStats.totalSessions} ${AppLocalizations.of(context).sessions}',
          order: 0,
        ),
        buildColumnItem(
          context,
          label: AppLocalizations.of(context).statsTotalTimeSpent,
          value: AppLocalizations.of(context).minutesPluralWithNumber(calculatedStats.totalMinutes),
          order: 1,
        ),
        buildColumnItem(
          context,
          label: AppLocalizations.of(context).statsAverageSessions,
          value: '${calculatedStats.averageSessions.toStringAsFixed(0)} ${AppLocalizations.of(context).sessions}',
          order: 2,
        ),
        buildColumnItem(
          context,
          label: AppLocalizations.of(context).statsAverageTimeSpent,
          value: AppLocalizations.of(context).minutesPluralWithNumber(calculatedStats.averageMinutes.toInt()),
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

}
