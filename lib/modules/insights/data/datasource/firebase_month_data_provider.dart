import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/modules/insights/data/datasource/month_data_provider.dart';
import 'package:dhyana/core/domain/entity/converter/date_time_converter.dart';
import 'package:dhyana/modules/insights/domain/entity/month.dart';
import 'package:dhyana/modules/insights/domain/entity/month_query_options.dart';

class FirebaseMonthDataProvider extends FirebaseDataProvider<Month> implements MonthDataProvider {

  FirebaseMonthDataProvider(
    FirebaseFirestore fireStore,
    String profileId
  ) : super(fireStore
    .collection('profiles')
    .doc(profileId)
    .collection('months')
    .withConverter<Month>(
      fromFirestore: (snapshot, _) => fromFireStore(snapshot, Month.fromJson),
      toFirestore: (month, _) => month.toFireStore(),
    )
  );

  Query<Month> _buildQuery(MonthQueryOptions queryOptions) {
    final FieldPath fieldPath = FieldPath(const ['startDate']);
    Query<Month> query = collectionRef
      .where(fieldPath, isGreaterThanOrEqualTo: const DateTimeConverter().toJson(queryOptions.from))
      .where(fieldPath, isLessThan: const DateTimeConverter().toJson(queryOptions.to))
      .orderBy(fieldPath);
    return query;
  }

  @override
  Future<List<Month>> query(MonthQueryOptions queryOptions) =>
      buildListFromQuery(_buildQuery(queryOptions));


  @override
  Stream<List<Month>> queryStream(MonthQueryOptions queryOptions) =>
      buildStreamFromQuery(_buildQuery(queryOptions));

  @override
  Future<void> set(Month month, {bool merge = false, List<Object>? mergeFields}) async =>
      collectionRef.doc(month.id).set(month, SetOptions(merge: merge, mergeFields: mergeFields));    

}
