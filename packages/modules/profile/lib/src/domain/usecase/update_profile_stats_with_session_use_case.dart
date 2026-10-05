import 'dart:async';

import 'package:profile/src/domain/entity/profile_entity.dart';
import 'package:profile/src/domain/entity/profile_session_entity.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/domain/service/profile_stats_updater_service.dart';
import 'package:profile/src/domain/service/stats_audit_service.dart';

/// Use case for updating profile statistics with a session.
/// This use case retrieves the original profile from the repository, updates its statistics
/// using the provided session, and returns both the original and updated profile entities.
class UpdateProfileStatsWithSessionUseCase({
  required final ProfileRepository profileRepository,
  required final ProfileStatsReportUpdaterService profileStatsReportUpdaterService,
  final StatsAuditService? statsAuditService,
}) {

  Future<({ProfileEntity originalProfile, ProfileEntity updatedProfile})> execute(
    String profileId,
    ProfileSessionEntity session,
  ) async {
    final originalProfile = await profileRepository.read(profileId, preferCache: false);
    final updatedProfile = profileStatsReportUpdaterService.updateProfileStatsWithSession(
      originalProfile,
      session,
    );
    await profileRepository.update(updatedProfile);
    unawaited(statsAuditService?.recordSession(
      original: originalProfile,
      updated: updatedProfile,
      sessionStart: session.startTime,
      usedCache: true,
    ));
    return (
      originalProfile: originalProfile, 
      updatedProfile: updatedProfile
    );
  }
  
}
