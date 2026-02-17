import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/chants_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_model_extension.dart';
import 'package:dhyana/model/chant.dart';

class FirebaseChantsDataProvider
    extends FirebaseDataProvider<Chant>
    implements ChantsDataProvider {

  FirebaseChantsDataProvider(FirebaseFirestore fireStore) : super(
    fireStore.collection('chants')
      .withConverter<Chant>(
        fromFirestore: (snapshot, _) => fromFireStore(snapshot, Chant.fromJson),
        toFirestore: (chant, _) => chant.toFireStore(),
      )
  );

  @override
  Future<List<Chant>> queryAll() {
    return buildListFromQuery(_buildQuery());
  }

  @override
  Stream<List<Chant>> queryAllStream() {
    return buildStreamFromQuery(_buildQuery());
  }

  Query<Chant> _buildQuery() {
    return collectionRef.orderBy('name');
  }

}

