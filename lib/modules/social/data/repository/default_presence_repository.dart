import 'package:dhyana/modules/social/data/datasource/presence_data_provider.dart';
import 'package:dhyana/modules/social/domain/entity/presence_entity.dart';
import 'package:dhyana/modules/social/domain/entity/presence_query_options_entity.dart';
import 'package:dhyana/core/data/repository/crud_repository.dart';
import 'package:dhyana/modules/social/domain/repository/presence_repository.dart';

class DefaultPresenceRepository extends CrudRepositoryOps<PresenceEntity>
    implements PresenceRepository {
  
  final PresenceDataProvider presenceDataProvider;

  const DefaultPresenceRepository({
    required this.presenceDataProvider,
  }) : super(presenceDataProvider);
  

  @override
  Future<List<PresenceEntity>> query(PresenceQueryOptionsEntity queryOptions) async {
    final List<PresenceEntity> presenceList = await presenceDataProvider.query(
      queryOptions,
    );

    final List<PresenceEntity> filteredList = _excludeOwnProfile(
      presenceList,
      queryOptions.ownProfileId,
    );

    return filteredList;
  }

  @override
  Stream<List<PresenceEntity>> queryStream(PresenceQueryOptionsEntity queryOptions) =>
      throw UnimplementedError('Not implemented to avoid complexity and cost!');

  List<PresenceEntity> _excludeOwnProfile(
    List<PresenceEntity> presenceList,
    String? ownProfileId,
  ) {
    if (ownProfileId == null) {
      return presenceList;
    }
    return presenceList
      .where((PresenceEntity presence) => presence.id != ownProfileId)
      .toList();
  }
}
