import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';

import 'milestone_progress_view_item.dart';

class MilestoneProgressView extends StatefulWidget {

  final Profile profile;
  final bool showAnimation;
  final bool showText;
  final double itemSize;
  final Color textColor;

  const MilestoneProgressView({
    required this.profile,
    this.showAnimation = false,
    this.showText = true,
    this.itemSize = 36,
    this.textColor = Colors.black,
    super.key,
  });

  @override
  State<MilestoneProgressView> createState() => _MilestoneProgressViewState();
}

class _MilestoneProgressViewState extends State<MilestoneProgressView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          key: const Key('milestone_progress_view_row'),
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppThemeData.spacingXs,
          children: buildMilestoneItems(context),
        ),
        Gap.small(),
        if (widget.showText) buildMilestoneText(context),
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
          child: MilestoneProgressViewItem(
            mode: MilestoneProgressViewItemMode.incomplete,
            completedColor: completedColor,
            incompleteColor: incompleteColor,
          ),
        );
      } else if (i == completedCount) {
        result[i - 1] = SizedBox.square(
          dimension: widget.itemSize,
          child: MilestoneProgressViewItem(
            mode: widget.showAnimation
              ? MilestoneProgressViewItemMode.animate
              : MilestoneProgressViewItemMode.completed,
            completedColor: completedColor,
            incompleteColor: incompleteColor,
          )
        );
      } else {
        result[i - 1] = SizedBox.square(
          dimension: widget.itemSize,
          child: MilestoneProgressViewItem(
            mode: MilestoneProgressViewItemMode.completed,
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
      key: const Key('milestone_progress_view_text'),
      context.localizations.statsNextMilestoneIn(
        widget.profile.statsReport.milestoneProgress.remainingDaysCount
      ),
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: widget.textColor,
      )
    );
  }

}
