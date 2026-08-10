import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_data_provider.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/modules/insights/data/datasource/day_details_data_provider.dart';
import 'package:dhyana/modules/insights/domain/entity/day_details_entity.dart';

class FirebaseDayDetailsDataProvider
    extends FirebaseDataProvider<DayDetailsEntity>
    implements DayDetailsDataProvider {
  final FirebaseFirestore fireStore;
  final String profileId;

  FirebaseDayDetailsDataProvider({
    required this.fireStore,
    required this.profileId,
  }) : super(
         fireStore
             .collection('profiles')
             .doc(profileId)
             .collection('day_details')
             .withConverter<DayDetailsEntity>(
               fromFirestore: (snapshot, _) =>
                   fromFireStore(snapshot, DayDetailsEntity.fromJson),
               toFirestore: (details, _) => details.toFireStore(),
             ),
       );

  @override
  Future<void> set(
    DayDetailsEntity details, {
    bool merge = false,
    List<Object>? mergeFields,
  }) async => collectionRef
      .doc(details.id)
      .set(details, SetOptions(merge: merge, mergeFields: mergeFields));

  @override
  Future<List<DayDetailsEntity>> query({required DateTime from, required DateTime to}) async {
    final querySnapshot = await collectionRef
        .where('startDate', isGreaterThanOrEqualTo: from)
        .where('startDate', isLessThanOrEqualTo: to)
        .get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Stream<List<DayDetailsEntity>> queryStream({required DateTime from, required DateTime to}) =>
    collectionRef
      .where('startDate', isGreaterThanOrEqualTo: from)
      .where('startDate', isLessThanOrEqualTo: to)
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.data()).toList());

}
