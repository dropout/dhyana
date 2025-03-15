import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class PerformanceInNumbersDisplay extends StatelessWidget {

  final Profile profile;

  const PerformanceInNumbersDisplay({
    required this.profile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: 'Summary',
      padding: EdgeInsets.only(
        bottom: AppThemeData.paddingLg,
      ),
      child: Column(
        children: [
          PerformanceItem(
            label: AppLocalizations.of(context).statsTotalTimeSpent,
            child: StatsDurationText(
              duration: Duration(minutes: profile.statsReport.completedMinutesCount)
            )
          ),
          // Divider(),
          PerformanceItem(
            label: AppLocalizations.of(context).statsTotalSessions,
            child: StatsNumValueText(
              value: profile.statsReport.completedSessionsCount,
            )
          ),
          // Divider(),
          PerformanceItem(
            label: AppLocalizations.of(context).statsTotalDays,
            child: StatsNumValueText(
              value: profile.statsReport.completedDaysCount,
            )
          )
        ],
      )
    );
  }
}

class PerformanceItem extends StatelessWidget {

  final String label;
  final Widget child;

  const PerformanceItem({
    required this.label,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppThemeData.paddingLg,
            vertical: AppThemeData.paddingXs
          ),
          child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppThemeData.paddingLg,
            vertical: AppThemeData.paddingXs
          ),
          child: child,
        )
      ],
    );
  }
}
