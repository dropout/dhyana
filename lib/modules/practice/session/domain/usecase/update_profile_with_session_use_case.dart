import 'package:dhyana/modules/practice/session/public/model/session.dart';
import 'package:dhyana/modules/practice/session/domain/entity/update_profile_stats_result.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';

import 'package:dhyana/modules/profile/public/model/profile_session.dart';

/// Persists a completed session into profile statistics and returns the updated profile.
class UpdateProfileWithSessionUseCase {

  final ProfilePublicApi profilePublicApi;

  UpdateProfileWithSessionUseCase({
    required this.profilePublicApi,
  });

  Future<UpdateProfileStatsResult> execute(
    String profileId,
    Session session,
  ) async {
    final result = await profilePublicApi.updateProfileStatsWithSession(
      profileId,
      ProfileSession(
        id: session.id,
        startTime: session.startTime,
        endTime: session.endTime,
        duration: session.duration,
        type: switch(session.type) {
          .sitting => .sitting,
          .chanting => .chanting,
        },
      ),
    );
    return UpdateProfileStatsResult(
      oldProfile: result.originalProfile,
      updatedProfile: result.updatedProfile,
      session: session,
    );
  }
}
