import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/milestone_progress.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:flutter/material.dart';

class MilestonesView extends StatefulWidget {

  final Profile profile;

  const MilestonesView({
    required this.profile,
    super.key
  });

  @override
  State<MilestonesView> createState() => _MilestonesViewState();
}

class _MilestonesViewState extends State<MilestonesView> {

  @override
  Widget build(BuildContext context) {
    final int milestoneCount = widget.profile.statsReport.milestoneCount;

    return Stack(
      children: [
        AppCard(
          title: AppLocalizations.of(context).milestones,
          child: StatsNumValueText(
            value: milestoneCount,
          )
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: AppThemeData.paddingLg,
                right: AppThemeData.paddingLg,
              ),
              child: buildMilestoneBars(
                context,
                widget.profile.statsReport.milestoneProgress,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildMilestoneBars(
    BuildContext context,
    MilestoneProgress milestoneProgress
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 3.0,
      children:
        List.generate(7, (index) {
          return buildMilestoneBar(context, index < milestoneProgress.completedDaysCount);
        }).reversed.toList(),
    );
  }

  Widget buildMilestoneBar(
    BuildContext context,
    bool completed,
  ) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: completed ? Colors.black : Colors.black.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: SizedBox(
        width: 18,
        height: 6,
      )
    );
  }

}
