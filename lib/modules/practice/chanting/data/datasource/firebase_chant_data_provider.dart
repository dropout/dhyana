import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/chant_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_entity.dart';

class FirebaseChantsDataProvider
    extends FirebaseDataProvider<ChantEntity>
    implements ChantDataProvider {

  FirebaseChantsDataProvider(FirebaseFirestore fireStore) : super(
    fireStore.collection('chants')
      .withConverter<ChantEntity>(
        fromFirestore: (snapshot, _) => fromFireStore(snapshot, ChantEntity.fromJson),
        toFirestore: (chant, _) => chant.toFireStore(),
      )
  );

  @override
  Future<List<ChantEntity>> queryAll({bool preferCache = false}) {
    return buildListFromQuery(_buildQuery(), preferCache: preferCache);
  }

  @override
  Stream<List<ChantEntity>> queryAllStream() {
    return buildStreamFromQuery(_buildQuery());
  }

  Query<ChantEntity> _buildQuery() {
    return collectionRef.orderBy('order');
  }

}

