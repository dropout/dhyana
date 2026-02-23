import 'package:dhyana/model/milestone_progress.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

import 'label_value_detail.dart';

class DetailedMilestonesView extends StatelessWidget {

  final Profile profile;

  const DetailedMilestonesView({
    required this.profile,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final int milestoneCount = profile.statsReport.milestoneCount;

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
              value: getNextMilestoneText(context, profile.statsReport.milestoneProgress),
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
