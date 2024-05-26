import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/firebase/firebase_model_extension.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/data_provider/profile_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';
import 'package:dhyana/model/profile_query_options.dart';

class FirebaseProfileDataProvider
    extends FirebaseDataProvider<Profile>
    implements ProfileDataProvider {

  FirebaseProfileDataProvider(FirebaseFirestore fireStore) : super(
    fireStore.collection('profiles')
      .withConverter<Profile>(
        fromFirestore: (snapshot, _) => fromFireStore(snapshot, Profile.fromJson),
        toFirestore: (profile, _) => profile.toFireStore()
      )
  );

  @override
  Future<List<Profile>> query(ProfileQueryOptions queryOptions) {
    return buildListFromQuery(_buildQuery(queryOptions));
  }

  @override
  Stream<List<Profile>> queryStream(ProfileQueryOptions queryOptions) {
    return buildStreamFromQuery(_buildQuery(queryOptions));
  }

  Query<Profile> _buildQuery(ProfileQueryOptions queryOptions) {
    return collectionRef.limit(queryOptions.limit);
  }

}
