import 'package:dhyana/modules/insights/data/mapper/insights_session_mapper.dart';
import 'package:dhyana/modules/insights/public/api/public_insights_api.dart';
import 'package:dhyana/modules/insights/public/model/insights_session.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';

class DefaultPublicInsightsApi implements PublicInsightsApi {

  final StatisticsRepository statisticsRepository;
  final ProfilePublicApi profilePublicApi;

  const DefaultPublicInsightsApi({
    required this.statisticsRepository,
    required this.profilePublicApi,
  });

  @override
  Future<void> logSessionStatistics(String profileId, InsightsSession session) async {
    final profile = await profilePublicApi.getProfile(profileId);
    final consecutiveDaysCount = profile.statsReport.consecutiveDays.current;
    return statisticsRepository.logSessionStatistics(profileId, session.toEntity(), consecutiveDaysCount);
  }
}