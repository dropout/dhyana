import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/util/date_time_utils.dart';

class FirebaseStatisticsRepository extends StatisticsRepository {

  final FirebaseFirestore fireStore;

  FirebaseStatisticsRepository({
    required this.fireStore,
  });

  @override
  Future<Day> getDay(String profileId, DateTime dateTime) {
    final dataProvider = FirebaseDayDataProvider(fireStore, profileId);
    return dataProvider.read(dateTime.toDayId());
  }

  @override
  Future<Month> getMonth(String profileId, DateTime dateTime) {
    final dataProvider = FirebaseMonthDataProvider(fireStore, profileId);
    return dataProvider.read(dateTime.toMonthId());
  }

  @override
  Future<Year> getYear(String profileId, DateTime dateTime) {
    final dataProvider = FirebaseYearDataProvider(fireStore, profileId);
    return dataProvider.read(dateTime.toYearId());
  }

  @override
  Future<Session> getSession(String profileId, String sessionId) {
    final dataProvider = FirebaseSessionDataProvider(fireStore, profileId);
    return dataProvider.read(sessionId);
  }

  @override
  Future<List<Day>> queryDays(String profileId, DayQueryOptions queryOptions) {
    final dataProvider = FirebaseDayDataProvider(fireStore, profileId);
    return dataProvider.query(queryOptions);
  }

  @override
  Future<List<Month>> queryMonths(String profileId, MonthQueryOptions queryOptions) {
    final dataProvider = FirebaseMonthDataProvider(fireStore, profileId);
    return dataProvider.query(queryOptions);
  }

  @override
  Future<List<Year>> queryYears(String profileId, YearQueryOptions queryOptions) {
    final dataProvider = FirebaseYearDataProvider(fireStore, profileId);
    return dataProvider.query(queryOptions);
  }

  @override
  Future<List<Session>> querySessions(String profileId, SessionQueryOptions queryOptions) {
    final dataProvider = FirebaseSessionDataProvider(fireStore, profileId);
    return dataProvider.query(queryOptions);
  }

  @override
  Future<void> logSession(Profile profile, Session session) async {
    await FirebaseSessionDataProvider(fireStore, profile.id).create(session);

    await FirebaseDayDataProvider(fireStore, profile.id).logSession(session);
    await FirebaseMonthDataProvider(fireStore, profile.id).logSession(session);
    await FirebaseYearDataProvider(fireStore, profile.id).logSession(session);
  }

}
