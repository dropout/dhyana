import '../../../../core/data/data_provider.dart';
import 'package:dhyana/modules/insights/domain/model/day.dart';
import 'package:dhyana/modules/insights/domain/model/day_query_options.dart';
import 'package:dhyana/modules/practice/session/domain/model/session.dart';
import 'package:dhyana/core/domain/model/profile.dart';

abstract interface class DayDataProvider implements DataProvider<Day> {

  // Will store consecutive days count with Day data model
  // when logging a session, so it needs an updated Profile
  // to get the latest data.
  Future<void> logSession(Session session, Profile profile);
  Future<List<Day>> query(DayQueryOptions queryOptions);
  Stream<List<Day>> queryStream(DayQueryOptions queryOptions);

}
