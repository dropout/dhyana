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

  @override
  Future<Session> logSession(Session session) async {
    String dayId = session.startTime.toYearId();

    DocumentReference<Year> monthRef = collectionRef.doc(dayId);
    DocumentSnapshot<Year> month = await monthRef.get();

    Year y;
    if (month.exists == false) {
      y = Year(
        id: dayId,
        date: session.startTime,
        minutes: session.duration.inMinutes,
        sessionCount: 1,
      );
      await collectionRef.doc(y.id).set(y);
    } else {
      y = month.data()!;
      y = y.copyWith(
        minutes: y.minutes + session.duration.inMinutes,
      );
      Map<String, Object?> data = y.toJson();
      data['sessionCount'] = FieldValue.increment(1);
      await collectionRef.doc(y.id).update(data);
    }
    return session;
  }

}
