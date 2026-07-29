import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/modules/insights/data/datasource/week_data_provider.dart';
import 'package:dhyana/core/domain/entity/converter/date_time_converter.dart';
import 'package:dhyana/modules/insights/domain/entity/week.dart';
import 'package:dhyana/modules/insights/domain/entity/week_query_options.dart';

class FirebaseWeekDataProvider
    extends FirebaseDataProvider<Week>
    implements WeekDataProvider {

  FirebaseWeekDataProvider(
    FirebaseFirestore fireStore,
    String profileId
  ) : super(fireStore
    .collection('profiles')
    .doc(profileId)
    .collection('weeks')
    .withConverter<Week>(
      fromFirestore: (snapshot, _) => fromFireStore(snapshot, Week.fromJson),
      toFirestore: (week, _) => week.toFireStore(),
    )
  );

  Query<Week> _buildQuery(WeekQueryOptions queryOptions) {
    final FieldPath fieldPath = FieldPath(const ['startDate']);
    Query<Week> query = collectionRef
      .where(fieldPath, isGreaterThanOrEqualTo: const DateTimeConverter().toJson(queryOptions.from))
      .where(fieldPath, isLessThan: const DateTimeConverter().toJson(queryOptions.to))
      .orderBy(fieldPath);
    return query;
  }

  @override
  Future<List<Week>> query(WeekQueryOptions queryOptions) =>
      buildListFromQuery(_buildQuery(queryOptions));

  @override
  Stream<List<Week>> queryStream(WeekQueryOptions queryOptions) =>
      buildStreamFromQuery(_buildQuery(queryOptions));

  @override
  Future<void> set(Week week, {bool merge=false, List<Object>? mergeFields}) async =>
    collectionRef.doc(week.id).set(week, SetOptions(merge: merge, mergeFields: mergeFields));  

}
