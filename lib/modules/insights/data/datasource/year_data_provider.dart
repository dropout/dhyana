import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/insights/domain/entity/year.dart';

abstract interface class YearDataProvider implements DataProvider<Year> {

  Future<void> set(Year year, {bool merge = false, List<Object>? mergeFields});
  Future<List<Year>> query({required DateTime from, required DateTime to});
  Stream<List<Year>> queryStream({required DateTime from, required DateTime to});

}
