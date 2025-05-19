import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:flutter/material.dart';

class SummaryView extends StatelessWidget {

  final Profile? profile;

  const SummaryView({
    this.profile,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    int sessionCount = (profile != null) ?  profile!.statsReport.completedSessionsCount : 0;
    int minutesCount = (profile != null) ?  profile!.statsReport.completedMinutesCount : 0;
    int daysCount = (profile != null) ?  profile!.statsReport.completedDaysCount : 0;

    return AppCard(
      title: AppLocalizations.of(context).statsSummary,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SummaryItem(
              sessionCount,
              AppLocalizations.of(context).sessionsPlural(sessionCount)
            )
          ),
          const SizedBox(width: AppThemeData.spacingMd),
          Expanded(
            child: SummaryItem(
              minutesCount,
              AppLocalizations.of(context).minutesPlural(minutesCount),
            )
          ),
          const SizedBox(width: AppThemeData.spacingMd),
          Expanded(
            child: SummaryItem(
              daysCount,
              AppLocalizations.of(context).daysPlural(daysCount),
            )
          )
        ],
      ),
    );
  }

}

class SummaryItem extends StatelessWidget {

  final String label;
  final int value;

  const SummaryItem(
    this.value,
    this.label,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppThemeData.paddingMd),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(value.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )
          ),
          const SizedBox(height: 8),
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            )
          )
        ],),
    );
  }

}
