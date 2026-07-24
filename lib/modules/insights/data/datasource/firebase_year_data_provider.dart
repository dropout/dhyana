import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/modules/insights/data/datasource/year_data_provider.dart';
import 'package:dhyana/core/domain/model/converter/date_time_converter.dart';
import 'package:dhyana/modules/practice/session/domain/model/session.dart';
import 'package:dhyana/modules/insights/domain/model/year.dart';
import 'package:dhyana/modules/insights/domain/model/year_query_options.dart';
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
    final FieldPath fieldPath = FieldPath(const ['startDate']);
    Query<Year> query = collectionRef
      .where(fieldPath, isGreaterThanOrEqualTo: const DateTimeConverter().toJson(queryOptions.from))
      .where(fieldPath, isLessThan: const DateTimeConverter().toJson(queryOptions.to))
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
      Year thisYear = await read(yearId);
      updatedYear = thisYear.copyWith(
        minutesCount: thisYear.minutesCount + session.duration.inMinutes,
        sessionCount: thisYear.sessionCount + 1,
      );
    } catch(_) {
      // Year doesn't exists in database yet
      updatedYear = Year(
        id: yearId,
        startDate: DateTime(
          session.startTime.year,
        ),
        sessionCount: 1,
        minutesCount: session.duration.inMinutes,
      );
    }

    DocumentReference<Year> yearRef = collectionRef.doc(updatedYear.id);
    await yearRef.set(updatedYear, SetOptions(merge: true));
  }

}
