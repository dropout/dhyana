import 'package:dhyana/modules/account/domain/model/profile.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/modules/account/presentation/widget/profile_footer.dart';
import 'package:dhyana/modules/account/presentation/widget/profile_image.dart';
import 'package:dhyana/modules/account/presentation/widget/profile_menu.dart';
import 'package:dhyana/modules/practice/session/presentation/widget/completed/milestone_progress_view.dart';
import 'package:dhyana/core/presentation/widget/util/gap.dart';
import 'package:flutter/material.dart';

import '../../../insights/presentation/widget/stats/consecutive_days_view.dart';
import '../../../insights/presentation/widget/stats/milestones_view.dart';
import '../../../insights/presentation/widget/stats/summary_view.dart';

class ProfileView extends StatelessWidget {
  final Profile profile;

  const ProfileView({required this.profile, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingLg),
      // Remove full width constraints forced by parent scroll view
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: DesignSpec.maxContentWidth),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Profile avatar + name
                Gap.large(),
                DecoratedBox(
                  // let the border be visible on top of the image
                  position: .foreground, 
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 4.0,),
                  ),
                  child: ProfileImage(
                    profileName: profile.displayName,
                    profileImagePath: 'profiles/${profile.id}/photo.jpg',
                    profilePhotoBlurhash: profile.photoBlurhash,
                    size: DesignSpec.circleLg),
                ),
                Gap.small(),
                Text(
                  profile.displayName,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap.large(),
                MilestoneProgressView(profile: profile),
                Gap.large(),
                Row(
                  children: [
                    Expanded(child: ConsecutiveDaysView(profile: profile)),
                    Gap.medium(),
                    Expanded(child: MilestonesView(profileStatsReport: profile.statsReport)),
                  ],
                ),
                Gap.large(),
                SummaryView(profile: profile),
                Gap.large(),
                ProfileMenu(profile: profile),
                Gap.large(),
                const ProfileFooter(),
                Gap.large(),
              ],
            ),
          );
        },
      ),
    );
  }
}
