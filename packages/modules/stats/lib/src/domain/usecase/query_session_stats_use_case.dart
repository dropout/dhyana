import 'package:stats/src/data/mapper/stats_granularity_mapper.dart';
import 'package:stats/src/domain/entity/stats_bucket_entity.dart';
import 'package:stats/src/domain/repository/stats_repository.dart';
import 'package:stats/src/public/enum/stats_granularity.dart';

/// Use case for querying statistics buckets from the repository.
class QuerySessionStatsUseCase {

  final StatsRepository repository;

  const QuerySessionStatsUseCase({
    required this.repository,
  });

  Future<List<StatsBucketEntity>> execute({
    required String profileId, 
    required DateTime from,
    required DateTime to,
    required StatsGranularity granularity,
  }) async => repository.queryBuckets(
      profileId,
      from: from,
      to: to,
      granularity: granularity.toEntity(),
    );

}
