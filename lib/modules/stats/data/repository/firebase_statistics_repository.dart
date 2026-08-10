import 'package:dhyana/modules/stats/data/datasource/firebase_stats_data_provider_factory.dart';
import 'package:dhyana/modules/stats/domain/entity/day_details_entity.dart';
import 'package:dhyana/modules/stats/domain/entity/insights_session_entity.dart';
import 'package:dhyana/modules/stats/domain/entity/stats_bucket_entity.dart';
import 'package:dhyana/modules/stats/domain/enum/stats_entity_granularity.dart';
import 'package:dhyana/modules/stats/domain/repository/statistics_repository.dart';
import 'package:dhyana/core/util/date_time_utils.dart';

class FirebaseStatisticsRepository extends StatisticsRepository {
  final FirebaseStatsDataProviderFactory dataProviderFactory;

  FirebaseStatisticsRepository({
    required this.dataProviderFactory,
  });

  @override
  Future<StatsBucketEntity> getBucket(
    String profileId,
    DateTime dateTime, {
    required StatsEntityGranularity granularity,
  }) {
    final dataProvider = dataProviderFactory.createStatsBucketDataProvider(
      profileId,
      granularity,
    );
    return dataProvider.read(_bucketIdFor(dateTime, granularity));
  }

  @override
  Future<List<StatsBucketEntity>> queryBuckets(
    String profileId, {
    required DateTime from,
    required DateTime to,
    required StatsEntityGranularity granularity,
  }) {
    final dataProvider = dataProviderFactory.createStatsBucketDataProvider(
      profileId,
      granularity,
    );
    return dataProvider.query(from: from, to: to);
  }

  @override
  Future<DayDetailsEntity> getDayDetails(String profileId, DateTime dateTime) {
    final dataProvider = dataProviderFactory.createDayDetailsDataProvider(profileId);
    return dataProvider.read(dateTime.toDayId());
  }

  @override
  Future<DayStatsBucketEntity> getDay(String profileId, DateTime dateTime) async {
    final bucket = await getBucket(
      profileId,
      dateTime,
      granularity: StatsEntityGranularity.day,
    );

    return switch (bucket) {
      DayStatsBucketEntity() => bucket,
      _ => throw Exception('Expected DayStatsBucketEntity but got ${bucket.runtimeType}'),
    };
  }

  @override
  Future<({DayStatsBucketEntity bucket, DayDetailsEntity details})> getDayWithDetails(String profileId, DateTime dateTime) async {
    final dayStatsBucket = await getDay(profileId, dateTime);
    final dayDetails = await getDayDetails(profileId, dateTime);
    return (bucket: dayStatsBucket, details: dayDetails);
  }

  @override
  Future<WeekStatsBucketEntity> getWeek(String profileId, DateTime dateTime) async {
    final bucket = await getBucket(
      profileId,
      dateTime,
      granularity: StatsEntityGranularity.week,
    );
    return switch (bucket) {
      WeekStatsBucketEntity() => bucket,
      _ => throw Exception('Expected WeekStatsBucketEntity but got ${bucket.runtimeType}'),
    };
  }

  @override
  Future<MonthStatsBucketEntity> getMonth(String profileId, DateTime dateTime) async {
    final bucket = await getBucket(
      profileId,
      dateTime,
      granularity: StatsEntityGranularity.month,
    );

    return switch (bucket) {
      MonthStatsBucketEntity() => bucket,
      _ => throw Exception('Expected MonthStatsBucketEntity but got ${bucket.runtimeType}'),
    };
  }

  @override
  Future<YearStatsBucketEntity> getYear(String profileId, DateTime dateTime) async {
    final bucket = await getBucket(
      profileId,
      dateTime,
      granularity: StatsEntityGranularity.year,
    );
    return switch (bucket) {
      YearStatsBucketEntity() => bucket,
      _ => throw Exception('Expected YearStatsBucketEntity but got ${bucket.runtimeType}'),
    };
  }

