
import 'package:dhyana/modules/profile/data/datasource/profile_data_provider.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/entity/profile/profile_query_options.dart';
import 'package:dhyana/core/domain/repository/crud/crud_repository_operations.dart';
import 'package:dhyana/core/domain/repository/profile_repository.dart';

class DefaultProfileRepository
  extends CrudRepositoryOps<Profile>
  implements ProfileRepository {

  final ProfileDataProvider profileDataProvider;
  final StorageDataProvider storageDataProvider;

  const DefaultProfileRepository({
    required this.profileDataProvider,
    required this.storageDataProvider,
  }) : super(profileDataProvider);

  @override
  Future<List<Profile>> query(ProfileQueryOptions queryOptions) =>
    profileDataProvider.query(queryOptions);

  @override
  Stream<List<Profile>> queryStream(ProfileQueryOptions queryOptions) =>
    profileDataProvider.queryStream(queryOptions);

}
