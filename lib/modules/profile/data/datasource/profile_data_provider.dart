import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_entity.dart';

abstract interface class ProfileDataProvider
    implements DataProvider<ProfileEntity> {

  Future<List<ProfileEntity>> query({int limit = 20});
  Stream<List<ProfileEntity>> queryStream({int limit = 20});

}
