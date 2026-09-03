import 'package:profile/l10n/profile_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:profile/profile.dart';
import 'package:core/core.dart';

class MilestonesView extends StatefulWidget {

  final ProfileStatsReport profileStatsReport;
  final bool showMeter;

  const MilestonesView({
    required this.profileStatsReport,
    this.showMeter = false,
    super.key
  });

  @override
  State<MilestonesView> createState() => _MilestonesViewState();
}

class _MilestonesViewState extends State<MilestonesView> {

  @override
  Widget build(BuildContext context) {
    final int milestoneCount = widget.profileStatsReport.milestoneCount;

    return Stack(
      key: const Key('milestones_view'),
      children: [
        AppCard(
          title: ProfileLocalizations.of(context).milestones,
          child: Text(
            milestoneCount.toStringAsFixed(0),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (widget.showMeter) Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: DesignSpec.paddingLg,
                right: DesignSpec.paddingLg,
              ),
              child: buildMilestoneBars(
                context,
                widget.profileStatsReport.milestoneProgress,
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
