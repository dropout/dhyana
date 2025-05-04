import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/milestone_progress.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:flutter/material.dart';

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
        title: AppLocalizations.of(context).milestones,
        padding: EdgeInsets.only(
          bottom: AppThemeData.paddingLg,
          left: AppThemeData.paddingLg,
          right: AppThemeData.paddingLg,
        ),
        child: Column(
          children: [
            LabelValueDetail(
              label: AppLocalizations.of(context).statsCount,
              value: milestoneCount.toString(),
            ),
            LabelValueDetail(
              label: AppLocalizations.of(context).statsNextMilestone,
              value: getNextMilestoneText(context, profile.statsReport.milestoneProgress),
            ),
          ],
        )
    );
  }

  String getNextMilestoneText(BuildContext context, MilestoneProgress milestoneProgress) {
    return AppLocalizations.of(context).statsNextMilestoneInShort(
      milestoneProgress.targetDaysCount - milestoneProgress.completedDaysCount,
    );
  }

}
