import 'dart:async';

import 'package:profile/src/domain/entity/profile_entity.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:core/core.dart';
import 'package:profile/src/domain/service/profile_stats_updater_service.dart';
import 'package:profile/src/domain/service/stats_audit_service.dart';

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
  final StatsAuditService? statsAuditService;

  LoadProfileUseCase({
    required this.profileRepository,
    required this.profileStatsUpdater,
    this.statsAuditService,
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

      // Audit the change
      unawaited(statsAuditService?.recordValidation(
        profile: profileEntity,
        validated: updatedStatsReport,
      ));

      // Update profile with the change
      profileEntity = profileEntity.copyWith(statsReport: updatedStatsReport);
      
      // lazy update the profile, no need to await this
      unawaited(profileRepository.update(profileEntity));
    }


    
    return profileEntity;
  }
}