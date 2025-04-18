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
    required DateTime lastDay,
    int days = 7
  }) {
    final DateTime to = DateTime.now();

    return StatsInterval(
      intervalType: StatsIntervalType.days,
      from: to.subtract(Duration(days: days - 1)),
      to: to.add(Duration(days: 1)),
    );
  }

  Duration get duration => from.difference(to);

  factory StatsInterval.fromJson(Map<String, Object?> json) =>
    _$StatsIntervalFromJson(json);

  static List<StatsInterval> generateDayIntervals(
    DateTime now,
    {
      int days = 8,
      int intervalCount = 4,
    }
  ) {
    StatsInterval firstInterval = StatsInterval.days(lastDay: now);
    return [
      firstInterval,
      StatsInterval(
        intervalType: StatsIntervalType.days,
        from: firstInterval.from.subtract(Duration(days: days)),
        to: firstInterval.to.subtract(Duration(days: days)),
      ),
      StatsInterval(
        intervalType: StatsIntervalType.days,
        from: firstInterval.from.subtract(Duration(days: days*2)),
        to: firstInterval.to.subtract(Duration(days: days*2)),
      ),
      StatsInterval(
        intervalType: StatsIntervalType.days,
        from: firstInterval.from.subtract(Duration(days: days*3)),
        to: firstInterval.to.subtract(Duration(days: days*3)),
      ),
    ];
  }

}
