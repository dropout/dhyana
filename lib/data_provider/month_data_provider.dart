import 'package:dhyana/model/all.dart';

import 'data_provider.dart';

abstract interface class MonthDataProvider implements DataProvider<Month> {

  Future<void> logSession(Session session);
  Future<List<Month>> query(MonthQueryOptions queryOptions);
  Stream<List<Month>> queryStream(MonthQueryOptions queryOptions);

}
