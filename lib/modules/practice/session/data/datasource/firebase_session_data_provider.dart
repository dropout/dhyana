import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/modules/practice/session/data/datasource/session_data_provider.dart';
import 'package:dhyana/core/domain/entity/session.dart';

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
  Future<List<Session>> query({int limit = 20}) {
    return buildListFromQuery(_buildQuery(limit: limit));
  }

  @override
  Stream<List<Session>> queryStream({int limit = 20}) {
    return buildStreamFromQuery(_buildQuery(limit: limit));
  }

  Query<Session> _buildQuery({int limit = 20}) {
    Query<Session> q = collectionRef.orderBy('startTime', descending: true);
    return q.limit(limit);
  }

  static String generateId() {
    // Collection name doesn't matter here, we just need a unique ID
    return FirebaseFirestore.instance.collection('id_generators')
      .doc().id;
  }

}
