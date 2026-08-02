import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/modules/practice/session/domain/entity/update_profile_stats_result.dart';
import 'package:dhyana/core/service/module/profile_service.dart';
import 'package:dhyana/core/domain/entity/session.dart';

/// Persists a completed session into profile statistics and returns the updated profile.
class UpdateProfileWithSessionUseCase {

  final ProfileService profileService;

  UpdateProfileWithSessionUseCase({
    required this.profileService,
  });

  Future<UpdateProfileStatsResult> execute(
    String profileId,
    Session session,
  ) async {
    final ({Profile originalProfile, Profile updatedProfile}) result = await profileService.updateProfileStatsWithSession(
      profileId,
      session,
    );
    return UpdateProfileStatsResult(
      oldProfile: result.originalProfile,
      updatedProfile: result.updatedProfile, 
      session: session,
    );
  }
}
