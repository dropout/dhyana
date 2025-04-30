import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_model_extension.dart';
import 'package:dhyana/data_provider/month_data_provider.dart';
import 'package:dhyana/model/month.dart';
import 'package:dhyana/model/month_query_options.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/util/date_time_utils.dart';

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
      .where(fieldPath, isLessThan: queryOptions.to)
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
  Future<void> logSession(Session session) async {
    final String monthId = session.startTime.toMonthId();

    late Month updatedMonth;
    try {
      // Month exists
      Month thisMonth = await read(monthId);
      updatedMonth = thisMonth.copyWith(
        sessionCount: thisMonth.sessionCount + 1,
        minutesCount: thisMonth.minutesCount + session.duration.inMinutes,
      );
    } catch(_, __) {
      // Month doesn't exists in database yet
      updatedMonth = Month(
        id: monthId,
        startDate: DateTime(
          session.startTime.year,
          session.startTime.month,
        ),
        minutesCount: session.duration.inMinutes,
        sessionCount: 1,
      );
    }

    DocumentReference<Month> monthRef = collectionRef.doc(updatedMonth.id);
    await monthRef.set(updatedMonth, SetOptions(merge: true));


  }

}
