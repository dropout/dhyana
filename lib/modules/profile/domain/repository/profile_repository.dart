import 'package:dhyana/core/domain/model/profile.dart';
import 'package:dhyana/core/domain/model/profile_query_options.dart';
import 'package:dhyana/core/domain/repository/crud_repository.dart';

abstract interface class ProfileRepository
  implements CrudRepository<Profile> {

  Future<List<Profile>> query(ProfileQueryOptions queryOptions);
  Stream<List<Profile>> queryStream(ProfileQueryOptions queryOptions);

}
