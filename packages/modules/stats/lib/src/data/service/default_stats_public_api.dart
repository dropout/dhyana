import 'package:stats/src/data/mapper/stats_bucket_mapper.dart';
import 'package:stats/src/data/mapper/stats_session_mapper.dart';
import 'package:stats/src/domain/usecase/log_session_stats_use_case.dart';
import 'package:stats/src/domain/usecase/query_session_stats_use_case.dart';
import 'package:stats/src/public/api/stats_public_api.dart';
import 'package:stats/src/public/enum/stats_granularity.dart';
import 'package:stats/src/public/model/stats_bucket.dart';
import 'package:stats/src/public/model/stats_session.dart';
import 'package:stats/src/domain/repository/stats_repository.dart';
import 'package:profile/profile.dart';


class DefaultStatsPublicApi implements StatsPublicApi {
  final StatsRepository statisticsRepository;
  final ProfilePublicApi profilePublicApi;

  const DefaultStatsPublicApi({
    required this.statisticsRepository,
    required this.profilePublicApi,
  });

  @override
  Future<void> logSessionStatistics(
    String profileId,
    StatsSession session,
  ) async => LogSessionStatsUseCase(
      statsRepository: statisticsRepository,
      profilePublicApi: profilePublicApi,
    ).execute(profileId, session.toDomain());  

  @override 
  Future<List<StatsBucket>> queryBuckets({
    required String profileId,
    required DateTime from,
    required DateTime to,
    required StatsGranularity granularity,
  }) async => QuerySessionStatsUseCase(
      repository: statisticsRepository,
    ).execute(
      profileId: profileId,
      from: from,
      to: to,
      granularity: granularity,
    ).then((buckets) => buckets.map((bucket) => bucket.toApi()).toList());

}
