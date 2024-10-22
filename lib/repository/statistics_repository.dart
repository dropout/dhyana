import 'package:dhyana/model/all.dart';

abstract class StatisticsRepository {

  Future<Year> getYear(String profileId, DateTime dateTime);
  Future<Month> getMonth(String profileId, DateTime dateTime);
  Future<Week> getWeek(String profileId, DateTime dateTime);
  Future<Day> getDay(String profileId, DateTime dateTime);
  Future<Session> getSession(String profileId, String sessionId);

  Future<List<Year>> queryYears(String profileId, YearQueryOptions queryOptions);
  Future<List<Month>> queryMonths(String profileId, MonthQueryOptions queryOptions);
  Future<List<Week>> queryWeeks(String profileId, WeekQueryOptions queryOptions);
  Future<List<Day>> queryDays(String profileId, DayQueryOptions queryOptions);
  Future<List<Session>> querySessions(String profileId, SessionQueryOptions queryOptions);

  Future<void> logSession(Profile profile, Session session);

}
