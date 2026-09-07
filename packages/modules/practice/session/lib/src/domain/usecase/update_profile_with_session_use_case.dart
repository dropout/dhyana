import 'package:session/src/domain/entity/session_entity.dart';
import 'package:session/src/domain/entity/update_profile_stats_result_entity.dart';
import 'package:session/src/domain/service/session_app_port.dart';


/// Persists a completed session into profile 
/// and updates profile statistics.
/// Returns a container with the original profile, updated profile, 
/// and the session that the profile was updated with.
class UpdateProfileWithSessionUseCase {

  final SessionAppPort sessionAppPort;

  UpdateProfileWithSessionUseCase({
    required this.sessionAppPort,
  });

  Future<UpdateProfileStatsResultEntity> execute(
    String profileId,
    SessionEntity session,
  ) async {
    final result = await sessionAppPort.updateProfileWithSession(
      profileId,
      session,
    );
    return UpdateProfileStatsResultEntity(
      oldProfile: result.originalProfile,
      updatedProfile: result.updatedProfile,
      session: session,
    );
  }
}
