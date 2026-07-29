import 'package:dhyana/core/domain/repository/profile_repository.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/profile/data_update/profile_stats_report_updater.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';

/// Use case for loading a profile and validating its statistics report.
/// Validating the statistics report ensures that the consecutive days
/// and milestone progress are accurate and up-to-date,
/// since this is validated on the client side
/// and not on the server side. (For now...)
class LoadProfileUseCase with LoggerMixin {
  
  /// The repository responsible for fetching and updating profile data.
  final ProfileRepository profileRepository;

  /// The updater responsible for validating and updating the profile's statistics report.
  final ProfileStatsReportUpdater profileStatsUpdater;
    
  LoadProfileUseCase({
    required this.profileRepository,
    required this.profileStatsUpdater,
  });

  Future<Profile> execute(String profileId) async {
    // Load the profile from the repository
    Profile profile = await profileRepository.read(profileId);

    // Check if consecutive days are valid
    final updatedStatsReport = 
      profileStatsUpdater.validateStatsReport(profile.statsReport);

    if (updatedStatsReport != profile.statsReport) {
      logger.t(
        'Consecutive days and milestone progress have been invalidated!',
      );
      profile = profile.copyWith(statsReport: updatedStatsReport);
      
      // lazy update the profile
      profileRepository.update(profile);
    }
    return profile;
  }
}