import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

class CalculatedStatsView extends StatelessWidget {

  final CalculatedStats calculatedStats;

  const CalculatedStatsView({
    required this.calculatedStats,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        buildRowItem(
            context,
            AppLocalizations.of(context).statsTotalTimeSpent,
            '${calculatedStats.totalMinutes} minutes'
        ),
        buildRowItem(
            context,
            AppLocalizations.of(context).statsTotalSessions,
            '${calculatedStats.totalSessions} sessions'
        ),
        buildRowItem(
            context,
            AppLocalizations.of(context).statsAverageTimeSpent,
            '${calculatedStats.averageMinutes.toInt()} minutes'
        ),
        buildRowItem(
            context,
            AppLocalizations.of(context).statsAverageSessions,
            '${calculatedStats.averageSessions.toInt()} sessions'
        ),
      ],
    );
  }

  Widget buildRowItem(BuildContext context, String label, String value) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(AppThemeData.borderRadiusLg))
            ),
            width: constraints.maxWidth / 2 - 4,
            height: 120,
            padding: const EdgeInsets.all(AppThemeData.paddingMd),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      label.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        shadows: [
                          const Shadow(
                            blurRadius: 48.0,
                            color: Colors.black87,
                          ),
                        ],
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      )
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                      value,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        shadows: [
                          const Shadow(
                            blurRadius: 48.0,
                            color: Colors.black87,
                          ),
                        ],
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      )
                  ),
                ),
              ],
            )
        );
      },
    );
  }

}
