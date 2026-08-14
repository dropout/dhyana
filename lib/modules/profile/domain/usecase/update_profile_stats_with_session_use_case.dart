import 'package:dhyana/modules/profile/domain/entity/profile_entity.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_session_entity.dart';
import 'package:dhyana/modules/profile/domain/repository/profile_repository.dart';
import 'package:dhyana/modules/profile/domain/service/profile_stats_updater_service.dart';

/// Use case for updating profile statistics with a session.
/// This use case retrieves the original profile from the repository, updates its statistics
/// using the provided session, and returns both the original and updated profile entities.
class UpdateProfileStatsWithSessionUseCase {
  final ProfileRepository profileRepository;
  final ProfileStatsReportUpdaterService profileStatsReportUpdaterService;

  UpdateProfileStatsWithSessionUseCase({
    required this.profileRepository,
    required this.profileStatsReportUpdaterService,
  });

  Future<({ProfileEntity originalProfile, ProfileEntity updatedProfile})> execute(
    String profileId,
    ProfileSessionEntity session,
  ) async {
    final originalProfile = await profileRepository.readStream(profileId).first;
    final updatedProfile = profileStatsReportUpdaterService.updateProfileStatsWithSession(
      originalProfile,
      session,
    );
    return (originalProfile: originalProfile, updatedProfile: updatedProfile);
  }
}
