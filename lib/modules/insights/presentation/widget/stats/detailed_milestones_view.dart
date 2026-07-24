import 'package:dhyana/modules/insights/domain/model/milestone_progress.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/widget/util/app_card.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:dhyana/modules/insights/domain/model/profile_statistics_report.dart';
import 'package:flutter/material.dart';

import 'label_value_detail.dart';

class DetailedMilestonesView extends StatelessWidget {

  final ProfileStatisticsReport profileStatsReport;

  const DetailedMilestonesView({
    required this.profileStatsReport,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final int milestoneCount = profileStatsReport.milestoneCount;

    return AppCard(
        title: context.l10n.milestones,
        padding: const EdgeInsets.only(
          bottom: DesignSpec.paddingLg,
          left: DesignSpec.paddingLg,
          right: DesignSpec.paddingLg,
        ),
        child: Column(
          children: [
            LabelValueDetail(
              label: context.l10n.statsCount,
              value: milestoneCount.toString(),
            ),
            LabelValueDetail(
              label: context.l10n.statsNextMilestone,
              value: getNextMilestoneText(context, profileStatsReport.milestoneProgress),
            ),
          ],
        )
    );
  }

  String getNextMilestoneText(BuildContext context, MilestoneProgress milestoneProgress) {
    return context.l10n.statsNextMilestoneInShort(
      milestoneProgress.targetDaysCount - milestoneProgress.completedDaysCount,
    );
  }

}
