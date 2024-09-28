import 'package:dhyana/model/all.dart';

abstract interface class MonthDataProvider {

  Future<List<Month>> query(MonthQueryOptions queryOptions);
  Stream<List<Month>> queryStream(MonthQueryOptions queryOptions);

}
