import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/day_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_model_extension.dart';
import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/day_query_options.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/util/date_time_utils.dart';

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
  Future<void> logSession(Session session) async {
    final String todayId = session.startTime.toDayId();

    late Day updatedToday;
    try {
      // Day exists
      Day today = await read(todayId);
      updatedToday = today.copyWith(
        sessionCount: today.sessionCount + 1,
        minutes: today.minutes + session.duration.inMinutes,
        sessions: today.sessions.toList()..add(session)
      );
    } catch(_, __) {
      // Day doesn't exists in database yet
      updatedToday = Day(
        id: todayId,
        date: DateTime(
          session.startTime.year,
          session.startTime.month,
          session.startTime.day,
        ),
        consecutiveDays: 1,
        sessionCount: 1,
        sessions: [
          session
        ],
        minutes: session.duration.inMinutes,
      );
    }

    DocumentReference<Day> dayRef = collectionRef.doc(updatedToday.id);
    await dayRef.set(updatedToday, SetOptions(merge: true));
  }

  Query<Day> _buildQuery(DayQueryOptions queryOptions) {
    final FieldPath fieldPath = FieldPath(const ['date']);
    Query<Day> query = collectionRef
      .where(fieldPath, isGreaterThanOrEqualTo: const DateTimeConverter().toJson(queryOptions.from))
      .where(fieldPath, isLessThanOrEqualTo: const DateTimeConverter().toJson(queryOptions.to))
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
