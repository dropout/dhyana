import 'package:dhyana/modules/insights/domain/entity/day.dart';
import 'package:dhyana/modules/insights/domain/entity/day_query_options.dart';
import 'package:dhyana/core/data/data_provider.dart';

abstract interface class DayDataProvider implements DataProvider<Day> {

  // Will store consecutive days count with Day data model
  // when logging a session, so it needs an updated Profile
  // to get the latest data.
  Future<void> set(Day day, {
    bool merge, 
    List<Object>? mergeFields,
  });
  Future<List<Day>> query(DayQueryOptions queryOptions);
  Stream<List<Day>> queryStream(DayQueryOptions queryOptions);

}
