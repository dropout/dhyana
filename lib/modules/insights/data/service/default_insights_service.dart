import 'package:dhyana/core/service/module/insights_service.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';

class DefaultInsightsService implements InsightsService {

  final StatisticsRepository statisticsRepository;
  const DefaultInsightsService({
    required this.statisticsRepository,
  });

  @override
  Future<void> logSessionStatistics(String profileId, Session session) async {
    return statisticsRepository.logSessionStatistics(profileId, session);
  }
}