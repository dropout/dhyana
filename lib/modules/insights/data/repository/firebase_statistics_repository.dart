import 'package:dhyana/modules/insights/data/datasource/firebase_insights_data_provider_factory.dart';
import 'package:dhyana/core/data/datasource/insights_profile_data_provider.dart';
import 'package:dhyana/modules/insights/domain/entity/day.dart';
import 'package:dhyana/modules/insights/domain/entity/day_query_options.dart';
import 'package:dhyana/modules/insights/domain/entity/month.dart';
import 'package:dhyana/modules/insights/domain/entity/month_query_options.dart';
import 'package:dhyana/modules/insights/domain/entity/week.dart';
import 'package:dhyana/modules/insights/domain/entity/week_query_options.dart';
import 'package:dhyana/modules/insights/domain/entity/year.dart';
import 'package:dhyana/modules/insights/domain/entity/year_query_options.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/core/util/date_time_utils.dart';

class FirebaseStatisticsRepository extends StatisticsRepository {
  final FirebaseInsightsDataProviderFactory dataProviderFactory;
  final InsightsProfileDataProvider insightsProfileDataProvider;

  FirebaseStatisticsRepository({
    required this.dataProviderFactory,
    required this.insightsProfileDataProvider,
  });

  @override
  Future<Day> getDay(String profileId, DateTime dateTime) {
    final dataProvider = dataProviderFactory.createDayDataProvider(profileId);
    return dataProvider.readStream(dateTime.toDayId()).first;
  }

  @override
  Future<Week> getWeek(String profileId, DateTime dateTime) {
    final dataProvider = dataProviderFactory.createWeekDataProvider(profileId);
    return dataProvider.readStream(dateTime.toWeekId()).first;
  }

  @override
  Future<Month> getMonth(String profileId, DateTime dateTime) {
    final dataProvider = dataProviderFactory.createMonthDataProvider(profileId);
    return dataProvider.readStream(dateTime.toMonthId()).first;
  }

  @override
  Future<Year> getYear(String profileId, DateTime dateTime) {
    final dataProvider = dataProviderFactory.createYearDataProvider(profileId);
    return dataProvider.readStream(dateTime.toYearId()).first;
  }

  @override
  Future<List<Day>> queryDays(String profileId, DayQueryOptions queryOptions) {
    final dataProvider = dataProviderFactory.createDayDataProvider(profileId);
    return dataProvider.query(queryOptions);
  }

  @override
  Future<List<Week>> queryWeeks(
    String profileId,
    WeekQueryOptions queryOptions,
  ) {
    final dataProvider = dataProviderFactory.createWeekDataProvider(profileId);
    return dataProvider.query(queryOptions);
  }

  @override
  Future<List<Month>> queryMonths(
    String profileId,
    MonthQueryOptions queryOptions,
  ) {
    final dataProvider = dataProviderFactory.createMonthDataProvider(profileId);
    return dataProvider.query(queryOptions);
  }

  @override
  Future<List<Year>> queryYears(
    String profileId,
    YearQueryOptions queryOptions,
  ) {
    final dataProvider = dataProviderFactory.createYearDataProvider(profileId);
    return dataProvider.query(queryOptions);
  }

  @override
  Future<void> logSessionStatistics(String profileId, Session session) async {
    final insightsProfileData = await insightsProfileDataProvider
        .getInsightsProfileData(profileId);
    await _logDayStats(
      session,
      profileId,
      insightsProfileData.consecutiveDaysCount,
    );
    await _logWeekStats(session, profileId);
    await _logMonthStats(session, profileId);
    await _logYearStats(session, profileId);
  }

  Future<void> _logDayStats(
    Session session,
    String profileId,
    int consecutiveDaysCount,
  ) async {
    final dataProvider = dataProviderFactory.createDayDataProvider(profileId);

    final String todayId = session.startTime.toDayId();
    late Day updatedToday;
    try {
      // Day exists
      Day today = await dataProvider.read(todayId);
      updatedToday = today.copyWith(
        sessionCount: today.sessionCount + 1,
        minutesCount: today.minutesCount + session.duration.inMinutes,
        sessions: today.sessions.toList()..add(session),
      );
    } catch (_) {
      // Day doesn't exists in database yet
      updatedToday = Day(
        id: todayId,
        startDate: DateTime(
          session.startTime.year,
          session.startTime.month,
          session.startTime.day,
        ),
        consecutiveDaysCount: consecutiveDaysCount,
        sessionCount: 1,
        sessions: [session],
        minutesCount: session.duration.inMinutes,
      );
    }

    await dataProvider.set(updatedToday, merge: true);
  }

  Future<void> _logWeekStats(Session session, String profileId) async {
    final dataProvider = dataProviderFactory.createWeekDataProvider(profileId);

    final String weekId = session.startTime.toWeekId();

    late Week updatedWeek;
    try {
      // Week exists
      Week thisWeek = await dataProvider.read(weekId);
      updatedWeek = thisWeek.copyWith(
        sessionCount: thisWeek.sessionCount + 1,
        minutesCount: thisWeek.minutesCount + session.duration.inMinutes,
      );
    } catch (_) {
      // Week doesn't exist in database yet
      updatedWeek = Week(
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
    await dataProvider.set(updatedWeek, merge: true);
  }

  Future<void> _logMonthStats(Session session, String profileId) async {
    final dataProvider = dataProviderFactory.createMonthDataProvider(profileId);
    final String monthId = session.startTime.toMonthId();

    late Month updatedMonth;
    try {
      // Month exists
      Month thisMonth = await dataProvider.read(monthId);
      updatedMonth = thisMonth.copyWith(
        sessionCount: thisMonth.sessionCount + 1,
        minutesCount: thisMonth.minutesCount + session.duration.inMinutes,
      );
    } catch (_) {
      // Month doesn't exists in database yet
      updatedMonth = Month(
        id: monthId,
        startDate: DateTime(session.startTime.year, session.startTime.month),
        minutesCount: session.duration.inMinutes,
        sessionCount: 1,
      );
    }

    await dataProvider.set(updatedMonth, merge: true);
  }

  Future<void> _logYearStats(Session session, String profileId) async {
    final dataProvider = dataProviderFactory.createYearDataProvider(profileId);
    final String yearId = session.startTime.toYearId();

    late Year updatedYear;
    try {
      // Year exists
      Year thisYear = await dataProvider.read(yearId);
      updatedYear = thisYear.copyWith(
        minutesCount: thisYear.minutesCount + session.duration.inMinutes,
        sessionCount: thisYear.sessionCount + 1,
      );
    } catch (_) {
      // Year doesn't exists in database yet
      updatedYear = Year(
        id: yearId,
        startDate: DateTime(session.startTime.year),
        sessionCount: 1,
        minutesCount: session.duration.inMinutes,
      );
    }

    dataProvider.set(updatedYear, merge: true);
  }
}
