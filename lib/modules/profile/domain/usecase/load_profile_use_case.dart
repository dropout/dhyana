import 'package:dhyana/modules/profile/domain/entity/profile_entity.dart';
import 'package:dhyana/modules/profile/domain/repository/profile_repository.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/modules/profile/domain/service/profile_stats_updater_service.dart';

/// Use case for loading a profile and validating its statistics report.
/// Validating the statistics report ensures that the consecutive days
/// and milestone progress are accurate and up-to-date,
/// since this is validated on the client side
/// and not on the server side. (For now...)
class LoadProfileUseCase with LoggerMixin {
  
  /// The repository responsible for fetching and updating profile data.
  final ProfileRepository profileRepository;

  /// The updater responsible for validating and updating the profile's statistics report.
  final ProfileStatsReportUpdaterService profileStatsUpdater;
    
  LoadProfileUseCase({
    required this.profileRepository,
    required this.profileStatsUpdater,
  });

  Future<ProfileEntity> execute(String profileId, {bool preferCache = false}) async {
    // Load the profile from the repository
    var profileEntity = await profileRepository.read(
      profileId, preferCache: preferCache
    );

    // Check if consecutive days are valid
    final updatedStatsReport = 
      profileStatsUpdater.validateStatsReport(profileEntity.statsReport);

    if (updatedStatsReport != profileEntity.statsReport) {
      logger.t(
        'Consecutive days and milestone progress have been invalidated!',
      );
      profileEntity = profileEntity.copyWith(statsReport: updatedStatsReport);
      
      // lazy update the profile, no need to await this
      profileRepository.update(profileEntity);
    }
    
    return profileEntity;
  }
}