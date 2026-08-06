import 'package:dhyana/modules/profile/data/mapper/profile_mapper.dart';
import 'package:dhyana/modules/profile/data/mapper/profile_session_mapper.dart';
import 'package:dhyana/modules/profile/domain/repository/profile_repository.dart';
import 'package:dhyana/modules/profile/domain/service/profile_stats_updater_service.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';
import 'package:dhyana/modules/profile/public/model/profile.dart';
import 'package:dhyana/modules/profile/public/model/profile_session.dart';

class DefaultProfilePublicApi implements ProfilePublicApi {

  final ProfileRepository profileRepository;
  final ProfileStatsReportUpdaterService profileStatsReportUpdaterService;

  DefaultProfilePublicApi({
    required this.profileRepository,
    required this.profileStatsReportUpdaterService,
  });

  @override
  Future<Profile> getProfile(String profileId) => 
    profileRepository.read(profileId).then((profileEntity) => profileEntity.toApi());

  @override
  Stream<Profile> getProfileStream(String profileId) =>
    profileRepository.readStream(profileId).map((profileEntity) => profileEntity.toApi());

  @override
  Future<void> updateProfile(Profile updatedProfile) =>
    profileRepository.update(updatedProfile.toDomain());

  @override
  Future<({Profile originalProfile, Profile updatedProfile})> updateProfileStatsWithSession(
    String profileId,
    ProfileSession session,
  ) async {
    final originalProfile = await profileRepository.readStream(profileId).first;
    final updatedProfile = profileStatsReportUpdaterService.updateProfileStatsWithSession(
      originalProfile,
      session.toDomain(),
    );
    return (originalProfile: originalProfile.toApi(), updatedProfile: updatedProfile.toApi());
  }


}