import 'package:dhyana/core/data/data_provider.dart';
import 'package:dhyana/modules/insights/domain/entity/week.dart';
import 'package:dhyana/modules/insights/domain/entity/week_query_options.dart';

abstract interface class WeekDataProvider implements DataProvider<Week> {

  Future<void> set(Week week, {bool merge, List<Object>? mergeFields});
  Future<List<Week>> query(WeekQueryOptions queryOptions);
  Stream<List<Week>> queryStream(WeekQueryOptions queryOptions);

}
