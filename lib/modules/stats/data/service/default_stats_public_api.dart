import 'package:dhyana/modules/stats/data/mapper/insights_session_mapper.dart';
import 'package:dhyana/modules/stats/data/mapper/stats_bucket_mapper.dart';
import 'package:dhyana/modules/stats/data/mapper/stats_granularity_mapper.dart';
import 'package:dhyana/modules/stats/public/api/stats_public_api.dart';
import 'package:dhyana/modules/stats/public/enum/stats_granularity.dart';
import 'package:dhyana/modules/stats/public/model/stats_bucket.dart';
import 'package:dhyana/modules/stats/public/model/stats_session.dart';
import 'package:dhyana/modules/stats/domain/repository/statistics_repository.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';

class DefaultStatsPublicApi implements StatsPublicApi {
  final StatisticsRepository statisticsRepository;
  final ProfilePublicApi profilePublicApi;

  const DefaultStatsPublicApi({
    required this.statisticsRepository,
    required this.profilePublicApi,
  });

  @override
  Future<void> logSessionStatistics(
    String profileId,
    StatsSession session,
  ) async {
    final profile = await profilePublicApi.getProfile(profileId);
    final consecutiveDaysCount = profile.statsReport.consecutiveDays.current;
    return statisticsRepository.logSessionStatistics(
      profileId,
      session.toEntity(),
      consecutiveDaysCount,
    );
  }

  @override 
  Future<List<StatsBucket>> queryBuckets(
    String profileId, {
    required DateTime from,
    required DateTime to,
    required StatsGranularity granularity,
  }) async {
    final buckets = await statisticsRepository.queryBuckets(
      profileId,
      from: from,
      to: to,
      granularity: granularity.toEntity(),
    );

    return buckets.map((bucket) => bucket.toApi()).toList();
  }

}
