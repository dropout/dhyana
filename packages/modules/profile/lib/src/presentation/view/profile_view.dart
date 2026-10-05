import 'package:material_ui/material_ui.dart';

import 'package:core/core.dart';
import 'package:profile/src/presentation/view/profile_footer.dart';
import 'package:profile/src/presentation/view/profile_menu.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/view/profile_avatar.dart';
import 'package:profile/src/public/view/stats/consecutive_days_view.dart';
import 'package:profile/src/public/view/stats/milestone_progress_view.dart';
import 'package:profile/src/public/view/stats/milestones_view.dart';
import 'package:profile/src/public/view/stats/summary_view.dart';

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
                Gap.large(),
                ProfileAvatar(
                  profileId: profile.id,
                  profileName: profile.displayName,
                  profilePhotoBlurhash: profile.photoBlurhash,
                  imageSize: DesignSpec.circleLg,                  
                ),
                Gap.large(),

                // Conditionally build widgets based on profile settings
                ...buildProfileStats(),
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

  List<Widget> buildProfileStats() {
    if (profile.settings.showStats == false) return [];
    return [
      MilestoneProgressView(statsReport: profile.statsReport),
      Gap.large(),
      Row(
        children: [
          Expanded(child: ConsecutiveDaysView(profile: profile)),
          Gap.medium(),
          Expanded(
            child: MilestonesView(profileStatsReport: profile.statsReport),
          ),
        ],
      ),
      Gap.large(),
      SummaryView(
        daysCount: profile.statsReport.completedDaysCount,
        minutesCount: profile.statsReport.completedMinutesCount,
        sessionCount: profile.statsReport.completedSessionsCount,
      ),      
    ];
  }
}
