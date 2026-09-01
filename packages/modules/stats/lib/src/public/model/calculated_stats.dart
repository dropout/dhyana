import 'package:stats/src/public/model/stats_bucket.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculated_stats.freezed.dart';

@freezed
sealed class CalculatedStats with _$CalculatedStats {

  const factory CalculatedStats({
    @Default(0) int totalMinutes,
    @Default(0) double averageMinutes,
    @Default(0) int totalSessions,
    @Default(0) double averageSessions,
  }) = _CalculatedStats;

  factory CalculatedStats.fromStatsBuckets(List<StatsBucket> buckets) {
    int totalMinutes = 0;
    int totalSessions = 0;

    for (var bucket in buckets) {
      totalMinutes += bucket.minutesCount;
      totalSessions += bucket.sessionCount;
    }

    double averageMinutes = buckets.isEmpty ? 0 : totalMinutes / buckets.length;
    double averageSessions = buckets.isEmpty ? 0 : totalSessions / buckets.length;

    return CalculatedStats(
      totalMinutes: totalMinutes,
      averageMinutes: averageMinutes,
      totalSessions: totalSessions,
      averageSessions: averageSessions,
    );
  }

}
