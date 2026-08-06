import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/modules/profile/data/datasource/profile_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_entity.dart';


class FirebaseProfileDataProvider
    extends FirebaseDataProvider<ProfileEntity>
    implements ProfileDataProvider {

  FirebaseProfileDataProvider(FirebaseFirestore fireStore) : super(
    fireStore.collection('profiles')
      .withConverter<ProfileEntity>(
        fromFirestore: (snapshot, _) => fromFireStore(snapshot, ProfileEntity.fromJson),
        toFirestore: (profile, _) => profile.toFireStore()
      )
  );

  @override
  Future<List<ProfileEntity>> query({int limit = 20}) {
    return buildListFromQuery(_buildQuery(limit: limit));
  }

  @override
  Stream<List<ProfileEntity>> queryStream({int limit = 20}) {
    return buildStreamFromQuery(_buildQuery(limit: limit));
  }

  Query<ProfileEntity> _buildQuery({int limit = 20}) {
    return collectionRef.limit(limit);
  }

}
