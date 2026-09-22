import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:material_ui/material_ui.dart';

import 'milestone_progress_view_item.dart';

class const MilestoneProgressView({
  required final ProfileStatsReport statsReport,
  final bool showAnimation = false,
  final bool showText = true,
  final double itemSize = 36,
  final Color textColor = Colors.black,
  super.key,
}) extends StatefulWidget {
  @override
  State<MilestoneProgressView> createState() => _MilestoneProgressViewState();
}

class _MilestoneProgressViewState extends State<MilestoneProgressView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      key: const Key('milestone_progress_view'),
      children: [
        Row(
          key: const Key('milestone_progress_view_row'),
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: DesignSpec.spacingXs,
          children: buildMilestoneItems(context),
        ),
        Gap.medium(),
        if (widget.showText) buildMilestoneText(context),
      ],
    );
  }

  List<Widget> buildMilestoneItems(BuildContext context) {
    final milestoneProgress = widget.statsReport.milestoneProgress;
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
          ),
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
    late final String text;
    if (widget.statsReport.milestoneProgress.remainingDaysCount == 0) {
      text = ProfileLocalizations.of(context).statsNextMilestoneCompletedText;
    } else {
      text = ProfileLocalizations.of(context).statsNextMilestoneIn(
        widget.statsReport.milestoneProgress.remainingDaysCount,
      );    
    }

    return Text(
      key: const Key('milestone_progress_view_text'),
      text,
      style: Theme.of(context).textTheme.bodyLarge!
          .copyWith(color: widget.textColor),
    );
  }
}
