import 'package:dhyana/modules/profile/data/datasource/profile_data_provider.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/entity/profile/profile_query_options.dart';
import 'package:dhyana/core/domain/repository/crud/crud_repository_operations.dart';
import 'package:dhyana/core/domain/repository/profile_repository.dart';

class DefaultProfileRepository extends CrudRepositoryOps<Profile>
    implements ProfileRepository {
  final ProfileDataProvider profileDataProvider;
  final StorageDataProvider storageDataProvider;
  Profile? _currentUser;

  @override
  Profile? get currentUser => _currentUser;

  DefaultProfileRepository({
    required this.profileDataProvider,
    required this.storageDataProvider,
  }) : super(profileDataProvider);

  @override
  Future<List<Profile>> query(ProfileQueryOptions queryOptions) =>
      profileDataProvider.query(queryOptions);

  @override
  Stream<List<Profile>> queryStream(ProfileQueryOptions queryOptions) =>
      profileDataProvider.queryStream(queryOptions);

  @override
  Future<void> create(Profile model) async {
    await super.create(model);
    _currentUser = model;
  }

  @override
  Future<void> delete(String id) async {
    await super.delete(id);
    if (_currentUser?.id == id) {
      _currentUser = null;
    }
  }

  @override
  Future<Profile> read(String id) async {
    final profile = await super.read(id);
    _currentUser = profile;
    return profile;
  }

  @override
  Stream<Profile> readStream(String id) =>
    super.readStream(id).map((profile) {
      _currentUser = profile;
      return profile;
    });

  @override
  Future<void> update(Profile model) async {
    await super.update(model);
    _currentUser = model;
  }
}
