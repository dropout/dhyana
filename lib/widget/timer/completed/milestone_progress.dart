import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

import 'milestone_progress_item.dart';

class MilestoneProgress extends StatefulWidget {

  final Profile profile;
  final bool showAnimation;
  final bool showText;

  const MilestoneProgress({
    required this.profile,
    this.showAnimation = false,
    this.showText = true,
    super.key,
  });

  @override
  State<MilestoneProgress> createState() => _MilestoneProgressState();
}

class _MilestoneProgressState extends State<MilestoneProgress> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppThemeData.spacingXs,
          children: buildMilestoneItems(context),
        ),
        Gap.small(),
        buildMilestoneText(context),
      ],
    );
  }

  List<Widget> buildMilestoneItems(BuildContext context) {


    int count = widget.profile.statsReport.milestoneProgress.targetDaysCount;
    int completedCount = widget.profile.statsReport.milestoneProgress.completedDaysCount;
    int incompleteCount = count - completedCount;

    final Color completedColor = Colors.green.shade600;
    final Color incompleteColor = Colors.grey.shade800;

    const double size = 36;
    return [
      for (int i = 0; i < completedCount - 1; i++)
        SizedBox(
          width: size,
          height: size,
          child: MilestoneProgressItem(
            mode: MilestoneProgressItemMode.completed,
            completedColor: completedColor,
            incompleteColor: incompleteColor,
          ),
        ),
      if (widget.showAnimation)
        SizedBox(
          width: size,
          height: size,
          child: MilestoneProgressItem(
            mode: MilestoneProgressItemMode.animate,
            completedColor: completedColor,
            incompleteColor: incompleteColor,
          ),
        ),
      for (int i = 0; i < incompleteCount; i++)
        SizedBox(
          width: size,
          height: size,
          child: MilestoneProgressItem(
            mode: MilestoneProgressItemMode.incomplete,
            completedColor: completedColor,
            incompleteColor: incompleteColor,
          ),
        ),
    ];

  }

  Widget buildMilestoneText(BuildContext context) {
    return Text(
      AppLocalizations.of(context).statsNextMilestoneIn(
        widget.profile.statsReport.milestoneProgress.remainingDaysCount
      ),
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

}
