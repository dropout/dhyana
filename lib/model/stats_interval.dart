import 'package:dhyana/enum/stats_interval_type.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_interval.freezed.dart';
part 'stats_interval.g.dart';

@freezed
class StatsInterval with _$StatsInterval {

  const StatsInterval._();

  const factory StatsInterval({
    required DateTime from,
    required DateTime to,
  }) = _StatsInterval;

  factory StatsInterval.days({
    required DateTime lastDay,
    int days = 7 // one week
  }) {
    DateTime to = lastDay.copyWith(
      hour: 23,
      minute: 59,
      second: 59,
    );
    DateTime from = lastDay.subtract(Duration(days: days - 1));
    from = from.copyWith(
      hour: 0,
      minute: 0,
      second: 0,
    );
    return StatsInterval(
      from: from,
      to: to,
    );
  }

  factory StatsInterval.weeks({
    required DateTime day,
    int weeks = 8 // two months
  }) {
    StatsInterval interval = StatsInterval.thisWeek(day);
    return interval.copyWith(
      from: interval.from.subtract(
        Duration(
          days: (weeks - 1) * 7 // current week included
        )
      ),
    );
  }

  factory StatsInterval.months({
    required DateTime day,
    int months = 6 // half a year
  }) {
    StatsInterval interval = StatsInterval.thisMonth(day);
    return interval.copyWith(
      from: interval.from.copyWith(
        month: interval.from.month - (months - 1) * 1,
      ),
    );
  }

  factory StatsInterval.years({
    required DateTime day,
    int years = 6 // two years
  }) {
    StatsInterval interval = StatsInterval.thisYear(day);
    return interval.copyWith(
      from: interval.from.copyWith(
        year: interval.from.year - (years - 1) * 1,
      ),
    );
  }

  factory StatsInterval.thisWeek(DateTime day) {
    return StatsInterval(
      from: day.firstDayOfWeek(),
      to: day.lastDayOfWeek().copyWith(
        hour: 23,
        minute: 59,
        second: 59,
      )
    );
  }

  factory StatsInterval.thisMonth(DateTime day) {
    return StatsInterval(
      from: DateTime(day.year, day.month, 1, 0, 0, 0),
      to: DateTime(day.year, day.month + 1, 0, 23, 59, 59),
    );
  }

  factory StatsInterval.thisYear(DateTime day) {
    return StatsInterval(
      from: DateTime(day.year, 1, 1),
      to: DateTime(day.year + 1, 1, 0).copyWith(
        hour: 23,
        minute: 59,
        second: 59,
      )
    );
  }

  Duration get duration => from.difference(to);

  factory StatsInterval.fromJson(Map<String, Object?> json) =>
    _$StatsIntervalFromJson(json);

  static List<StatsInterval> generateDayIntervals(
    DateTime now, {
      int daysInInterval = 7,
      int intervalCount = 4,
  }) {
    StatsInterval firstInterval = StatsInterval.days(lastDay: now);
    return [
      firstInterval,
      StatsInterval(
        from: firstInterval.from.subtract(Duration(days: daysInInterval)),
        to: firstInterval.to.subtract(Duration(days: daysInInterval)),
      ),
      StatsInterval(
        from: firstInterval.from.subtract(Duration(days: daysInInterval*2)),
        to: firstInterval.to.subtract(Duration(days: daysInInterval*2)),
      ),
      StatsInterval(
        from: firstInterval.from.subtract(Duration(days: daysInInterval*3)),
        to: firstInterval.to.subtract(Duration(days: daysInInterval*3)),
      ),
    ];
  }

  static List<StatsInterval> generateWeekIntervals(
    DateTime now, {
      int weeksInInterval = 4,
      int intervalCount = 4,
  }) {
    StatsInterval thisWeek = StatsInterval.thisWeek(now);
    StatsInterval firstInterval = thisWeek.copyWith(
      from: thisWeek.from.subtract(
        Duration(days: (weeksInInterval - 1) * 7),
      ),
    );

    List<StatsInterval> result = [
      firstInterval,
    ];

    for (var i = 0; i < intervalCount - 1; ++i) {
      result.add(
        firstInterval.copyWith(
          from: firstInterval.from.subtract(
            Duration(days: weeksInInterval * (i + 1) * 7),
          ),
          to: firstInterval.to.subtract(
            Duration(days: weeksInInterval * (i + 1) * 7),
          ),
        )
      );
    }

    return result;
  }

  static List<StatsInterval> generateMonthIntervals(
    DateTime now, {
      int monthsInInterval = 6,
      int intervalCount = 4,
  }) {
    StatsInterval thisMonth = StatsInterval.thisMonth(now);
    StatsInterval firstInterval = thisMonth.copyWith(
      from: thisMonth.from.copyWith(
        month: thisMonth.from.month - (monthsInInterval - 1),
        day: 1,
        hour: 0,
        minute: 0,
      ),
    );

    List<StatsInterval> result = [
      firstInterval,
    ];

    for (var i = 0; i < intervalCount - 1; ++i) {
      result.add(
        firstInterval.copyWith(
          from: firstInterval.from.copyWith(
            month: firstInterval.from.month - (monthsInInterval * (i + 1)),
            hour: 0,
            minute: 0,
          ),
          to: firstInterval.to.copyWith(
            month: (firstInterval.to.month - (monthsInInterval * (i + 1))) + 1,
            day: 0,
            hour: 23,
            minute: 59,
          )
        )
      );
    }

    return result;
  }

  static List<StatsInterval> generateYearIntervals(
    DateTime now, {
      int yearsInInterval = 6,
      int intervalCount = 4,
  }) {
    StatsInterval thisYear = StatsInterval.thisYear(now);
    StatsInterval firstInterval = thisYear.copyWith(
      from: thisYear.from.copyWith(
        year: thisYear.from.year - (yearsInInterval - 1),
        month: 1,
        day: 1,
        hour: 0,
        minute: 0,
      ),
    );

    List<StatsInterval> result = [
      firstInterval,
    ];

    for (var i = 0; i < intervalCount - 1; ++i) {
      result.add(
        firstInterval.copyWith(
          from: firstInterval.from.copyWith(
            year: firstInterval.from.year - (yearsInInterval * (i + 1)),
            month: 1,
            day: 1,
            hour: 0,
            minute: 0,
          ),
          to: firstInterval.to.copyWith(
            year: firstInterval.to.year - (yearsInInterval * (i + 1)) + 1,
            month: 1,
            day: 0,
            hour: 23,
            minute: 59,
          )
        )
      );
    }

    return result;
  }

}
