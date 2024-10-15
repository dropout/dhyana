import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/util/date_time_utils.dart';

class FirebaseStatisticsRepository extends StatisticsRepository {

  final FirebaseDataProviderFactory dataProviderFactory;

  FirebaseStatisticsRepository({
    required this.dataProviderFactory,
  });

  @override
  Future<Day> getDay(String profileId, DateTime dateTime) {
    final dataProvider = dataProviderFactory.createDayDataProvider(profileId);
    return dataProvider.read(dateTime.toDayId());
  }

  @override
  Future<Month> getMonth(String profileId, DateTime dateTime) {
    final dataProvider = dataProviderFactory.createMonthDataProvider(profileId);
    return dataProvider.read(dateTime.toMonthId());
  }

  @override
  Future<Year> getYear(String profileId, DateTime dateTime) {
    final dataProvider = dataProviderFactory.createYearDataProvider(profileId);
    return dataProvider.read(dateTime.toYearId());
  }

  @override
  Future<Session> getSession(String profileId, String sessionId) {
    final dataProvider = dataProviderFactory.createSessionDataProvider(profileId);
    return dataProvider.read(sessionId);
  }

  @override
  Future<List<Day>> queryDays(String profileId, DayQueryOptions queryOptions) {
    final dataProvider = dataProviderFactory.createDayDataProvider(profileId);
    return dataProvider.query(queryOptions);
  }

  @override
  Future<List<Month>> queryMonths(String profileId, MonthQueryOptions queryOptions) {
    final dataProvider = dataProviderFactory.createMonthDataProvider(profileId);
    return dataProvider.query(queryOptions);
  }

  @override
  Future<List<Year>> queryYears(String profileId, YearQueryOptions queryOptions) {
    final dataProvider = dataProviderFactory.createYearDataProvider(profileId);
    return dataProvider.query(queryOptions);
  }

  @override
  Future<List<Session>> querySessions(String profileId, SessionQueryOptions queryOptions) {
    final dataProvider = dataProviderFactory.createSessionDataProvider(profileId);
    return dataProvider.query(queryOptions);
  }

  @override
  Future<void> logSession(Profile profile, Session session) async {
    await dataProviderFactory.createSessionDataProvider(profile.id).create(session);
    await dataProviderFactory.createDayDataProvider(profile.id).logSession(session, profile);
    await dataProviderFactory.createMonthDataProvider(profile.id).logSession(session);
    await dataProviderFactory.createYearDataProvider(profile.id).logSession(session);
  }

}
