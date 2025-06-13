import 'package:dhyana/util/date_time_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_interval.freezed.dart';
part 'stats_interval.g.dart';

@freezed
sealed class StatsInterval with _$StatsInterval {

  const StatsInterval._();

  const factory StatsInterval({
    required DateTime from,
    required DateTime to,
  }) = _StatsInterval;

  factory StatsInterval.days({
    required DateTime lastDay,
    int days = 7
  }) {
    DateTime to = lastDay.copyWith(
      day: lastDay.day + 1,
      hour: 0,
      minute: 0,
      second: 0,
    );
    DateTime from = to.copyWith(
      day: to.day - days,
    );
    return StatsInterval(
      from: from,
      to: to,
    );
  }

  factory StatsInterval.weeks({
    required DateTime day,
    int weeks = 8
  }) {
    StatsInterval interval = StatsInterval.thisWeek(day);
    return interval.copyWith(
      from: interval.from.copyWith(
        day: interval.from.day - (weeks - 1) * 7,
      )
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

  factory StatsInterval.thisWeek(DateTime today) {
    DateTime firstDayOfWeek = today.firstDayOfWeek().copyWith(
      hour: 0,
      minute: 0,
      second: 0,
    );
    return StatsInterval(
      from: firstDayOfWeek,
      to: firstDayOfWeek.copyWith(
        day: firstDayOfWeek.day + 7,
      )
    );
  }

  factory StatsInterval.thisMonth(DateTime today) {
    return StatsInterval(
      from: DateTime(today.year, today.month, 1),
      to: DateTime(today.year, today.month + 1, 1),
    );
  }

  factory StatsInterval.thisYear(DateTime today) {
    return StatsInterval(
      from: DateTime(today.year, 1, 1),
      to: DateTime(today.year + 1),
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
    List<StatsInterval> result = [
      firstInterval,
    ];
    for (var i = 0; i < intervalCount - 1; ++i) {
      result.add(
        firstInterval.copyWith(
          from: firstInterval.from.copyWith(
            day: firstInterval.from.day - (daysInInterval * (i + 1)),
          ),
          to: firstInterval.to.copyWith(
            day: firstInterval.to.day - (daysInInterval * (i + 1)),
          ),
        )
      );
    }
    return result;
  }

  static List<StatsInterval> generateWeekIntervals(
    DateTime now, {
      int weeksInInterval = 6,
      int intervalCount = 4,
  }) {
    StatsInterval thisWeek = StatsInterval.thisWeek(now);
    StatsInterval firstInterval = thisWeek.copyWith(
      from: thisWeek.from.copyWith(
        day: thisWeek.from.day - (weeksInInterval - 1) * 7,
      ),
    );

    List<StatsInterval> result = [
      firstInterval,
    ];

    // (weeksInInterval - 1) because first is already added
    for (var i = 1; i < intervalCount; i++) {
      result.add(
        firstInterval.copyWith(
          from: firstInterval.from.copyWith(
            day: firstInterval.from.day - (weeksInInterval) * 7 * i,
          ),
          to: firstInterval.to.copyWith(
            day: firstInterval.to.day - (weeksInInterval) * 7 * i,
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
          ),
          to: firstInterval.to.copyWith(
            month: (firstInterval.to.month - (monthsInInterval * (i + 1))),
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
          ),
          to: firstInterval.to.copyWith(
            year: firstInterval.to.year - (yearsInInterval * (i + 1)),
          )
        )
      );
    }
    return result;
  }

}
