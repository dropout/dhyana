import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/presence_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';
import 'package:dhyana/model/presence.dart';
import 'package:dhyana/model/presence_query_options.dart';

import 'firebase_model_extension.dart';

class FirebasePresenceDataProvider
    extends FirebaseDataProvider<Presence>
    implements PresenceDataProvider {

  FirebasePresenceDataProvider(FirebaseFirestore fireStore) : super(
    fireStore.collection('presence')
      .withConverter<Presence>(
        fromFirestore: (snapshot, _) => fromFireStore(snapshot, Presence.fromJson),
        toFirestore: (presence, _) => presence.toFireStore()
      )
  );

  @override
  Future<List<Presence>> query(PresenceQueryOptions queryOptions) {
    return buildListFromQuery(_buildQuery(queryOptions));
  }

  @override
  Stream<List<Presence>> queryStream(PresenceQueryOptions queryOptions) {
    return buildStreamFromQuery(_buildQuery(queryOptions));
  }

  Query<Presence> _buildQuery(PresenceQueryOptions queryOptions) {
    Query<Presence> query = collectionRef
        .where('startedAt', isGreaterThan: Timestamp.fromDate(DateTime.now().subtract(queryOptions.windowSize)))
        .where('startedAt', isLessThan: Timestamp.fromDate(DateTime.now()))
        .limit(queryOptions.limit);
    return query;
  }

}
