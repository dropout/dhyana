import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/domain/entity/session_query_options.dart';

abstract interface class SessionRepository {

  Future<List<Session>> query(String profileId, SessionQueryOptions queryOptions);
  Stream<List<Session>> queryStream(String profileId, SessionQueryOptions queryOptions);

}
