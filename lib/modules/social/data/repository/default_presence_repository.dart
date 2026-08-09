import 'package:dhyana/modules/social/data/datasource/presence_data_provider.dart';
import 'package:dhyana/modules/social/domain/entity/presence.dart';
import 'package:dhyana/modules/social/domain/entity/presence_query_options.dart';
import 'package:dhyana/core/data/repository/crud_repository.dart';
import 'package:dhyana/modules/social/domain/repository/presence_repository.dart';

class DefaultPresenceRepository extends CrudRepositoryOps<Presence>
    implements PresenceRepository {
  
  final PresenceDataProvider presenceDataProvider;

  const DefaultPresenceRepository({
    required this.presenceDataProvider,
  }) : super(presenceDataProvider);
  

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
