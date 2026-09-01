import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:profile/profile.dart';

import 'label_value_detail.dart';


class DetailedSummaryView extends StatelessWidget {

  final ProfileStatsReport profileStatsReport;

  const DetailedSummaryView({
    required this.profileStatsReport,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: context.l10n.statsSummary,
      padding: const EdgeInsets.only(
        bottom: DesignSpec.paddingLg,
        left: DesignSpec.paddingLg,
        right: DesignSpec.paddingLg,
      ),
      child: Column(
        children: [
          LabelValueDetail(
            label: context.l10n.statsTotalTimeSpent,
            value: profileStatsReport.completedMinutesCount.toString(),
          ),
          LabelValueDetail(
            label: context.l10n.statsTotalSessions,
            value: profileStatsReport.completedSessionsCount.toString(),
          ),
          LabelValueDetail(
            label: context.l10n.statsTotalDays,
            value: profileStatsReport.completedDaysCount.toString(),
          )
        ],
      )
    );
  }
}
