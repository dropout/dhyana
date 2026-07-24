import 'package:dhyana/core/data/data_provider.dart';
import 'package:dhyana/core/domain/model/profile.dart';
import 'package:dhyana/core/domain/model/profile_query_options.dart';

abstract interface class ProfileDataProvider
    implements DataProvider<Profile> {

  Future<List<Profile>> query(ProfileQueryOptions queryOptions);
  Stream<List<Profile>> queryStream(ProfileQueryOptions queryOptions);

}
