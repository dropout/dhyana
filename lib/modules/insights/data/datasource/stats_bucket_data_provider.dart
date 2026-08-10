import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/insights/domain/entity/stats_bucket_entity.dart';

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
