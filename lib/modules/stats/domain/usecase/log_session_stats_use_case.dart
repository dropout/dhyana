import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';
import 'package:dhyana/modules/stats/domain/entity/insights_session_entity.dart';
import 'package:dhyana/modules/stats/domain/repository/stats_repository.dart';

class LogSessionStatsUseCase {

  final StatsRepository statsRepository;
  final ProfilePublicApi profilePublicApi;

  const LogSessionStatsUseCase({
    required this.statsRepository,
    required this.profilePublicApi,
  });

  Future<void> execute(
    String profileId,
    StatsSessionEntity session,
  ) async {
    final profile = await profilePublicApi.getProfile(profileId, preferCache: true);
    final consecutiveDaysCount = profile.statsReport.consecutiveDays.current;
    return statsRepository.logSessionStats(
      profileId,
      session,
      consecutiveDaysCount,
    );
  }
  
}