import 'package:dhyana/modules/insights/domain/model/day.dart';
import 'package:dhyana/modules/insights/domain/model/day_query_options.dart';
import 'package:dhyana/modules/insights/domain/model/month.dart';
import 'package:dhyana/modules/insights/domain/model/month_query_options.dart';
import 'package:dhyana/modules/account/domain/model/profile.dart';
import 'package:dhyana/modules/practice/session/domain/model/session.dart';
import 'package:dhyana/modules/practice/session/domain/model/session_query_options.dart';
import 'package:dhyana/modules/insights/domain/model/week.dart';
import 'package:dhyana/modules/insights/domain/model/week_query_options.dart';
import 'package:dhyana/modules/insights/domain/model/year.dart';
import 'package:dhyana/modules/insights/domain/model/year_query_options.dart';

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
