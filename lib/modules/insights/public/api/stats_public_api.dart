import 'package:dhyana/modules/insights/public/enum/stats_granularity.dart';
import 'package:dhyana/modules/insights/public/model/stats_bucket.dart';
import 'package:dhyana/modules/insights/public/model/stats_session.dart';

abstract interface class StatsPublicApi {
  Future<void> logSessionStatistics(String profileId, StatsSession session);

  Future<List<StatsBucket>> queryBuckets(
    String profileId, {
    required DateTime from,
    required DateTime to,
    required StatsGranularity granularity,
  });
}
