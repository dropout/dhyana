import 'package:profile/l10n/profile_localizations.dart';
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
        title: ProfileLocalizations.of(context).milestones,
        padding: const EdgeInsets.only(
          bottom: DesignSpec.paddingLg,
          left: DesignSpec.paddingLg,
          right: DesignSpec.paddingLg,
        ),
        child: Column(
          children: [
            LabelValueDetail(
              label: ProfileLocalizations.of(context).statsCount,
              value: milestoneCount.toString(),
            ),
            LabelValueDetail(
              label: ProfileLocalizations.of(context).statsNextMilestone,
              value: getNextMilestoneText(context, profileStatsReport.milestoneProgress),
            ),
          ],
        )
    );
  }

  String getNextMilestoneText(BuildContext context, MilestoneProgress milestoneProgress) {
    return ProfileLocalizations.of(context).statsNextMilestoneInShort(
      milestoneProgress.targetDaysCount - milestoneProgress.completedDaysCount,
    );
  }

}
