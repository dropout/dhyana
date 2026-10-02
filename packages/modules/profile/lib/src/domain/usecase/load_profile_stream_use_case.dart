import 'dart:async';

import 'package:core/core.dart';
import 'package:profile/src/domain/entity/profile_entity.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/domain/service/profile_stats_updater_service.dart';
import 'package:profile/src/domain/service/stats_audit_service.dart';

class LoadProfileStreamUseCase with LoggerMixin {
  final ProfileRepository profileRepository;
  final ProfileStatsReportUpdaterService profileStatsUpdater;
  final StatsAuditService? statsAuditService;

  LoadProfileStreamUseCase({
    required this.profileRepository,
    required this.profileStatsUpdater,
    this.statsAuditService,
  });

  Stream<ProfileEntity> execute(String profileId, {bool preferCache = false}) =>
      profileRepository.readStream(profileId).map((profileEntity) {
      
      // Check if consecutive days are valid
      final updatedStatsReport = 
        profileStatsUpdater.validateStatsReport(profileEntity.statsReport);

      if (updatedStatsReport != profileEntity.statsReport) {
        logger.t(
          'Consecutive days and milestone progress have been invalidated!',
        );
        unawaited(statsAuditService?.recordValidation(
          profile: profileEntity,
          validated: updatedStatsReport,
        ));
        profileEntity = profileEntity.copyWith(statsReport: updatedStatsReport);
      
        // lazy update the profile
        profileRepository.update(profileEntity);
      }
      
      return profileEntity;
    });
}
