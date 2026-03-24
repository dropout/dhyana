import 'package:dhyana/data_provider/presence_data_provider.dart';
import 'package:dhyana/model/presence.dart';
import 'package:dhyana/model/presence_query_options.dart';
import 'package:dhyana/repository/crud_repository_operations.dart';
import 'package:dhyana/repository/presence_repository.dart';

class FirebasePresenceRepository
  extends CrudRepositoryOps<Presence>
  implements PresenceRepository {

  final PresenceDataProvider presenceDataProvider;

  const FirebasePresenceRepository({
    required this.presenceDataProvider,
  }) : super(presenceDataProvider);

  @override
  Future<void> showPresence(Presence presence) =>
    presenceDataProvider.create(presence);


  @override
  Future<List<Presence>> query(PresenceQueryOptions queryOptions) =>
    presenceDataProvider.query(queryOptions);

  @override
  Stream<List<Presence>> queryStream(PresenceQueryOptions queryOptions) =>
    presenceDataProvider.queryStream(queryOptions);

}
