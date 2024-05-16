import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/data_provider/profile_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';

class FirebaseProfileDataProvider
    extends FirebaseDataProvider<Profile>
    implements ProfileDataProvider {

  FirebaseProfileDataProvider(FirebaseFirestore fireStore) : super(
    fireStore.collection('profiles')
      .withConverter<Profile>(
      fromFirestore: (snapshot, _) => Profile.fromFireStore(snapshot),
      toFirestore: (profile, _) => profile.toFireStore()
    )
  );

}
