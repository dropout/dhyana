import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/entity/profile/profile_query_options.dart';
import 'package:dhyana/core/domain/repository/crud/crud_repository.dart';

abstract interface class ProfileRepository
  implements CrudRepository<Profile> {

  Profile? get currentUser;

  Future<List<Profile>> query(ProfileQueryOptions queryOptions);
  Stream<List<Profile>> queryStream(ProfileQueryOptions queryOptions);

}
