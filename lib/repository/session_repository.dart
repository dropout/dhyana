import 'package:dhyana/modules/practice/session/domain/model/session.dart';
import 'package:dhyana/modules/practice/session/domain/model/session_query_options.dart';

abstract interface class SessionRepository {

  Future<List<Session>> query(String profileId, SessionQueryOptions queryOptions);
  Stream<List<Session>> queryStream(String profileId, SessionQueryOptions queryOptions);

}
