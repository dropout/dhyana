import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/session_data_provider.dart';
import 'package:dhyana/model/session.dart';

class FirebaseSessionDataProvider implements SessionDataProvider {

  final FirebaseFirestore _fireStore;

  FirebaseSessionDataProvider({
    required FirebaseFirestore fireStore,
  }) : _fireStore = fireStore;

  CollectionReference<Session> getCollection(String profileId) {
    return _fireStore
        .collection('profiles').doc(profileId)
        .collection('sessions')
        .withConverter<Session>(
      fromFirestore: (snapshot, _) => Session.fromFireStore(snapshot),
      toFirestore: (session, _) => session.toFireStore(),
    );
  }

  @override
  Future<Session> addSession(String profileId, Session session) async {
    await getCollection(profileId)
      .doc(session.id)
      .set(session);
    return session;
  }

  @override
  Future<List<Session>> getSessions(String profileId) async {
    CollectionReference<Session> collectionReference = getCollection(profileId);
    QuerySnapshot<Session> querySnapshot = await collectionReference.get();
    return querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
  }

}