  @override
  Future<List<DayStatsBucketEntity>> queryDays(String profileId, {required DateTime from, required DateTime to}) async {
    final dataProvider = dataProviderFactory.createStatsBucketDataProvider(
      profileId,
      StatsEntityGranularity.day,
    );
    final days = await dataProvider.query(from: from, to: to);
    return days.map((day) {
      return switch (day) {
        DayStatsBucketEntity() => day,
        _ => throw Exception('Expected DayStatsBucketEntity but got ${day.runtimeType}'),
      };
    }).toList();
  }

  @override
  Future<List<({DayStatsBucketEntity bucket, DayDetailsEntity details})>> queryDaysWithDetails(String profileId, {required DateTime from, required DateTime to}) async {
    final days = await queryDays(profileId, from: from, to: to);
    final dayDetails = await dataProviderFactory.createDayDetailsDataProvider(profileId).query(from: from, to: to);

    final dayDetailsMap = {for (var details in dayDetails) details.id: details};
    return days.map((day) {
      final details = dayDetailsMap[day.id];
      if (details == null) {
        throw Exception('No details found for day with id ${day.id}');
      }
      return (bucket: day, details: details);
    }).toList();
  }

  @override
  Future<List<WeekStatsBucketEntity>> queryWeeks(String profileId, {required DateTime from, required DateTime to}) async {
    final dataProvider = dataProviderFactory.createStatsBucketDataProvider(
      profileId,
      StatsEntityGranularity.week,
    );
    return (await dataProvider.query(from: from, to: to)).map((week) {
      return switch (week) {
        WeekStatsBucketEntity() => week,
        _ => throw Exception('Expected WeekStatsBucketEntity but got ${week.runtimeType}'),
      };
    }).toList();
  }

  @override
  Future<List<MonthStatsBucketEntity>> queryMonths(String profileId, {required DateTime from, required DateTime to}) async {
    final dataProvider = dataProviderFactory.createStatsBucketDataProvider(
      profileId,
      StatsEntityGranularity.month,
    );
    return (await dataProvider.query(from: from, to: to)).map((month) {
      return switch (month) {
        MonthStatsBucketEntity() => month,
        _ => throw Exception('Expected MonthStatsBucketEntity but got ${month.runtimeType}'),
      };
    }).toList();
  }

  @override
  Future<List<YearStatsBucketEntity>> queryYears(String profileId, {required DateTime from, required DateTime to}) async   {
    final dataProvider = dataProviderFactory.createStatsBucketDataProvider(
      profileId,
      StatsEntityGranularity.year,
    );
    return (await dataProvider.query(from: from, to: to)).map((year) {
      return switch (year) {
        YearStatsBucketEntity() => year,
        _ => throw Exception('Expected YearStatsBucketEntity but got ${year.runtimeType}'),
      };
    }).toList();
  }

  @override
  Future<void> logSessionStatistics(String profileId, InsightsSessionEntity session, int consecutiveDaysCount) async {
    await _logDayStats(
      session,
      profileId,
      consecutiveDaysCount,
    );
    await _logWeekStats(session, profileId);
    await _logMonthStats(session, profileId);
    await _logYearStats(session, profileId);
  }

  Future<void> _logDayStats(
    InsightsSessionEntity session,
    String profileId,
    int consecutiveDaysCount,
  ) async {

    final String todayId = session.startTime.toDayId();
    late DayStatsBucketEntity updatedToday;
    late DayDetailsEntity updatedTodayDetails;

    // Update Days Stats Bucket
    try {
      // Day exists
      final today = await getDay(profileId, session.startTime);

      updatedToday = today.copyWith(
        sessionCount: today.sessionCount + 1,
        minutesCount: today.minutesCount + session.duration.inMinutes,
        // sessions: today.sessions.toList()..add(session),
      );
    } catch (_) {
      // Day doesn't exists in database yet
      updatedToday = DayStatsBucketEntity(
        id: todayId,
        startDate: DateTime(
          session.startTime.year,
          session.startTime.month,
          session.startTime.day,
        ),
        minutesCount: session.duration.inMinutes,
        sessionCount: 1,
      );
    }

    // Update Day Details
    try {
      // Day details exists
      final todayDetails = await getDayDetails(profileId, session.startTime);
      updatedTodayDetails = todayDetails.copyWith(
        sessions: todayDetails.sessions.toList()..add(session),
        consecutiveDaysCount: consecutiveDaysCount,
      );
    } catch (_) {
      // Day details doesn't exist in database yet
      updatedTodayDetails = DayDetailsEntity(
        id: todayId,
        startDate: DateTime(
          session.startTime.year,
          session.startTime.month,
          session.startTime.day,
        ),
        sessions: [session],
        consecutiveDaysCount: consecutiveDaysCount,
      );
    }

    await dataProviderFactory.createStatsBucketDataProvider(
      profileId,
      StatsEntityGranularity.day,
    ).set(updatedToday, merge: true);
    
    await dataProviderFactory.createDayDetailsDataProvider(profileId)
      .set(updatedTodayDetails, merge: true);
  }

