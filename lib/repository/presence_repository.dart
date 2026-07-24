import 'package:dhyana/modules/social/domain/model/presence.dart';
import 'package:dhyana/modules/social/domain/model/presence_query_options.dart';

import '../core/domain/repository/crud_repository.dart';

abstract interface class PresenceRepository
  implements CrudRepository<Presence> {

  /// Shows the presence of a user
  Future<void> showPresence(Presence presence);

  Future<List<Presence>> query(PresenceQueryOptions queryOptions);
  Stream<List<Presence>> queryStream(PresenceQueryOptions queryOptions);

}
