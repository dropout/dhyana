import '../../../../core/data/data_provider.dart';
import 'package:dhyana/modules/insights/domain/model/year.dart';
import 'package:dhyana/modules/insights/domain/model/year_query_options.dart';
import 'package:dhyana/core/domain/entity/session.dart';

abstract interface class YearDataProvider implements DataProvider<Year> {

  Future<void> logSession(Session session);
  Future<List<Year>> query(YearQueryOptions queryOptions);
  Stream<List<Year>> queryStream(YearQueryOptions queryOptions);

}
