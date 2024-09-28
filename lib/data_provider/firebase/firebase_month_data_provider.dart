import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_model_extension.dart';
import 'package:dhyana/data_provider/month_data_provider.dart';
import 'package:dhyana/model/month.dart';
import 'package:dhyana/model/month_query_options.dart';

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
    final FieldPath fieldPath = FieldPath(const ['date']);
    Query<Month> query = collectionRef
        .where(fieldPath, isGreaterThanOrEqualTo: queryOptions.from)
        .where(fieldPath, isLessThanOrEqualTo: queryOptions.to)
        .orderBy(fieldPath);
    return query;
  }

  @override
  Future<List<Month>> query(MonthQueryOptions queryOptions) =>
      buildListFromQuery(_buildQuery(queryOptions));


  @override
  Stream<List<Month>> queryStream(MonthQueryOptions queryOptions) =>
      buildStreamFromQuery(_buildQuery(queryOptions));

}
