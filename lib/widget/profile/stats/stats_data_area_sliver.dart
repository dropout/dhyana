import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

import 'detailed_consecutive_days_view.dart';
import 'detailed_milestones_view.dart';
import 'detailed_profile_view.dart';
import 'detailed_summary_view.dart';

class StatsDataAreaSliver extends StatelessWidget {

  final Profile profile;

  const StatsDataAreaSliver({
    required this.profile,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(DesignSpec.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DetailedProfileView(profile: profile),
            Gap.medium(),
            DetailedConsecutiveDaysView(profile: profile),
            Gap.medium(),
            DetailedMilestonesView(profile: profile),
            Gap.medium(),
            DetailedSummaryView(profile: profile),
          ],
        ),
      ),
    );
  }
}
