import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/model/profile.dart';

import 'firebase_data_provider.dart';
import 'profile_data_provider.dart';

class FirebaseProfileDataProvider extends FirebaseDataProvider<Profile> implements ProfileDataProvider {

  late final CollectionReference<Profile> _collectionReference;

  FirebaseProfileDataProvider(FirebaseFirestore fireStore) {
    _collectionReference = fireStore.collection('profiles')
      .withConverter<Profile>(
      fromFirestore: (snapshot, _) => Profile.fromFireStore(snapshot),
      toFirestore: (profile, _) => profile.toFireStore()
    );
  }

  @override
  CollectionReference<Profile> get collectionRef {
    return _collectionReference;
  }

}
