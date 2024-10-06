import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_model_extension.dart';
import 'package:dhyana/data_provider/year_data_provider.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/year.dart';
import 'package:dhyana/model/year_query_options.dart';
import 'package:dhyana/util/date_time_utils.dart';

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

  @override
  Future<void> logSession(Session session) async {
    final String yearId = session.startTime.toYearId();

    late Year updatedYear;
    try {
      // Year exists
      Year thisMonth = await read(yearId);
      updatedYear = thisMonth.copyWith(
        sessionCount: thisMonth.sessionCount + 1,
        minutes: thisMonth.minutes + session.duration.inMinutes,
      );
    } catch(_, __) {
      // Year doesn't exists in database yet
      updatedYear = Year(
        id: yearId,
        date: DateTime(
          session.startTime.year,
        ),
        sessionCount: 1,
        minutes: session.duration.inMinutes,
      );
    }

    DocumentReference<Year> yearRef = collectionRef.doc(updatedYear.id);
    await yearRef.set(updatedYear, SetOptions(merge: true));
  }

}
