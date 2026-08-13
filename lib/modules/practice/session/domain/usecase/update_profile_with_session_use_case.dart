import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';
import 'package:dhyana/modules/practice/session/domain/entity/update_profile_stats_result_entity.dart';
import 'package:dhyana/modules/profile/profile_module.dart';

/// Persists a completed session into profile 
/// and updates profile statistics.
/// Returns a container with the original profile, updated profile, 
/// and the session that the profile was updated with.
class UpdateProfileWithSessionUseCase {

  final ProfilePublicApi profilePublicApi;

  UpdateProfileWithSessionUseCase({
    required this.profilePublicApi,
  });

  Future<UpdateProfileStatsResultEntity> execute(
    String profileId,
    SessionEntity session,
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
    return UpdateProfileStatsResultEntity(
      oldProfile: result.originalProfile,
      updatedProfile: result.updatedProfile,
      session: session,
    );
  }
}
