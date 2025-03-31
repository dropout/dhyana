import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

import 'milestone_progress_item.dart';

class MilestoneProgress extends StatefulWidget {

  final Profile oldProfile;
  final Profile updatedProfile;

  const MilestoneProgress({
    required this.oldProfile,
    required this.updatedProfile,
    super.key,
  });

  @override
  State<MilestoneProgress> createState() => _MilestoneProgressState();
}

class _MilestoneProgressState extends State<MilestoneProgress> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: AppThemeData.spacingXs,
      children: buildMilestoneItems(context),
    );
  }

  List<Widget> buildMilestoneItems(BuildContext context) {
    Profile updatedProfile = widget.updatedProfile;

    int count = updatedProfile.statsReport.milestoneProgress.targetDaysCount;
    int completedCount = updatedProfile.statsReport.milestoneProgress.completedDaysCount;
    int incompleteCount = count - completedCount;
    // bool consecutiveDaysProgress = (oldProfile.statsReport.consecutiveDays.current
    //   < updatedProfile.statsReport.consecutiveDays.current);
    bool consecutiveDaysProgress = true;

    const double size = 36;
    return [
      for (int i = 0; i < completedCount - 1; i++)
        SizedBox(
          width: size,
          height: size,
          child: MilestoneProgressItem(
            mode: MilestoneProgressItemMode.completed,
            incompleteColor: Colors.grey.shade800,
          ),
        ),
      if (consecutiveDaysProgress)
        SizedBox(
          width: size,
          height: size,
          child: MilestoneProgressItem(
            mode: MilestoneProgressItemMode.animate,
            incompleteColor: Colors.grey.shade800,
          ),
        ),
      for (int i = 0; i < incompleteCount; i++)
        SizedBox(
          width: size,
          height: size,
          child: MilestoneProgressItem(
            mode: MilestoneProgressItemMode.incomplete,
            incompleteColor: Colors.grey.shade800,
          ),
        ),
    ];

  }

}
