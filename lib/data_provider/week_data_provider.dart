
import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/all.dart';

abstract interface class WeekDataProvider implements DataProvider<Week> {

  Future<void> logSession(Session session);
  Future<List<Week>> query(WeekQueryOptions queryOptions);
  Stream<List<Week>> queryStream(WeekQueryOptions queryOptions);

}
