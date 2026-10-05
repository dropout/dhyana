import 'package:core/core.dart';
import 'package:social/src/domain/entity/presence_entity.dart';
import 'package:social/src/domain/entity/presence_query_options_entity.dart';


abstract interface class PresenceRepository
  implements CrudRepository<PresenceEntity> {

  Future<List<PresenceEntity>> query(PresenceQueryOptionsEntity queryOptions);
  Stream<List<PresenceEntity>> queryStream(PresenceQueryOptionsEntity queryOptions);

}
