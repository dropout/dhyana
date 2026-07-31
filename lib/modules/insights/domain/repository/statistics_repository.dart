import 'package:dhyana/modules/insights/domain/entity/day.dart';
import 'package:dhyana/modules/insights/domain/entity/day_query_options.dart';
import 'package:dhyana/modules/insights/domain/entity/month.dart';
import 'package:dhyana/modules/insights/domain/entity/month_query_options.dart';
import 'package:dhyana/modules/insights/domain/entity/week.dart';
import 'package:dhyana/modules/insights/domain/entity/week_query_options.dart';
import 'package:dhyana/modules/insights/domain/entity/year.dart';
import 'package:dhyana/modules/insights/domain/entity/year_query_options.dart';
import 'package:dhyana/core/domain/entity/session.dart';

abstract class StatisticsRepository {

  Future<Year> getYear(String profileId, DateTime dateTime);
  Future<Month> getMonth(String profileId, DateTime dateTime);
  Future<Week> getWeek(String profileId, DateTime dateTime);
  Future<Day> getDay(String profileId, DateTime dateTime);

  Future<List<Year>> queryYears(String profileId, YearQueryOptions queryOptions);
  Future<List<Month>> queryMonths(String profileId, MonthQueryOptions queryOptions);
  Future<List<Week>> queryWeeks(String profileId, WeekQueryOptions queryOptions);
  Future<List<Day>> queryDays(String profileId, DayQueryOptions queryOptions);

  Future<void> logSessionStatistics(String profileId, Session session);

}
