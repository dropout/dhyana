import 'package:material_ui/material_ui.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:social/social.dart';
import 'package:session/src/public/model/update_profile_stats_result.dart';


import 'session_result.dart';

class const SignedInCompletedView({
  required final String profileId,
  required final UpdateProfileStatsResult updateResult,
  required final ProfileSettings profileSettings,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    if (profileSettings.usePresenceFeature == false &&
        profileSettings.showStatsOnFinishScreen == false) {
      return SizedBox.expand(
        child: Center(
          child: SessionResult(
            session: updateResult.session,
            profile: updateResult.updatedProfile,
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap.xl(),
            SessionResult(
              session: updateResult.session,
              profile: updateResult.updatedProfile,
            ),
            Gap.xl(),
            if (profileSettings.showStatsOnFinishScreen)
              MilestoneProgressView(
                profile: updateResult.updatedProfile,
                showAnimation: updateResult.updatedProfile
                    .consecutiveDaysProgressCheck(updateResult.oldProfile),
                textColor: Colors.white,
              ),
            if (profileSettings.showStatsOnFinishScreen) Gap.large(),
            if (profileSettings.showStatsOnFinishScreen)
              ProgressSummary(
                oldProfile: updateResult.oldProfile,
                updatedProfile: updateResult.updatedProfile,
              ),
            if (profileSettings.usePresenceFeature) Gap.xxl(),
            if (profileSettings.usePresenceFeature)
              PresenceArea.withCubit(
                profileId: updateResult.updatedProfile.id,
                onCubitCreated: (cubit) {
                  cubit.loadPresenceData(
                    ownProfileId: updateResult.updatedProfile.id,
                    limit: 18,
                    windowSize: const Duration(minutes: 120),
                  );
                },
              ),
            SizedBox(
              // as per size of bottom area gradient - safearea bottom
              // see [session_completed_screen.dart]
              height: 140,
            ),
          ],
        ),
      ),
    );
  }
}
