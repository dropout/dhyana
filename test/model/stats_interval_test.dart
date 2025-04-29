import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('StatsInterval', () {

    ////////////////////////////////////////////////////////////////////////////
    // DAYS
    ////////////////////////////////////////////////////////////////////////////

    test('can generate a single interval based on days default settings', () {
      StatsInterval interval = StatsInterval.days(
        lastDay: DateTime(2025, 4, 26, 9, 53),
      );
      expect(interval.from, DateTime(2025, 4, 20, 0, 0));
      expect(interval.to, DateTime(2025, 4, 26, 23, 59, 59));
    });

    test('can generate a single interval based on days a single day', () {
      StatsInterval interval = StatsInterval.days(
        lastDay: DateTime(2025, 4, 26, 9, 53),
        days: 1,
      );
      expect(interval.from, DateTime(2025, 4, 26, 0, 0));
      expect(interval.to, DateTime(2025, 4, 26, 23, 59, 59));
    });

    test('can generate a single interval based on days 2 days', () {
      StatsInterval interval = StatsInterval.days(
        lastDay: DateTime(2025, 4, 26, 9, 53),
        days: 2,
      );
      expect(interval.from, DateTime(2025, 4, 25, 0, 0));
      expect(interval.to, DateTime(2025, 4, 26, 23, 59, 59));
    });

    test('can generate intervals for querying days', () {

      List<StatsInterval> intervals =
        StatsInterval.generateDayIntervals(DateTime(2025, 4, 26, 9, 53));
      expect(intervals.length, 4);

      // first week
      expect(intervals[0].from, DateTime(2025, 4, 20, 0, 0));
      expect(intervals[0].to, DateTime(2025, 4, 26, 23, 59, 59));

      // second week
      expect(intervals[1].from, DateTime(2025, 4, 13, 0, 0));
      expect(intervals[1].to, DateTime(2025, 4, 19, 23, 59, 59));

      // third week
      expect(intervals[2].from, DateTime(2025, 4, 6, 0, 0));
      expect(intervals[2].to, DateTime(2025, 4, 12, 23, 59, 59));

      // fourth week
      // 29th because of March month days length
      // 1 hour difference inf from date because of DST
      expect(intervals[3].from, DateTime(2025, 3, 29, 23, 0));
      expect(intervals[3].to, DateTime(2025, 4, 5, 23, 59, 59));

    });

    ////////////////////////////////////////////////////////////////////////////
    // WEEKS
    ////////////////////////////////////////////////////////////////////////////

    test('can generate the interval for the the week given a day on the week', () {
      StatsInterval interval = StatsInterval.thisWeek(
        DateTime(2025, 4, 26, 9, 53),
      );
      expect(interval.from, DateTime(2025, 4, 21, 0, 0));
      expect(interval.to, DateTime(2025, 4, 27, 23, 59, 59));
    });

    test('can generate a single interval based on weeks default settings', () {
      StatsInterval interval = StatsInterval.weeks(
        day: DateTime(2025, 4, 26, 9, 53),
      );
      // minus 1 hour because of DST
      expect(interval.from, DateTime(2025, 3, 2, 23, 0));
      expect(interval.to, DateTime(2025, 4, 27, 23, 59, 59));
    });

    test('can generate a single interval based on weeks for just two weeks', () {
      StatsInterval interval = StatsInterval.weeks(
        day: DateTime(2025, 4, 26, 9, 53),
        weeks: 2,
      );
      // minus 1 hour because of DST
      expect(interval.from, DateTime(2025, 4, 14, 00, 0));
      expect(interval.to, DateTime(2025, 4, 27, 23, 59, 59));
    });

    test('can generate intervals for querying weeks', () {

      List<StatsInterval> intervals =
        StatsInterval.generateWeekIntervals(DateTime(2025, 4, 26, 9, 53));
      expect(intervals.length, 4);

      // first month
      expect(intervals[0].from, DateTime(2025, 3, 31, 0, 0));
      expect(intervals[0].to, DateTime(2025, 4, 27, 23, 59, 59));

      // second month
      // minus 1 hour because of DST
      expect(intervals[1].from, DateTime(2025, 3, 2, 23, 0));
      expect(intervals[1].to, DateTime(2025, 3, 30, 23, 59, 59));

      // third month
      expect(intervals[2].from, DateTime(2025, 2, 2, 23, 0));
      expect(intervals[2].to, DateTime(2025, 3, 2, 22, 59, 59));

      // fourth week
      expect(intervals[3].from, DateTime(2025, 1, 5, 23, 0));
      expect(intervals[3].to, DateTime(2025, 2, 2, 22, 59, 59));

    });

    ////////////////////////////////////////////////////////////////////////////
    // MONTHS
    ////////////////////////////////////////////////////////////////////////////

    test('can generate the interval for the month given a day on the month', () {
      StatsInterval interval = StatsInterval.thisMonth(
        DateTime(2025, 4, 26, 9, 53),
      );
      expect(interval.from, DateTime(2025, 4, 1, 0, 0));
      expect(interval.to, DateTime(2025, 4, 30, 23, 59, 59));
    });

    test('can generate a single interval based on months default settings', () {
      StatsInterval interval = StatsInterval.months(
        day: DateTime(2025, 4, 26, 9, 53),
      );
      expect(interval.from, DateTime(2024, 11, 1, 0, 0));
      expect(interval.to, DateTime(2025, 4, 30, 23, 59, 59));
    });

    test('can generate a single interval based on months for two month', () {
      StatsInterval interval = StatsInterval.months(
        day: DateTime(2025, 4, 26, 9, 53),
        months: 2,
      );
      expect(interval.from, DateTime(2025, 3, 1, 0, 0));
      expect(interval.to, DateTime(2025, 4, 30, 23, 59, 59));
    });

    test('can generate intervals for querying months', () {

      List<StatsInterval> intervals =
        StatsInterval.generateMonthIntervals(DateTime(2025, 4, 26, 9, 53));
      expect(intervals.length, 4);

      // first month
      expect(intervals[0].from, DateTime(2024, 11, 1, 0, 0));
      expect(intervals[0].to, DateTime(2025, 4, 30, 23, 59, 59));

      // second month
      expect(intervals[1].from, DateTime(2024, 5, 1, 0, 0));
      expect(intervals[1].to, DateTime(2024, 10, 31, 23, 59, 59));

      // third month
      expect(intervals[2].from, DateTime(2023, 11, 1, 0, 0));
      expect(intervals[2].to, DateTime(2024, 4, 30, 23, 59, 59));

      // fourth month
      expect(intervals[3].from, DateTime(2023, 5, 1));
      expect(intervals[3].to, DateTime(2023, 10, 31, 23, 59, 59));

    });

    ////////////////////////////////////////////////////////////////////////////
    // YEARS
    ////////////////////////////////////////////////////////////////////////////

    test('can generate the interval for the year given a day on the year', () {
      StatsInterval interval = StatsInterval.thisYear(
        DateTime(2025, 4, 26, 9, 53),
      );
      expect(interval.from, DateTime(2025, 1, 1, 0, 0));
      expect(interval.to, DateTime(2025, 12, 31, 23, 59, 59));
    });

    test('can generate a single interval based on years default settings', () {
      StatsInterval interval = StatsInterval.years(
        day: DateTime(2025, 4, 26, 9, 53),
      );
      expect(interval.from, DateTime(2020, 1, 1, 0, 0));
      expect(interval.to, DateTime(2025, 12, 31, 23, 59, 59));
    });

    test('can generate a single interval based on years for two years', () {
      StatsInterval interval = StatsInterval.years(
        day: DateTime(2025, 4, 26, 9, 53),
        years: 2,
      );
      expect(interval.from, DateTime(2024, 1, 1, 0, 0));
      expect(interval.to, DateTime(2025, 12, 31, 23, 59, 59));
    });

    test('can generate intervals for querying years', () {

      List<StatsInterval> intervals =
        StatsInterval.generateYearIntervals(DateTime(2025, 4, 26, 9, 53));
      expect(intervals.length, 4);

      // first year
      expect(intervals[0].from, DateTime(2020, 1, 1, 0, 0));
      expect(intervals[0].to, DateTime(2025, 12, 31, 23, 59, 59));

      // second year
      expect(intervals[1].from, DateTime(2014, 1, 1));
      expect(intervals[1].to, DateTime(2019, 12, 31, 23, 59, 59));

      // third year
      expect(intervals[2].from, DateTime(2008, 1, 1));
      expect(intervals[2].to, DateTime(2013, 12, 31, 23, 59, 59));

      // fourth year
      expect(intervals[3].from, DateTime(2002, 1, 1));
      expect(intervals[3].to, DateTime(2007, 12, 31, 23, 59, 59));

    });

  });

}
