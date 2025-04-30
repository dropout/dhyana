import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_model_extension.dart';
import 'package:dhyana/data_provider/week_data_provider.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/week.dart';
import 'package:dhyana/model/week_query_options.dart';
import 'package:dhyana/util/date_time_utils.dart';

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
    final FieldPath fieldPath = FieldPath(const ['date']);
    Query<Week> query = collectionRef
      .where(fieldPath, isGreaterThanOrEqualTo: queryOptions.from)
      .where(fieldPath, isLessThan: queryOptions.to)
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
  Future<void> logSession(Session session) async {
    final String weekId = session.startTime.toWeekId();

    late Week updatedWeek;
    try {
      // Week exists
      Week thisWeek = await read(weekId);
      updatedWeek = thisWeek.copyWith(
        sessionCount: thisWeek.sessionCount + 1,
        minutesCount: thisWeek.minutesCount + session.duration.inMinutes,
      );
    } catch(_, __) {
      // Week doesn't exist in database yet
      updatedWeek = Week(
        id: weekId,
        startDate: DateTime(
          session.startTime.year,
          session.startTime.month,
          session.startTime.day - session.startTime.weekday + 1,
        ),
        sessionCount: 1,
        minutesCount: session.duration.inMinutes,
      );
    }

    DocumentReference<Week> weekRef = collectionRef.doc(updatedWeek.id);
    await weekRef.set(updatedWeek, SetOptions(merge: true));
  }

}
