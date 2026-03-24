import 'package:dhyana/model/week.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/week_query_options.dart';
  
import 'data_provider.dart';

abstract interface class WeekDataProvider implements DataProvider<Week> {

  Future<void> logSession(Session session);
  Future<List<Week>> query(WeekQueryOptions queryOptions);
  Stream<List<Week>> queryStream(WeekQueryOptions queryOptions);

}
