import 'package:dhyana/core/domain/repository/crud/crud_repository_operations.dart';
import 'package:dhyana/modules/profile/data/datasource/profile_data_provider.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_entity.dart';
import 'package:dhyana/modules/profile/domain/repository/profile_repository.dart';

class DefaultProfileRepository 
  extends CrudRepositoryOps<ProfileEntity> 
  implements ProfileRepository {

  final ProfileDataProvider profileDataProvider;

  DefaultProfileRepository({
    required this.profileDataProvider,
  }): super(profileDataProvider);

  @override
  Future<List<ProfileEntity>> query({int limit = 20}) =>
    profileDataProvider.query(limit: limit);

  @override
  Stream<List<ProfileEntity>> queryStream({int limit = 20}) =>
    profileDataProvider.queryStream(limit: limit);

}
