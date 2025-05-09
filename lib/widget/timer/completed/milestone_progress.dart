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
  final double itemSize;

  const MilestoneProgress({
    required this.profile,
    this.showAnimation = false,
    this.showText = true,
    this.itemSize = 36,
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
    final milestoneProgress = widget.profile.statsReport.milestoneProgress;
    final int targetCount = milestoneProgress.targetDaysCount;
    final int completedCount = milestoneProgress.completedDaysCount;

    final Color completedColor = Colors.green.shade600;
    final Color incompleteColor = Colors.grey.shade800;

    List<Widget> result = List<Widget>.filled(
      targetCount,
      const SizedBox.shrink(),
    );

    int i = targetCount;
    while (i > 0) {
      if (i > completedCount) {
        result[i - 1] = SizedBox.square(
          dimension: widget.itemSize,
          child: MilestoneProgressItem(
            mode: MilestoneProgressItemMode.incomplete,
            completedColor: completedColor,
            incompleteColor: incompleteColor,
          ),
        );
      } else if (i == completedCount) {
        result[i - 1] = SizedBox.square(
          dimension: widget.itemSize,
          child: MilestoneProgressItem(
            mode: widget.showAnimation
              ? MilestoneProgressItemMode.animate
              : MilestoneProgressItemMode.completed,
            completedColor: completedColor,
            incompleteColor: incompleteColor,
          )
        );
      } else {
        result[i - 1] = SizedBox.square(
          dimension: widget.itemSize,
          child: MilestoneProgressItem(
            mode: MilestoneProgressItemMode.completed,
            completedColor: completedColor,
            incompleteColor: incompleteColor,
          ),
        );

      }

      i--;
    }

    return result;
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
