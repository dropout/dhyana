import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/modules/profile/data/datasource/profile_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';

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
  Future<List<Profile>> query({int limit = 20}) {
    return buildListFromQuery(_buildQuery(limit: limit));
  }

  @override
  Stream<List<Profile>> queryStream({int limit = 20}) {
    return buildStreamFromQuery(_buildQuery(limit: limit));
  }

  Query<Profile> _buildQuery({int limit = 20}) {
    return collectionRef.limit(limit);
  }

}
