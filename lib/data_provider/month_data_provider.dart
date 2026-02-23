import 'data_provider.dart';
import 'package:dhyana/model/month.dart';
import 'package:dhyana/model/month_query_options.dart';
import 'package:dhyana/model/session.dart';

abstract interface class MonthDataProvider implements DataProvider<Month> {

  Future<void> logSession(Session session);
  Future<List<Month>> query(MonthQueryOptions queryOptions);
  Stream<List<Month>> queryStream(MonthQueryOptions queryOptions);

}
