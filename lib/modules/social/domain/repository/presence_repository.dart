import 'package:dhyana/modules/social/domain/entity/presence.dart';
import 'package:dhyana/modules/social/domain/entity/presence_query_options.dart';

import '../../../../core/data/repository/crud_repository.dart';

abstract interface class PresenceRepository
  implements CrudRepository<Presence> {

  Future<List<Presence>> query(PresenceQueryOptions queryOptions);
  Stream<List<Presence>> queryStream(PresenceQueryOptions queryOptions);

}
