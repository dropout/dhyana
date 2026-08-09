import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/modules/insights/data/datasource/year_data_provider.dart';
import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:dhyana/modules/insights/domain/entity/year.dart';

class FirebaseYearDataProvider
    extends FirebaseDataProvider<Year>
    implements YearDataProvider {

  FirebaseYearDataProvider(
    FirebaseFirestore fireStore,
    String profileId
  ) : super(fireStore
    .collection('profiles')
    .doc(profileId)
    .collection('years')
    .withConverter<Year>(
      fromFirestore: (snapshot, _) => fromFireStore(snapshot, Year.fromJson),
      toFirestore: (year, _) => year.toFireStore(),
    )
  );

  Query<Year> _buildQuery({required DateTime from, required DateTime to}) {
    final FieldPath fieldPath = FieldPath(const ['startDate']);
    Query<Year> query = collectionRef
      .where(fieldPath, isGreaterThanOrEqualTo: const DateTimeConverter().toJson(from))
      .where(fieldPath, isLessThan: const DateTimeConverter().toJson(to))
      .orderBy(fieldPath);
    return query;
  }

  @override
  Future<List<Year>> query({required DateTime from, required DateTime to}) =>
      buildListFromQuery(_buildQuery(from: from, to: to));

  @override
  Stream<List<Year>> queryStream({required DateTime from, required DateTime to}) =>
      buildStreamFromQuery(_buildQuery(from: from, to: to));

  @override
  Future<void> set(Year year, {bool merge = false, List<Object>? mergeFields}) async =>
      collectionRef.doc(year.id).set(year, SetOptions(merge: merge, mergeFields: mergeFields));    
  

}
