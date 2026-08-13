import 'package:dhyana/modules/stats/data/mapper/stats_granularity_mapper.dart';
import 'package:dhyana/modules/stats/domain/entity/stats_bucket_entity.dart';
import 'package:dhyana/modules/stats/domain/repository/stats_repository.dart';
import 'package:dhyana/modules/stats/public/enum/stats_granularity.dart';

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
