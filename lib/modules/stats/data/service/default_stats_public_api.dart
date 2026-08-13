import 'package:dhyana/modules/stats/data/mapper/stats_session_mapper.dart';
import 'package:dhyana/modules/stats/data/mapper/stats_bucket_mapper.dart';
import 'package:dhyana/modules/stats/domain/usecase/log_session_stats_use_case.dart';
import 'package:dhyana/modules/stats/domain/usecase/query_session_stats_use_case.dart';
import 'package:dhyana/modules/stats/public/api/stats_public_api.dart';
import 'package:dhyana/modules/stats/public/enum/stats_granularity.dart';
import 'package:dhyana/modules/stats/public/model/stats_bucket.dart';
import 'package:dhyana/modules/stats/public/model/stats_session.dart';
import 'package:dhyana/modules/stats/domain/repository/stats_repository.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';


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
    ).execute(profileId, session.toEntity());  

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
