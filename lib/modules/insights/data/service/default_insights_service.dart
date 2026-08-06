import 'package:dhyana/core/service/module/insights_service.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';

class DefaultInsightsService implements InsightsService {

  final StatisticsRepository statisticsRepository;
  final ProfilePublicApi profilePublicApi;

  const DefaultInsightsService({
    required this.statisticsRepository,
    required this.profilePublicApi,
  });

  @override
  Future<void> logSessionStatistics(String profileId, Session session) async {
    final profile = await profilePublicApi.getProfile(profileId);
    final consecutiveDaysCount = profile.statsReport.consecutiveDays.current;
    return statisticsRepository.logSessionStatistics(profileId, session, consecutiveDaysCount);
  }
}