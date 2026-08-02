import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/modules/profile/domain/repository/profile_repository.dart';
import 'package:dhyana/core/service/module/profile_service.dart';
import 'package:dhyana/modules/profile/data/service/default_profile_stats_report_updater_service.dart';

class DefaultProfileService implements ProfileService {
  final ProfileRepository profileRepository;
  final DefaultProfileReportUpdaterService profileStatsReportUpdaterService;

  const DefaultProfileService({
    required this.profileRepository,
    required this.profileStatsReportUpdaterService,
  });

  @override
  Future<Profile> loadProfile(String profileId) async {
    final profile = await profileRepository.readStream(profileId).first;
    return profile;
  }

  @override
  Stream<Profile> readStream(String profileId) =>
    profileRepository.readStream(profileId);

  @override
  Future<({Profile originalProfile, Profile updatedProfile})> updateProfileStatsWithSession(
    String profileId,
    Session session,
  ) async {
    final originalProfile = await profileRepository.readStream(profileId).first;
    final updatedProfile = profileStatsReportUpdaterService.updateProfileStatsWithSession(
      originalProfile,
      session,
    );
    return (originalProfile: originalProfile, updatedProfile: updatedProfile);
  }
}