import 'package:chanting/src/data/datasource/chant_data_provider.dart';
import 'package:core/core.dart';
import 'package:chanting/src/domain/entity/chant_entity.dart';
import 'package:firebase_provider/firebase_provider.dart';

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

