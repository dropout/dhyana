import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/insights/domain/entity/month.dart';

abstract interface class MonthDataProvider implements DataProvider<Month> {

  Future<void> set(Month month, {bool merge = false, List<Object>? mergeFields});
  Future<List<Month>> query({required DateTime from, required DateTime to});
  Stream<List<Month>> queryStream({required DateTime from, required DateTime to});

}
