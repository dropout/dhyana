import 'package:dhyana/model/stats_interval.dart';
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
      expect(interval.from, DateTime(2025, 4, 20));
      expect(interval.to, DateTime(2025, 4, 27));
    });

    test('can generate a single interval based on days a single day', () {
      StatsInterval interval = StatsInterval.days(
        lastDay: DateTime(2025, 4, 26, 9, 53),
        days: 1,
      );
      expect(interval.from, DateTime(2025, 4, 26));
      expect(interval.to, DateTime(2025, 4, 27));
    });

    test('can generate a single interval based on days 2 days', () {
      StatsInterval interval = StatsInterval.days(
        lastDay: DateTime(2025, 4, 26, 9, 53),
        days: 2,
      );
      expect(interval.from, DateTime(2025, 4, 25));
      expect(interval.to, DateTime(2025, 4, 27));
    });

    test('can generate intervals for querying days', () {

      List<StatsInterval> intervals =
        StatsInterval.generateDayIntervals(DateTime(2025, 4, 26, 9, 53));
      expect(intervals.length, 4);

      // first week
      expect(intervals[0].from, DateTime(2025, 4, 20));
      expect(intervals[0].to, DateTime(2025, 4, 27));

      // second week
      expect(intervals[1].from, DateTime(2025, 4, 13));
      expect(intervals[1].to, DateTime(2025, 4, 20));

      // third week
      expect(intervals[2].from, DateTime(2025, 4, 6));
      expect(intervals[2].to, DateTime(2025, 4, 13));

      // fourth week
      expect(intervals[3].from, DateTime(2025, 3, 30));
      expect(intervals[3].to, DateTime(2025, 4, 6));

    });

    ////////////////////////////////////////////////////////////////////////////
    // WEEKS
    ////////////////////////////////////////////////////////////////////////////

    test('can generate the interval for the the week given a day on the week', () {
      StatsInterval interval = StatsInterval.thisWeek(
        DateTime(2025, 4, 26, 9, 53),
      );
      expect(interval.from, DateTime(2025, 4, 21));
      expect(interval.to, DateTime(2025, 4, 28));
    });

    test('can generate a single interval based on weeks default settings', () {
      StatsInterval interval = StatsInterval.weeks(
        day: DateTime(2025, 4, 26, 9, 53),
      );
      expect(interval.from, DateTime(2025, 3, 3));
      expect(interval.to, DateTime(2025, 4, 28));
    });

    test('can generate a single interval based on weeks for just two weeks', () {
      StatsInterval interval = StatsInterval.weeks(
        day: DateTime(2025, 4, 26, 9, 53),
        weeks: 2,
      );
      // minus 1 hour because of DST
      expect(interval.from, DateTime(2025, 4, 14));
      expect(interval.to, DateTime(2025, 4, 28));
    });

    test('can generate intervals for querying weeks', () {

      List<StatsInterval> intervals =
        StatsInterval.generateWeekIntervals(DateTime(2025, 4, 26, 9, 53));
      expect(intervals.length, 4);

      // first month
      expect(intervals[0].from, DateTime(2025, 3, 31));
      expect(intervals[0].to, DateTime(2025, 4, 28));

      // second month
      expect(intervals[1].from, DateTime(2025, 3, 3));
      expect(intervals[1].to, DateTime(2025, 3, 31));

      // third month
      expect(intervals[2].from, DateTime(2025, 2, 3));
      expect(intervals[2].to, DateTime(2025, 3, 3));

      // fourth week
      expect(intervals[3].from, DateTime(2025, 1, 6));
      expect(intervals[3].to, DateTime(2025, 2, 3));

    });

    ////////////////////////////////////////////////////////////////////////////
    // MONTHS
    ////////////////////////////////////////////////////////////////////////////

    test('can generate the interval for the month given a day on the month', () {
      StatsInterval interval = StatsInterval.thisMonth(
        DateTime(2025, 4, 26, 9, 53),
      );
      expect(interval.from, DateTime(2025, 4, 1));
      expect(interval.to, DateTime(2025, 5, 1));
    });

    test('can generate a single interval based on months default settings', () {
      StatsInterval interval = StatsInterval.months(
        day: DateTime(2025, 4, 26, 9, 53),
      );
      expect(interval.from, DateTime(2024, 11, 1));
      expect(interval.to, DateTime(2025, 5, 1));
    });

    test('can generate a single interval based on months for two month', () {
      StatsInterval interval = StatsInterval.months(
        day: DateTime(2025, 4, 26, 9, 53),
        months: 2,
      );
      expect(interval.from, DateTime(2025, 3, 1));
      expect(interval.to, DateTime(2025, 5, 1));
    });

    test('can generate intervals for querying months', () {

      List<StatsInterval> intervals =
        StatsInterval.generateMonthIntervals(DateTime(2025, 4, 26, 9, 53));
      expect(intervals.length, 4);

      // first 6 month
      expect(intervals[0].from, DateTime(2024, 11, 1));
      expect(intervals[0].to, DateTime(2025, 5, 1));

      // second 6 month
      expect(intervals[1].from, DateTime(2024, 5, 1));
      expect(intervals[1].to, DateTime(2024, 11, 1));

      // third 6 month
      expect(intervals[2].from, DateTime(2023, 11, 1));
      expect(intervals[2].to, DateTime(2024, 5, 1));

      // fourth 6 month
      expect(intervals[3].from, DateTime(2023, 5, 1));
      expect(intervals[3].to, DateTime(2023, 11, 1));

    });

    ////////////////////////////////////////////////////////////////////////////
    // YEARS
    ////////////////////////////////////////////////////////////////////////////

    test('can generate the interval for the year given a day on the year', () {
      StatsInterval interval = StatsInterval.thisYear(
        DateTime(2025, 4, 26, 9, 53),
      );
      expect(interval.from, DateTime(2025, 1, 1));
      expect(interval.to, DateTime(2026, 1, 1));
    });

    test('can generate a single interval based on years default settings', () {
      StatsInterval interval = StatsInterval.years(
        day: DateTime(2025, 4, 26, 9, 53),
      );
      expect(interval.from, DateTime(2020, 1, 1));
      expect(interval.to, DateTime(2026, 1, 1));
    });

    test('can generate a single interval based on years for two years', () {
      StatsInterval interval = StatsInterval.years(
        day: DateTime(2025, 4, 26, 9, 53),
        years: 2,
      );
      expect(interval.from, DateTime(2024, 1, 1));
      expect(interval.to, DateTime(2026, 1, 1));
    });

    test('can generate intervals for querying years', () {

      List<StatsInterval> intervals =
        StatsInterval.generateYearIntervals(DateTime(2025, 4, 26, 9, 53));
      expect(intervals.length, 4);

      // first year
      expect(intervals[0].from, DateTime(2020, 1, 1));
      expect(intervals[0].to, DateTime(2026, 1, 1));

      // second year
      expect(intervals[1].from, DateTime(2014, 1, 1));
      expect(intervals[1].to, DateTime(2020, 1, 1));

      // third year
      expect(intervals[2].from, DateTime(2008, 1, 1));
      expect(intervals[2].to, DateTime(2014, 1, 1));

      // fourth year
      expect(intervals[3].from, DateTime(2002, 1, 1));
      expect(intervals[3].to, DateTime(2008, 1, 1));

    });

  });

}
