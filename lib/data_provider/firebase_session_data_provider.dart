import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/session.dart';

class FirebaseSessionDataProvider
    extends FirebaseDataProvider<Session>
    implements SessionDataProvider {

  FirebaseSessionDataProvider(
    FirebaseFirestore fireStore,
    String profileId
  ) : super(
    fireStore
        .collection('profiles').doc(profileId)
        .collection('sessions')
        .withConverter<Session>(
      fromFirestore: (snapshot, _) => Session.fromFireStore(snapshot),
      toFirestore: (session, _) => session.toFireStore(),
    )
  );

}
