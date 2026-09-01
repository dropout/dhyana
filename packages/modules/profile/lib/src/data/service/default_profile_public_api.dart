import 'package:core/core.dart';
import 'package:profile/src/data/mapper/profile_mapper.dart';
import 'package:profile/src/data/mapper/profile_session_mapper.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/domain/service/profile_stats_updater_service.dart';
import 'package:profile/src/domain/usecase/load_profile_stream_use_case.dart';
import 'package:profile/src/domain/usecase/load_profile_use_case.dart';
import 'package:profile/src/domain/usecase/update_profile_stats_with_session_use_case.dart';
import 'package:profile/src/public/api/profile_public_api.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/model/profile_session.dart';

class DefaultProfilePublicApi implements ProfilePublicApi {

  final ProfileRepository profileRepository;
  final ProfileStatsReportUpdaterService profileStatsUpdater;
  final StorageRepository storageRepository;

  DefaultProfilePublicApi({
    required this.profileRepository,
    required this.profileStatsUpdater,
    required this.storageRepository,
  });

  @override
  Future<Profile> getProfile(String profileId, {bool preferCache = false}) => 
    LoadProfileUseCase(
      profileRepository: profileRepository,
      profileStatsUpdater: profileStatsUpdater,
    ).execute(profileId, preferCache: preferCache).then((profileEntity) => profileEntity.toApi());

  @override
  Stream<Profile> getProfileStream(String profileId) =>
    LoadProfileStreamUseCase(
      profileRepository: profileRepository,
      profileStatsUpdater: profileStatsUpdater,
    ).execute(profileId).map((profileEntity) => profileEntity.toApi());

  @override
  Future<({Profile originalProfile, Profile updatedProfile})> updateProfileStatsWithSession(
    String profileId,
    ProfileSession session,
  ) async => UpdateProfileStatsWithSessionUseCase(
    profileRepository: profileRepository,
    profileStatsReportUpdaterService: profileStatsUpdater,
  ).execute(profileId, session.toDomain()).then((result) => (
    originalProfile: result.originalProfile.toApi(),
    updatedProfile: result.updatedProfile.toApi(),
  ));

}