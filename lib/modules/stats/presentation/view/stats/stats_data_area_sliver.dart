import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/view/util/gap.dart';
import 'package:dhyana/modules/profile/public/model/profile.dart';
import 'package:flutter/material.dart';

import 'detailed_consecutive_days_view.dart';
import 'detailed_milestones_view.dart';
import 'detailed_profile_view.dart';
import 'detailed_summary_view.dart';

class StatsDataAreaSliver extends StatelessWidget {
  final Profile profile;
  final String profileName;
  final String? profilePhotoUrl;
  final String? profilePhotoBlurhash;

  const StatsDataAreaSliver({
    required this.profile,
    required this.profileName,
    required this.profilePhotoUrl,
    required this.profilePhotoBlurhash,
    super.key,
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
            DetailedProfileView(
              profileId: profile.id,
              profileName: profile.displayName,
              signupDate: profile.signupDate,
              profileStatsReport: profile.statsReport,
              profilePhotoUrl: profile.photoUrl,
              profilePhotoBlurhash: profile.photoBlurhash,
            ),
            Gap.medium(),
            DetailedConsecutiveDaysView(
              profileStatsReport: profile.statsReport,
            ),
            Gap.medium(),
            DetailedMilestonesView(profileStatsReport: profile.statsReport),
            Gap.medium(),
            DetailedSummaryView(profileStatsReport: profile.statsReport),
          ],
        ),
      ),
    );
  }
}
