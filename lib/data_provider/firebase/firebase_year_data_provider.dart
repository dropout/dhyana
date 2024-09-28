import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_model_extension.dart';
import 'package:dhyana/data_provider/year_data_provider.dart';
import 'package:dhyana/model/year.dart';
import 'package:dhyana/model/year_query_options.dart';

class FirebaseYearDataProvider extends FirebaseDataProvider<Year> implements YearDataProvider {

  FirebaseYearDataProvider(
      FirebaseFirestore fireStore,
      String profileId
      ) : super(fireStore
      .collection('profiles')
      .doc(profileId)
      .collection('months')
      .withConverter<Year>(
    fromFirestore: (snapshot, _) => fromFireStore(snapshot, Year.fromJson),
    toFirestore: (year, _) => year.toFireStore(),
  )
  );

  Query<Year> _buildQuery(YearQueryOptions queryOptions) {
    final FieldPath fieldPath = FieldPath(const ['date']);
    Query<Year> query = collectionRef
        .where(fieldPath, isGreaterThanOrEqualTo: queryOptions.from)
        .where(fieldPath, isLessThanOrEqualTo: queryOptions.to)
        .orderBy(fieldPath);
    return query;
  }

  @override
  Future<List<Year>> query(YearQueryOptions queryOptions) =>
      buildListFromQuery(_buildQuery(queryOptions));


  @override
  Stream<List<Year>> queryStream(YearQueryOptions queryOptions) =>
      buildStreamFromQuery(_buildQuery(queryOptions));

}
