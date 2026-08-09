import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/modules/practice/session/data/datasource/session_data_provider.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';

class FirebaseSessionDataProvider
    extends FirebaseDataProvider<SessionEntity>
    implements SessionDataProvider {

  FirebaseSessionDataProvider(
    FirebaseFirestore fireStore,
    String profileId,
  ) : super(
    fireStore
      .collection('profiles')
      .doc(profileId)
      .collection('sessions')
      .withConverter<SessionEntity>(
        fromFirestore: (snapshot, _) => fromFireStore(snapshot, SessionEntity.fromJson),
        toFirestore: (session, _) => session.toFireStore(),
      )
  );

  @override
  Future<List<SessionEntity>> query({int limit = 20}) {
    return buildListFromQuery(_buildQuery(limit: limit));
  }

  @override
  Stream<List<SessionEntity>> queryStream({int limit = 20}) {
    return buildStreamFromQuery(_buildQuery(limit: limit));
  }

  Query<SessionEntity> _buildQuery({int limit = 20}) {
    Query<SessionEntity> q = collectionRef.orderBy('startTime', descending: true);
    return q.limit(limit);
  }

  static String generateId() {
    // Collection name doesn't matter here, we just need a unique ID
    return FirebaseFirestore.instance.collection('id_generators')
      .doc().id;
  }

}
