import 'package:dhyana/core/data/data_provider.dart';
import 'package:dhyana/modules/insights/domain/entity/year.dart';
import 'package:dhyana/modules/insights/domain/entity/year_query_options.dart';

abstract interface class YearDataProvider implements DataProvider<Year> {

  Future<void> set(Year year, {bool merge, List<Object>? mergeFields});
  Future<List<Year>> query(YearQueryOptions queryOptions);
  Stream<List<Year>> queryStream(YearQueryOptions queryOptions);

}
