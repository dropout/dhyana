import 'dart:typed_data';

import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_query_options.dart';
import 'package:dhyana/repository/crud_repository.dart';

abstract interface class ProfileRepository
  implements CrudRepository<Profile> {

  Future<Profile> updateProfileWithImage(
    Profile profile,
    Uint8List imageData,
  );

  Future<List<Profile>> query(ProfileQueryOptions queryOptions);
  Stream<List<Profile>> queryStream(ProfileQueryOptions queryOptions);

}
