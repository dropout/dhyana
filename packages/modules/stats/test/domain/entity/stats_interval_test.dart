import 'package:stats/src/stats_module.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StatsInterval', () {
    ////////////////////////////////////////////////////////////////////////////
    // DAYS
    ////////////////////////////////////////////////////////////////////////////

    group('days', () {
      test('can generate a single interval based on default settings', () {
        StatsInterval interval = StatsInterval.days(
          lastDay: DateTime(2026, 9, 8),
        );
        expect(interval.from, DateTime(2026, 9, 1));
        expect(interval.to, DateTime(2026, 9, 8));
      });

      test('can generate a single interval based when days parameter is 1', () {
        StatsInterval interval = StatsInterval.days(
          lastDay: DateTime(2025, 4, 26, 9, 53),
          days: 1,
        );
        expect(interval.from, DateTime(2025, 4, 25));
        expect(interval.to, DateTime(2025, 4, 26));
      });

      test('can generate a single interval based days parameter is 2', () {
        StatsInterval interval = StatsInterval.days(
          lastDay: DateTime(2025, 4, 26, 9, 53),
          days: 2,
        );
        expect(interval.from, DateTime(2025, 4, 24));
        expect(interval.to, DateTime(2025, 4, 26));
      });

      test('can generate intervals for querying stats', () {
        List<StatsInterval> intervals = StatsInterval.generateDayIntervals(
          DateTime(2026, 9, 8, 19, 14),
        );
        expect(intervals.length, 4);

        // first week
        expect(intervals[3].from, DateTime(2026, 8, 11));
        expect(intervals[3].to, DateTime(2026, 8, 18));

        // second week
        expect(intervals[2].from, DateTime(2026, 8, 18));
        expect(intervals[2].to, DateTime(2026, 8, 25));

        // third week
        expect(intervals[1].from, DateTime(2026, 8, 25));
        expect(intervals[1].to, DateTime(2026, 9, 1));

        // fourth week
        expect(intervals[0].from, DateTime(2026, 9, 1));
        expect(intervals[0].to, DateTime(2026, 9, 8));
      });
    });

    ////////////////////////////////////////////////////////////////////////////
    // WEEKS
    ////////////////////////////////////////////////////////////////////////////

    group('weeks', () {
      test(
        'can generate the interval for the the week given a day on the week',
        () {
          StatsInterval interval = StatsInterval.thisWeek(
            DateTime(2026, 9, 9, 6, 36),
          );
          expect(interval.from, DateTime(2026, 9, 7));
          expect(interval.to, DateTime(2026, 9, 13, 23, 59, 59));
        },
      );

      test(
        'can generate a single interval based on weeks default settings',
        () {
          StatsInterval interval = StatsInterval.weeks(
            day: DateTime(2026, 9, 18, 9, 53),
          );
          expect(interval.from, DateTime(2026, 8, 10));
          expect(interval.to, DateTime(2026, 9, 20, 23, 59, 59));
        },
      );

      test(
        'can generate a single interval based on weeks for just two weeks',
        () {
          StatsInterval interval = StatsInterval.weeks(
            day: DateTime(2026, 9, 9, 6, 36),
            weeks: 2,
          );
          // minus 1 hour because of DST
          expect(interval.from, DateTime(2026, 8, 31));
          expect(interval.to, DateTime(2026, 9, 13, 23, 59, 59));
        },
      );

      test('can generate intervals for querying weeks', () {
        List<StatsInterval> intervals = StatsInterval.generateWeekIntervals(
          DateTime(2026, 9, 8, 19, 42),
        );
        expect(intervals.length, 4);

        // first 6 weeks
        expect(intervals[0].from, DateTime(2026, 8, 3));
        expect(intervals[0].to, DateTime(2026, 9, 13, 23, 59, 59));

        // second 6 weeks
        expect(intervals[1].from, DateTime(2026, 6, 22));
        expect(intervals[1].to, DateTime(2026, 8, 2, 23, 59, 59));

        // third 6 weeks
        expect(intervals[2].from, DateTime(2026, 5, 11));
        expect(intervals[2].to, DateTime(2026, 6, 21, 23, 59, 59));

        // fourth 6 weeks
        expect(intervals[3].from, DateTime(2026, 3, 30));
        expect(intervals[3].to, DateTime(2026, 5, 10, 23, 59, 59));
      });
    });

    ////////////////////////////////////////////////////////////////////////////
    // MONTHS
    ////////////////////////////////////////////////////////////////////////////

    group('month', () {
      test(
        'can generate the interval for the month given a day on the month',
        () {
          StatsInterval interval = StatsInterval.thisMonth(
            DateTime(2026, 9, 9, 9, 26),
          );
          expect(interval.from, DateTime(2026, 9, 1));
          expect(interval.to, DateTime(2026, 9, 30, 23, 59, 59));
        },
      );

      test(
        'can generate a single interval based on months default settings',
        () {
          StatsInterval interval = StatsInterval.months(
            day: DateTime(2026, 9, 9, 9, 40),
          );
          expect(interval.from, DateTime(2026, 4, 1));
          expect(interval.to, DateTime(2026, 9, 30, 23, 59, 59));
        },
      );

      test('can generate a single interval based on months for two month', () {
        StatsInterval interval = StatsInterval.months(
          day: DateTime(2025, 4, 26, 9, 53),
          months: 2,
        );
        expect(interval.from, DateTime(2025, 3, 1));
        expect(interval.to, DateTime(2025, 4, 30, 23, 59, 59));
      });

      test('can generate intervals for querying months', () {
        List<StatsInterval> intervals = StatsInterval.generateMonthIntervals(
          DateTime(2025, 4, 26, 9, 53),
        );
        expect(intervals.length, 4);

        // first 6 month
        expect(intervals[0].from, DateTime(2024, 11, 1));
        expect(intervals[0].to, DateTime(2025, 4, 30, 23, 59, 59));

        // second 6 month
        expect(intervals[1].from, DateTime(2024, 5, 1));
        expect(intervals[1].to, DateTime(2024, 10, 31, 23, 59, 59));

        // third 6 month
        expect(intervals[2].from, DateTime(2023, 11, 1));
        expect(intervals[2].to, DateTime(2024, 4, 30, 23, 59, 59));

        // fourth 6 month
        expect(intervals[3].from, DateTime(2023, 5, 1));
        expect(intervals[3].to, DateTime(2023, 10, 31, 23, 59, 59));
      });
    });

    ////////////////////////////////////////////////////////////////////////////
    // YEARS
    ////////////////////////////////////////////////////////////////////////////

    group('years', () {
    
      test('can generate the interval for the year given a day on the year', () {
        StatsInterval interval = StatsInterval.thisYear(
          DateTime(2025, 4, 26, 9, 53),
        );
        expect(interval.from, DateTime(2025, 1, 1));
        expect(interval.to, DateTime(2025, 12, 31, 23, 59, 59));
      });
    
      test('can generate a single interval based on years default settings', () {
        StatsInterval interval = StatsInterval.years(
          day: DateTime(2025, 4, 26, 9, 53),
        );
        expect(interval.from, DateTime(2020, 1, 1));
        expect(interval.to, DateTime(2025, 12, 31, 23, 59, 59));
      });


      test('can generate a single interval based on years for two years', () {
        StatsInterval interval = StatsInterval.years(
          day: DateTime(2025, 4, 26, 9, 53),
          years: 2,
        );
        expect(interval.from, DateTime(2024, 1, 1));
        expect(interval.to, DateTime(2025, 12, 31, 23, 59, 59));
      });

      test('can generate intervals for querying years', () {
        List<StatsInterval> intervals = StatsInterval.generateYearIntervals(
          DateTime(2025, 4, 26, 9, 53),
        );
        expect(intervals.length, 4);

        // first year
        expect(intervals[0].from, DateTime(2020, 1, 1));
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








  });
}
