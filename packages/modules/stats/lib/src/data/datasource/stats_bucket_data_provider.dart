import 'package:core/core.dart';
import 'package:stats/src/domain/entity/stats_bucket_entity.dart';

abstract interface class StatsBucketDataProvider
    implements DataProvider<StatsBucketEntity> {
  Future<void> set(
    StatsBucketEntity bucket, {
    bool merge,
    List<Object>? mergeFields,
  });

  Future<List<StatsBucketEntity>> query({
    required DateTime from,
    required DateTime to,
  });

  Stream<List<StatsBucketEntity>> queryStream({
    required DateTime from,
    required DateTime to,
  });
}
