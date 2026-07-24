import '../../../../core/data/data_provider.dart';
import 'package:dhyana/modules/insights/domain/model/month.dart';
import 'package:dhyana/modules/insights/domain/model/month_query_options.dart';
import 'package:dhyana/modules/practice/session/domain/model/session.dart';

abstract interface class MonthDataProvider implements DataProvider<Month> {

  Future<void> logSession(Session session);
  Future<List<Month>> query(MonthQueryOptions queryOptions);
  Stream<List<Month>> queryStream(MonthQueryOptions queryOptions);

}
