import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/presence_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';
import 'package:dhyana/model/presence.dart';

class FirebasePresenceDataProvider
    extends FirebaseDataProvider<Presence>
    implements PresenceDataProvider {

  FirebasePresenceDataProvider(FirebaseFirestore fireStore) : super(
    fireStore.collection('presence')
      .withConverter<Presence>(
      fromFirestore: (snapshot, _) => Presence.fromFireStore(snapshot),
      toFirestore: (presence, _) => presence.toFireStore()
    )
  );

}
