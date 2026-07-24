import 'package:dhyana/modules/insights/domain/model/week.dart';
import 'package:dhyana/modules/practice/session/domain/model/session.dart';
import 'package:dhyana/modules/insights/domain/model/week_query_options.dart';
  
import '../../../../core/data/data_provider.dart';

abstract interface class WeekDataProvider implements DataProvider<Week> {

  Future<void> logSession(Session session);
  Future<List<Week>> query(WeekQueryOptions queryOptions);
  Stream<List<Week>> queryStream(WeekQueryOptions queryOptions);

}
