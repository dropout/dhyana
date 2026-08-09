import 'package:dhyana/core/data/repository/crud_repository.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_entity.dart';

abstract interface class ProfileRepository
  implements CrudRepository<ProfileEntity> {

  Future<List<ProfileEntity>> query({int limit = 20});
  Stream<List<ProfileEntity>> queryStream({int limit = 20});

}
