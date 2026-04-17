import 'package:dhyana/data_provider/presence_data_provider.dart';
import 'package:dhyana/model/presence.dart';
import 'package:dhyana/model/presence_query_options.dart';
import 'package:dhyana/repository/crud_repository_operations.dart';
import 'package:dhyana/repository/presence_repository.dart';

class FirebasePresenceRepository extends CrudRepositoryOps<Presence>
    implements PresenceRepository {
  final PresenceDataProvider presenceDataProvider;

  const FirebasePresenceRepository({required this.presenceDataProvider})
    : super(presenceDataProvider);

  @override
  Future<void> showPresence(Presence presence) =>
    presenceDataProvider.create(presence);

  @override
  Future<List<Presence>> query(PresenceQueryOptions queryOptions) async {
    final List<Presence> presenceList = await presenceDataProvider.query(
      queryOptions,
    );

    final List<Presence> filteredList = _excludeOwnProfile(
      presenceList,
      queryOptions.ownProfileId,
    );

    return filteredList;
  }

  @override
  Stream<List<Presence>> queryStream(PresenceQueryOptions queryOptions) =>
      throw UnimplementedError('Not implemented to avoid complexity and cost!');

  List<Presence> _excludeOwnProfile(
    List<Presence> presenceList,
    String? ownProfileId,
  ) {
    if (ownProfileId == null) {
      return presenceList;
    }
    return presenceList
      .where((Presence presence) => presence.id != ownProfileId)
      .toList();
  }
}
