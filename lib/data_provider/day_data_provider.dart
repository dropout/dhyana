import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/all.dart';

abstract interface class DayDataProvider implements DataProvider<Day> {

  Future<void> logSession(Session session);
  Future<List<Day>> query(DayQueryOptions queryOptions);
  Stream<List<Day>> queryStream(DayQueryOptions queryOptions);

}
