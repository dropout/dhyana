import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/domain/entity/profile/update_profile_stats_result.dart';
import 'package:dhyana/core/domain/repository/profile_repository.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/profile/data_update/profile_stats_report_updater.dart';

/// Persists a completed session into profile statistics and returns the updated profile.
class UpdateProfileWithSessionUseCase {
  final ProfileRepository profileRepository;

  UpdateProfileWithSessionUseCase({
    required this.profileRepository,
  });

  Future<UpdateProfileStatsResult> execute(String profileId, Session session) async {
    final profile = await profileRepository.read(profileId);

    final profileStatsUpdater = ProfileStatsReportUpdater();
    final UpdateProfileStatsResult updateResult =
      profileStatsUpdater.updateProfileStatsWithSession(
        profile,
        session,
      );

    await profileRepository.update(updateResult.updatedProfile);
    return updateResult;
  }
}
