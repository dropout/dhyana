import 'package:profile/profile.dart';
import 'package:stats/src/domain/entity/stats_session_entity.dart';
import 'package:stats/src/domain/repository/stats_repository.dart';

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