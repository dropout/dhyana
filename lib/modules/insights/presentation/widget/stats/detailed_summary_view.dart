import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/widget/util/app_card.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:dhyana/modules/insights/domain/model/profile_statistics_report.dart';
import 'package:flutter/material.dart';

import 'label_value_detail.dart';

class DetailedSummaryView extends StatelessWidget {

  final ProfileStatisticsReport profileStatsReport;

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
