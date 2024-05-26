import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_query_options.dart';

import 'data_provider.dart';

abstract interface class ProfileDataProvider
    implements DataProvider<Profile> {

  Future<List<Profile>> query(ProfileQueryOptions queryOptions);
  Stream<List<Profile>> queryStream(ProfileQueryOptions queryOptions);

}
