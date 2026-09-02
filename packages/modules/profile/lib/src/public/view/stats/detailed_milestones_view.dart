import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:material_ui/material_ui.dart';

import 'label_value_detail.dart';

class DetailedMilestonesView extends StatelessWidget {

  final ProfileStatsReport profileStatsReport;

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
