import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/insights/domain/entity/week.dart';

abstract interface class WeekDataProvider implements DataProvider<Week> {

  Future<void> set(Week week, {bool merge = false, List<Object>? mergeFields});
  Future<List<Week>> query({required DateTime from, required DateTime to});
  Stream<List<Week>> queryStream({required DateTime from, required DateTime to});

}
