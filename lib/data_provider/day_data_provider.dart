import 'data_provider.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/day_query_options.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/profile.dart';

abstract interface class DayDataProvider implements DataProvider<Day> {

  // Will store consecutive days count with Day data model
  // when logging a session, so it needs an updated Profile
  // to get the latest data.
  Future<void> logSession(Session session, Profile profile);
  Future<List<Day>> query(DayQueryOptions queryOptions);
  Stream<List<Day>> queryStream(DayQueryOptions queryOptions);

}
