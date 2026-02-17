import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/session_data_provider.dart';
import 'package:dhyana/model/all.dart';

import 'firebase_data_provider.dart';
import 'firebase_model_extension.dart';

class FirebaseSessionDataProvider
    extends FirebaseDataProvider<Session>
    implements SessionDataProvider {

  FirebaseSessionDataProvider(
    FirebaseFirestore fireStore,
    String profileId,
  ) : super(
    fireStore
      .collection('profiles')
      .doc(profileId)
      .collection('sessions')
      .withConverter<Session>(
        fromFirestore: (snapshot, _) => fromFireStore(snapshot, Session.fromJson),
        toFirestore: (session, _) => session.toFireStore(),
      )
  );

  @override
  Future<List<Session>> query(SessionQueryOptions queryOptions) {
    return buildListFromQuery(_buildQuery(queryOptions));
  }

  @override
  Stream<List<Session>> queryStream(SessionQueryOptions queryOptions) {
    return buildStreamFromQuery(_buildQuery(queryOptions));
  }

  Query<Session> _buildQuery(SessionQueryOptions queryOptions) {
    Query<Session> q = collectionRef.orderBy('startTime', descending: true);
    return q.limit(queryOptions.limit);
  }

  static String generateId() {
    // Collection name doesn't matter here, we just need a unique ID
    return FirebaseFirestore.instance.collection('id_generators')
      .doc().id;
  }

}
