import 'package:firebase_provider/firebase_provider.dart';
import 'package:core/core.dart';
import 'package:stats/src/data/datasource/stats_bucket_data_provider.dart';
import 'package:stats/src/domain/entity/stats_bucket_entity.dart';

class FirebaseStatsBucketDataProvider extends FirebaseDataProvider<StatsBucketEntity> implements StatsBucketDataProvider {

  final FirebaseFirestore fireStore;
  final String profileId;
  final String bucketName;

  FirebaseStatsBucketDataProvider({
    required this.fireStore,
    required this.profileId,
    required this.bucketName,
  }) : super(
          fireStore
            .collection('profiles')
            .doc(profileId)
            .collection(bucketName)
            .withConverter<StatsBucketEntity>(
              fromFirestore: (snapshot, _) => StatsBucketEntity.fromJson(snapshot.data()!),
              toFirestore: (bucket, _) => bucket.toJson(),
            ),
        );

  Query<StatsBucketEntity> _buildQuery({required DateTime from, required DateTime to}) {
    final FieldPath fieldPath = FieldPath(const ['startDate']);
    Query<StatsBucketEntity> query = collectionRef
      .where(fieldPath, isGreaterThanOrEqualTo: const DateTimeConverter().toJson(from))
      .where(fieldPath, isLessThan: const DateTimeConverter().toJson(to))
      .orderBy(fieldPath);
    return query;
  }

  @override
  Future<List<StatsBucketEntity>> query({required DateTime from, required DateTime to}) =>
      buildListFromQuery(_buildQuery(from: from, to: to));

  @override
  Stream<List<StatsBucketEntity>> queryStream({required DateTime from, required DateTime to}) =>
      buildStreamFromQuery(_buildQuery(from: from, to: to));

  @override
  Future<void> set(StatsBucketEntity bucket, {bool merge = false, List<Object>? mergeFields}) async =>
      collectionRef.doc(bucket.id).set(bucket, SetOptions(merge: merge, mergeFields: mergeFields));

}