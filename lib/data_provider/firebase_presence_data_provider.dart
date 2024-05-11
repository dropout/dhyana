import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/firebase_data_provider.dart';
import 'package:dhyana/model/presence.dart';

import 'presence_data_provider.dart';

class FirebasePresenceDataProvider
    extends FirebaseDataProvider<Presence>
    implements PresenceDataProvider {

  FirebasePresenceDataProvider(FirebaseFirestore fireStore) : super(
    fireStore.collection('presence')
      .withConverter<Presence>(
      fromFirestore: (snapshot, _) => Presence.fromFireStore(snapshot),
      toFirestore: (profile, _) => profile.toFireStore()
    )
  );

}
