import 'package:dhyana/model/all.dart';

import 'data_provider.dart';

abstract interface class YearDataProvider implements DataProvider<Year> {

  Future<void> logSession(Session session);
  Future<List<Year>> query(YearQueryOptions queryOptions);
  Stream<List<Year>> queryStream(YearQueryOptions queryOptions);

}
