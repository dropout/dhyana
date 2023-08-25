import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/day_data_provider.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/util/date_time.dart';

class FirebaseDayDataProvider implements DayDataProvider {

  final FirebaseFirestore _fireStore;

  FirebaseDayDataProvider(FirebaseFirestore fireStore,) : _fireStore = fireStore;

  CollectionReference<Day> getCollection(String profileId) {
    return _fireStore
        .collection('profiles').doc(profileId)
        .collection('days')
        .withConverter<Day>(
      fromFirestore: (snapshot, _) => Day.fromFireStore(snapshot),
      toFirestore: (session, _) => session.toFireStore(),
    );
  }

  @override
  Future<Session> addSessionToDay(String profileId, Session session) async {
    CollectionReference<Day> collection = getCollection(profileId);
    String dayId = session.startTime.toDayId();

    DocumentReference<Day> dayRef = collection.doc(dayId);
    DocumentSnapshot<Day> day = await dayRef.get();

    Day d;
    if (day.exists == false) {
      d = Day(
        id: dayId,
        date: session.startTime,
        sessions: [session],
        minutes: session.duration.inMinutes,
      );
      await collection.doc(d.id).set(d);
    } else {
      d = day.data()!;
      d = d.copyWith(
        sessions: d.sessions.toList()..add(session),
        minutes: d.minutes + session.duration.inMinutes,
      );
      await collection.doc(d.id).update(d.toFireStore());
    }

    return session;
  }

  @override
  Future<Day> getDay(String profileId, DateTime day) async {
    CollectionReference<Day> collection = getCollection(profileId);
    DocumentSnapshot<Day> snapshot =
      await collection.doc(day.toDayId()).get();
    return snapshot.data()!;
  }

  @override
  Future<List<Day>> getDays(String profileId, DateTime from, DateTime to) async {
    final CollectionReference<Day> collection = getCollection(profileId);
    final FieldPath fieldPath = FieldPath(const ['date']);
    Query<Day> query = collection.where(fieldPath, isGreaterThanOrEqualTo: from);
    query = collection.where(fieldPath, isLessThanOrEqualTo: to);
    query.orderBy(fieldPath);
    final QuerySnapshot<Day> querySnapshot = await query.get();
    return querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
  }

}
