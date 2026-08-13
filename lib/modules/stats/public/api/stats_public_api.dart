import 'package:dhyana/modules/stats/public/enum/stats_granularity.dart';
import 'package:dhyana/modules/stats/public/model/stats_bucket.dart';
import 'package:dhyana/modules/stats/public/model/stats_session.dart';

abstract interface class StatsPublicApi {
  
  Future<void> logSessionStatistics(
    String profileId, 
    StatsSession session
  );

  Future<List<StatsBucket>> queryBuckets({
    required String profileId,
    required DateTime from,
    required DateTime to,
    required StatsGranularity granularity,
  });

}
