import 'package:dhyana/model/all.dart';

import 'data_provider.dart';

abstract interface class DayDataProvider implements DataProvider<Day> {

  // Will store consecutive days count with Day data model
  // when logging a session, so it needs an updated Profile
  // to get the latest data.
  Future<void> logSession(Session session, Profile profile);
  Future<List<Day>> query(DayQueryOptions queryOptions);
  Stream<List<Day>> queryStream(DayQueryOptions queryOptions);

}
