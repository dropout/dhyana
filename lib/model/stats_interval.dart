import 'package:dhyana/enum/stats_interval_type.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_interval.freezed.dart';
part 'stats_interval.g.dart';

@freezed
class StatsInterval with _$StatsInterval {

  const StatsInterval._();

  const factory StatsInterval({
    required StatsIntervalType intervalType,
    required DateTime from,
    required DateTime to,
  }) = _StatsInterval;

  factory StatsInterval.days({
    required DateTime now,
  }) {
    final DateTime now = DateTime.now();
    return StatsInterval(
      intervalType: StatsIntervalType.days,
      from: mostRecentMonday(now).subtract(Duration(days: 7)),
      to: mostRecentMonday(now).add(Duration(days: 7)),
    );
  }

  Duration get duration => from.difference(to);

  factory StatsInterval.fromJson(Map<String, Object?> json) =>
    _$StatsIntervalFromJson(json);

  static List<StatsInterval> generateDayIntervals(DateTime now) {
    StatsInterval firstInterval = StatsInterval.days(now: now);
    return [
      firstInterval,
      StatsInterval(
        intervalType: StatsIntervalType.days,
        from: firstInterval.from.subtract(Duration(days: 14)),
        to: firstInterval.to.subtract(Duration(days: 14)),
      ),
      StatsInterval(
        intervalType: StatsIntervalType.days,
        from: firstInterval.from.subtract(Duration(days: 14*2)),
        to: firstInterval.to.subtract(Duration(days: 14*2)),
      ),
      StatsInterval(
        intervalType: StatsIntervalType.days,
        from: firstInterval.from.subtract(Duration(days: 14*3)),
        to: firstInterval.to.subtract(Duration(days: 14*3)),
      ),
    ];
  }

}
