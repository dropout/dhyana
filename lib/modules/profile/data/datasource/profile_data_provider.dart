import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';

abstract interface class ProfileDataProvider
    implements DataProvider<Profile> {

  Future<List<Profile>> query({int limit = 20});
  Stream<List<Profile>> queryStream({int limit = 20});

}
