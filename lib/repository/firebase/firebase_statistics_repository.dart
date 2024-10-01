import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/data_provider/day_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_month_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_year_data_provider.dart';
import 'package:dhyana/data_provider/month_data_provider.dart';
import 'package:dhyana/data_provider/year_data_provider.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/day_query_options.dart';
import 'package:dhyana/model/month.dart';
import 'package:dhyana/model/month_query_options.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/year.dart';
import 'package:dhyana/model/year_query_options.dart';
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
  Future<void> logSession(String profileId, Session session) {
    // TODO: implement logSession
    throw UnimplementedError();
  }



}
