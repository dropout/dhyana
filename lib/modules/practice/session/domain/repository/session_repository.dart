import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/domain/entity/session_query_options.dart';

abstract interface class SessionRepository {

  Future<void> create(String profileId, Session model);
  Future<Session> read(String profileId, String id);
  Stream<Session> readStream(String profileId, String id);
  Future<void> update(String profileId, Session model);
  Future<void> delete(String profileId, String sessionId);

  Future<List<Session>> query(String profileId, SessionQueryOptions queryOptions);
  Stream<List<Session>> queryStream(String profileId, SessionQueryOptions queryOptions);

}
