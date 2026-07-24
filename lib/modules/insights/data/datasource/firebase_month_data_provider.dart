import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/modules/insights/data/datasource/month_data_provider.dart';
import 'package:dhyana/core/domain/model/converter/date_time_converter.dart';
import 'package:dhyana/modules/insights/domain/model/month.dart';
import 'package:dhyana/modules/insights/domain/model/month_query_options.dart';
import 'package:dhyana/modules/practice/session/domain/model/session.dart';
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
    } catch(_) {
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
