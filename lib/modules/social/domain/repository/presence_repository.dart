import 'package:dhyana/modules/social/domain/entity/presence_entity.dart';
import 'package:dhyana/modules/social/domain/entity/presence_query_options_entity.dart';

import '../../../../core/data/repository/crud_repository.dart';

abstract interface class PresenceRepository
  implements CrudRepository<PresenceEntity> {

  Future<List<PresenceEntity>> query(PresenceQueryOptionsEntity queryOptions);
  Stream<List<PresenceEntity>> queryStream(PresenceQueryOptionsEntity queryOptions);

}
