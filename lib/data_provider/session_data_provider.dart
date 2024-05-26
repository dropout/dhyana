import 'package:dhyana/data_provider/data_provider.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/session_query_options.dart';

abstract interface class SessionDataProvider
    implements DataProvider<Session> {

  Future<List<Session>> query(SessionQueryOptions queryOptions);
  Stream<List<Session>> queryStream(SessionQueryOptions queryOptions);

}
