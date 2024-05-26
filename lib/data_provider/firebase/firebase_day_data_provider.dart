import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/day_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_model_extension.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/day_query_options.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/util/date_time_utils.dart';

class FirebaseDayDataProvider extends FirebaseDataProvider<Day> implements DayDataProvider {

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
  Future<Session> addSession(Session session) async {
    String dayId = session.startTime.toDayId();

    DocumentReference<Day> dayRef = collectionRef.doc(dayId);
    DocumentSnapshot<Day> day = await dayRef.get();

    Day d;
    if (day.exists == false) {
      d = Day(
        id: dayId,
        date: session.startTime,
        sessions: [session],
        minutes: session.duration.inMinutes,
      );
      await collectionRef.doc(d.id).set(d);
    } else {
      d = day.data()!;
      d = d.copyWith(
        sessions: d.sessions.toList()..add(session),
        minutes: d.minutes + session.duration.inMinutes,
      );
      await collectionRef.doc(d.id).update(d.toFireStore());
    }
    return session;
  }

  @override
  Future<List<Day>> query(DayQueryOptions queryOptions) {
    return buildListFromQuery(_buildQuery(queryOptions));
  }

  @override
  Stream<List<Day>> queryStream(DayQueryOptions queryOptions) {
    return buildStreamFromQuery(_buildQuery(queryOptions));
  }

  Query<Day> _buildQuery(DayQueryOptions queryOptions) {
    final FieldPath fieldPath = FieldPath(const ['date']);
    Query<Day> query = collectionRef
        .where(fieldPath, isGreaterThanOrEqualTo: queryOptions.from)
        .where(fieldPath, isLessThanOrEqualTo: queryOptions.to)
        .orderBy(fieldPath);
    return query;
  }

}
