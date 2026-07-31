import 'package:dhyana/core/domain/entity/session.dart';

abstract interface class SessionRepository {

  Future<void> create(String profileId, Session model);
  Future<Session> read(String profileId, String id);
  Stream<Session> readStream(String profileId, String id);
  Future<void> update(String profileId, Session model);
  Future<void> delete(String profileId, String sessionId);

  Future<List<Session>> query(String profileId, {int limit = 20});
  Stream<List<Session>> queryStream(String profileId, {int limit = 20});

}
