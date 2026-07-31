import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/repository/crud/crud_repository.dart';

abstract interface class ProfileRepository
  implements CrudRepository<Profile> {

  Profile? get currentUser;

  Future<List<Profile>> query({int limit = 20});
  Stream<List<Profile>> queryStream({int limit = 20});

}
