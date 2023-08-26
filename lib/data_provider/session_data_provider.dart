import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/session_query_options.dart';

abstract interface class SessionDataProvider {

  Future<Session> addSession(String profileId, Session session);
  Future<List<Session>> getSessions(String profileId, {SessionQueryOptions queryOptions});

}
