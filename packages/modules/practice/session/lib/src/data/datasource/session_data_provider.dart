import 'package:core/core.dart';
import 'package:session/src/domain/entity/session_entity.dart';

abstract interface class SessionDataProvider
    implements DataProvider<SessionEntity> {

  Future<List<SessionEntity>> query({int limit = 20});
  Stream<List<SessionEntity>> queryStream({int limit = 20});

}
