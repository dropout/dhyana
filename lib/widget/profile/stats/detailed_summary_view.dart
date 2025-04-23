import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:flutter/material.dart';

import 'label_value_detail.dart';

class DetailedSummaryView extends StatelessWidget {

  final Profile profile;

  const DetailedSummaryView({
    required this.profile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: AppLocalizations.of(context).statsSummary,
      padding: EdgeInsets.only(
        bottom: AppThemeData.paddingLg,
        left: AppThemeData.paddingLg,
        right: AppThemeData.paddingLg,
      ),
      child: Column(
        children: [
          LabelValueDetail(
            label: AppLocalizations.of(context).statsTotalTimeSpent,
            value: profile.statsReport.completedMinutesCount.toString(),
          ),
          // Divider(),
          LabelValueDetail(
            label: AppLocalizations.of(context).statsTotalSessions,
            value: profile.statsReport.completedSessionsCount.toString(),
          ),
          // Divider(),
          LabelValueDetail(
            label: AppLocalizations.of(context).statsTotalDays,
            value: profile.statsReport.completedDaysCount.toString(),
          )
        ],
      )
    );
  }
}
