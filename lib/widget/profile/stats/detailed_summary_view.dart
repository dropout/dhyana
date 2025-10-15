import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/app_context.dart';
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
      title: context.localizations.statsSummary,
      padding: EdgeInsets.only(
        bottom: AppThemeData.paddingLg,
        left: AppThemeData.paddingLg,
        right: AppThemeData.paddingLg,
      ),
      child: Column(
        children: [
          LabelValueDetail(
            label: context.localizations.statsTotalTimeSpent,
            value: profile.statsReport.completedMinutesCount.toString(),
          ),
          LabelValueDetail(
            label: context.localizations.statsTotalSessions,
            value: profile.statsReport.completedSessionsCount.toString(),
          ),
          LabelValueDetail(
            label: context.localizations.statsTotalDays,
            value: profile.statsReport.completedDaysCount.toString(),
          )
        ],
      )
    );
  }
}
