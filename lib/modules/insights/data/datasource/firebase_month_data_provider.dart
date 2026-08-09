import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/modules/insights/data/datasource/month_data_provider.dart';
import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:dhyana/modules/insights/domain/entity/month.dart';

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

  Query<Month> _buildQuery({required DateTime from, required DateTime to}) {
    final FieldPath fieldPath = FieldPath(const ['startDate']);
    Query<Month> query = collectionRef
      .where(fieldPath, isGreaterThanOrEqualTo: const DateTimeConverter().toJson(from))
      .where(fieldPath, isLessThan: const DateTimeConverter().toJson(to))
      .orderBy(fieldPath);
    return query;
  }

  @override
  Future<List<Month>> query({required DateTime from, required DateTime to}) =>
      buildListFromQuery(_buildQuery(from: from, to: to));


  @override
  Stream<List<Month>> queryStream({required DateTime from, required DateTime to}) =>
      buildStreamFromQuery(_buildQuery(from: from, to: to));

  @override
  Future<void> set(Month month, {bool merge = false, List<Object>? mergeFields}) async =>
      collectionRef.doc(month.id).set(month, SetOptions(merge: merge, mergeFields: mergeFields));    

}
