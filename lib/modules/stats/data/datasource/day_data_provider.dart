import 'package:dhyana/modules/stats/domain/entity/day.dart';
import 'package:dhyana/core/data/datasource/data_provider.dart';

abstract interface class DayDataProvider implements DataProvider<Day> {

  // Will store consecutive days count with Day data model
  // when logging a session, so it needs an updated Profile
  // to get the latest data.
  Future<void> set(Day day, {
    bool merge, 
    List<Object>? mergeFields,
  });
  Future<List<Day>> query({required DateTime from, required DateTime to});
  Stream<List<Day>> queryStream({required DateTime from, required DateTime to});

}
