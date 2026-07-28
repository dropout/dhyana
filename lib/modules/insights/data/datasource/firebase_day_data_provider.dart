import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/modules/insights/data/datasource/day_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/core/domain/entity/converter/date_time_converter.dart';
import 'package:dhyana/modules/insights/domain/model/day.dart';
import 'package:dhyana/modules/insights/domain/model/day_query_options.dart';

class FirebaseDayDataProvider
    extends FirebaseDataProvider<Day>
    implements DayDataProvider {

  FirebaseDayDataProvider(
    FirebaseFirestore fireStore,
    String profileId
  ) : super(fireStore
      .collection('profiles')
      .doc(profileId)
      .collection('days')
      .withConverter<Day>(
        fromFirestore: (snapshot, _) => fromFireStore(snapshot, Day.fromJson),
        toFirestore: (day, _) => day.toFireStore(),
      )
  );

  @override
  Future<void> set(Day day, {bool merge = false, List<Object>? mergeFields}) async =>    
    collectionRef.doc(day.id).set(day, SetOptions(merge: merge, mergeFields: mergeFields));  

  Query<Day> _buildQuery(DayQueryOptions queryOptions) {
    final FieldPath fieldPath = FieldPath(const ['startDate']);
    Query<Day> query = collectionRef
      .where(fieldPath, isGreaterThanOrEqualTo: const DateTimeConverter().toJson(queryOptions.from))
      .where(fieldPath, isLessThan: const DateTimeConverter().toJson(queryOptions.to))
      .orderBy(fieldPath);
    return query;
  }

  @override
  Future<List<Day>> query(DayQueryOptions queryOptions) =>
    buildListFromQuery(_buildQuery(queryOptions));

  @override
  Stream<List<Day>> queryStream(DayQueryOptions queryOptions) =>
    buildStreamFromQuery(_buildQuery(queryOptions));

}