  Future<void> _logWeekStats(InsightsSessionEntity session, String profileId) async {
    final String weekId = session.startTime.toWeekId();

    late WeekStatsBucketEntity updatedWeek;
    try {
      // Week exists
      final thisWeek = await getWeek(profileId, session.startTime);
      updatedWeek = thisWeek.copyWith(
        sessionCount: thisWeek.sessionCount + 1,
        minutesCount: thisWeek.minutesCount + session.duration.inMinutes,
      );
    } catch (_) {
      // Week doesn't exist in database yet
      updatedWeek = WeekStatsBucketEntity(
        id: weekId,
        startDate: DateTime(
          session.startTime.year,
          session.startTime.month,
          session.startTime.day - session.startTime.weekday + 1,
        ),
        sessionCount: 1,
        minutesCount: session.duration.inMinutes,
      );
    }
    await dataProviderFactory.createStatsBucketDataProvider(
      profileId,
      StatsEntityGranularity.week,
    ).set(updatedWeek, merge: true);
  }

  Future<void> _logMonthStats(InsightsSessionEntity session, String profileId) async {
    final String monthId = session.startTime.toMonthId();

    late MonthStatsBucketEntity updatedMonth;
    try {
      // Month exists
      final thisMonth = await getMonth(profileId, session.startTime);
      updatedMonth = thisMonth.copyWith(
        sessionCount: thisMonth.sessionCount + 1,
        minutesCount: thisMonth.minutesCount + session.duration.inMinutes,
      );
    } catch (_) {
      // Month doesn't exists in database yet
      updatedMonth = MonthStatsBucketEntity(
        id: monthId,
        startDate: DateTime(session.startTime.year, session.startTime.month),
        minutesCount: session.duration.inMinutes,
        sessionCount: 1,
      );
    }

    await dataProviderFactory.createStatsBucketDataProvider(
      profileId,
      StatsEntityGranularity.month,
    ).set(updatedMonth, merge: true);
  }

  Future<void> _logYearStats(InsightsSessionEntity session, String profileId) async {
    final String yearId = session.startTime.toYearId();

    late YearStatsBucketEntity updatedYear;
    try {
      // Year exists
      final thisYear = await getYear(profileId, session.startTime);
      updatedYear = thisYear.copyWith(
        minutesCount: thisYear.minutesCount + session.duration.inMinutes,
        sessionCount: thisYear.sessionCount + 1,
      );
    } catch (_) {
      // Year doesn't exists in database yet
      updatedYear = YearStatsBucketEntity(
        id: yearId,
        startDate: DateTime(session.startTime.year),
        sessionCount: 1,
        minutesCount: session.duration.inMinutes,
      );
    }

    await dataProviderFactory.createStatsBucketDataProvider(
      profileId,
      StatsEntityGranularity.year,
    ).set(updatedYear, merge: true);
  }

  String _bucketIdFor(DateTime dateTime, StatsEntityGranularity granularity) {
    switch (granularity) {
      case StatsEntityGranularity.day:
        return dateTime.toDayId();
      case StatsEntityGranularity.week:
        return dateTime.toWeekId();
      case StatsEntityGranularity.month:
        return dateTime.toMonthId();
      case StatsEntityGranularity.year:
        return dateTime.toYearId();
    }
  }
}
