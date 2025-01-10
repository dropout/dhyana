import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/repository/all.dart';

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
