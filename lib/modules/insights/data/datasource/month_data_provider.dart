import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/insights/domain/entity/month.dart';
import 'package:dhyana/modules/insights/domain/entity/month_query_options.dart';

abstract interface class MonthDataProvider implements DataProvider<Month> {

  Future<void> set(Month month, {bool merge, List<Object>? mergeFields});
  Future<List<Month>> query(MonthQueryOptions queryOptions);
  Stream<List<Month>> queryStream(MonthQueryOptions queryOptions);

}
