import 'package:dhyana/modules/insights/domain/entity/day.dart';
import 'package:dhyana/modules/insights/domain/entity/insights_session_entity.dart';
import 'package:dhyana/modules/insights/domain/entity/month.dart';
import 'package:dhyana/modules/insights/domain/entity/week.dart';
import 'package:dhyana/modules/insights/domain/entity/year.dart';


abstract class StatisticsRepository {

  Future<Year> getYear(String profileId, DateTime dateTime);
  Future<Month> getMonth(String profileId, DateTime dateTime);
  Future<Week> getWeek(String profileId, DateTime dateTime);
  Future<Day> getDay(String profileId, DateTime dateTime);

  Future<List<Year>> queryYears(String profileId, {required DateTime from, required DateTime to});
  Future<List<Month>> queryMonths(String profileId, {required DateTime from, required DateTime to});
  Future<List<Week>> queryWeeks(String profileId, {required DateTime from, required DateTime to});
  Future<List<Day>> queryDays(String profileId, {required DateTime from, required DateTime to});

  Future<void> logSessionStatistics(String profileId, InsightsSessionEntity session, int consecutiveDaysCount);

}
