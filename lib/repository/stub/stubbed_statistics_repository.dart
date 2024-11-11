
import 'package:dhyana/model/all.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';

class StubbedStatisticsRepository implements StatisticsRepository {
  final FakeModelFactory _fakeModelFactory = FakeModelFactory();

  @override
  Future<Day> getDay(String profileId, DateTime dateTime) {
    return Future.value(_fakeModelFactory.createDay());
  }

  @override
  Future<Week> getWeek(String profileId, DateTime dateTime) {
    return Future.value(_fakeModelFactory.createWeek());
  }

  @override
  Future<Month> getMonth(String profileId, DateTime dateTime) {
    return Future.value(_fakeModelFactory.createMonth());
  }

  @override
  Future<Year> getYear(String profileId, DateTime dateTime) {
    return Future.value(_fakeModelFactory.createYear());
  }

  @override
  Future<Session> getSession(String profileId, String sessionId) {
    return Future.value(_fakeModelFactory.createSession());
  }

  @override
  Future<List<Day>> queryDays(String profileId, DayQueryOptions queryOptions) {
    Duration difference = queryOptions.from.difference(queryOptions.to);
    List<Day> days = [];
    for (var i = 0; i < difference.inDays.abs(); ++i) {
      DateTime date = queryOptions.from.add(Duration(days: i));
      Day day = _fakeModelFactory.createDay();
      day = day.copyWith(
        id: date.toDayId(),
      );
      days.add(day);
    }
    return Future.value(days);
  }

  @override
  Future<List<Week>> queryWeeks(String profileId, WeekQueryOptions queryOptions) {
    return Future.value(
      List.generate(queryOptions.limit, (_) => _fakeModelFactory.createWeek())
    );
  }

  @override
  Future<List<Month>> queryMonths(String profileId, MonthQueryOptions queryOptions) {
    return Future.value(_fakeModelFactory.createMonths(queryOptions.limit));
  }

  @override
  Future<List<Year>> queryYears(String profileId, YearQueryOptions queryOptions) {
    return Future.value(_fakeModelFactory.createYears(queryOptions.limit));
  }

  @override
  Future<List<Session>> querySessions(String profileId, SessionQueryOptions queryOptions) {
    return Future.value(_fakeModelFactory.createSessions(queryOptions.limit));
  }

  @override
  Future<void> logSession(Profile profile, Session session) {
    return Future.value();
  }
}
