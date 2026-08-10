import 'package:dhyana/modules/insights/domain/entity/day_details_entity.dart';
import 'package:dhyana/modules/insights/domain/entity/insights_session_entity.dart';
import 'package:dhyana/modules/insights/domain/entity/stats_bucket_entity.dart';
import 'package:dhyana/modules/insights/domain/entity/stats_granularity.dart';

abstract class StatisticsRepository {
  Future<StatsBucketEntity> getBucket(
    String profileId,
    DateTime dateTime, {
    required StatsGranularity granularity,
  }) async {
    switch (granularity) {
      case StatsGranularity.day:
        final day = await getDay(profileId, dateTime);
        return StatsBucketEntity.day(
          id: day.id,
          startDate: day.startDate,
          minutesCount: day.minutesCount,
          sessionCount: day.sessionCount,
        );
      case StatsGranularity.week:
        final week = await getWeek(profileId, dateTime);
        return StatsBucketEntity.week(
          id: week.id,
          startDate: week.startDate,
          minutesCount: week.minutesCount,
          sessionCount: week.sessionCount,
        );
      case StatsGranularity.month:
        final month = await getMonth(profileId, dateTime);
        return StatsBucketEntity.month(
          id: month.id,
          startDate: month.startDate,
          minutesCount: month.minutesCount,
          sessionCount: month.sessionCount,
        );
      case StatsGranularity.year:
        final year = await getYear(profileId, dateTime);
        return StatsBucketEntity.year(
          id: year.id,
          startDate: year.startDate,
          minutesCount: year.minutesCount,
          sessionCount: year.sessionCount,
        );
    }
  }

  Future<List<StatsBucketEntity>> queryBuckets(
    String profileId, {
    required DateTime from,
    required DateTime to,
    required StatsGranularity granularity,
  }) async {
    switch (granularity) {
      case StatsGranularity.day:
        final days = await queryDays(profileId, from: from, to: to);
        return days
            .map(
              (day) => StatsBucketEntity.day(
                id: day.id,
                startDate: day.startDate,
                minutesCount: day.minutesCount,
                sessionCount: day.sessionCount,
              ),
            )
            .toList();
      case StatsGranularity.week:
        final weeks = await queryWeeks(profileId, from: from, to: to);
        return weeks
            .map(
              (week) => StatsBucketEntity.week(
                id: week.id,
                startDate: week.startDate,
                minutesCount: week.minutesCount,
                sessionCount: week.sessionCount,
              ),
            )
            .toList();
      case StatsGranularity.month:
        final months = await queryMonths(profileId, from: from, to: to);
        return months
            .map(
              (month) => StatsBucketEntity.month(
                id: month.id,
                startDate: month.startDate,
                minutesCount: month.minutesCount,
                sessionCount: month.sessionCount,
              ),
            )
            .toList();
      case StatsGranularity.year:
        final years = await queryYears(profileId, from: from, to: to);
        return years
            .map(
              (year) => StatsBucketEntity.year(
                id: year.id,
                startDate: year.startDate,
                minutesCount: year.minutesCount,
                sessionCount: year.sessionCount,
              ),
            )
            .toList();
    }
  }

  

  Future<YearStatsBucketEntity> getYear(String profileId, DateTime dateTime);
  Future<MonthStatsBucketEntity> getMonth(String profileId, DateTime dateTime);
  Future<WeekStatsBucketEntity> getWeek(String profileId, DateTime dateTime);
  Future<DayStatsBucketEntity> getDay(String profileId, DateTime dateTime);
  Future<DayDetailsEntity> getDayDetails(String profileId, DateTime dateTime);
  Future<({DayStatsBucketEntity bucket, DayDetailsEntity details})>
  getDayWithDetails(String profileId, DateTime dateTime);

  Future<List<YearStatsBucketEntity>> queryYears(
    String profileId, {
    required DateTime from,
    required DateTime to,
  });
  Future<List<MonthStatsBucketEntity>> queryMonths(
    String profileId, {
    required DateTime from,
    required DateTime to,
  });
  Future<List<WeekStatsBucketEntity>> queryWeeks(
    String profileId, {
    required DateTime from,
    required DateTime to,
  });
  Future<List<DayStatsBucketEntity>> queryDays(
    String profileId, {
    required DateTime from,
    required DateTime to,
  });
  Future<List<({DayStatsBucketEntity bucket, DayDetailsEntity details})>>
  queryDaysWithDetails(
    String profileId, {
    required DateTime from,
    required DateTime to,
  });

  Future<void> logSessionStatistics(
    String profileId,
    InsightsSessionEntity session,
    int consecutiveDaysCount,
  );
}
