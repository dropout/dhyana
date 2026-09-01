import 'package:profile/profile.dart';
import 'package:session/src/domain/entity/session_entity.dart';
import 'package:session/src/domain/entity/update_profile_stats_result_entity.dart';


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
