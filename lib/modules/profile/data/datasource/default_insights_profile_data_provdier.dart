import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/data/datasource/insights_profile_data_provider.dart';
import 'package:dhyana/modules/profile/data/datasource/cache_first_profile_data_provider.dart';

class DefaultInsightsProfileDataProvider 
    extends CacheFirstProfileDataProvider 
    implements InsightsProfileDataProvider {
  
  final CollectionReference<Profile> collectionRef;

  DefaultInsightsProfileDataProvider(FirebaseFirestore fireStore)
    : collectionRef = fireStore
          .collection('profiles')
          .withConverter<Profile>(
            fromFirestore: (snapshot, _) =>
                fromFireStore(snapshot, Profile.fromJson),
            toFirestore: (profile, _) => profile.toFireStore(),
          );

  @override
  Future<InsightsProfileData> getInsightsProfileData(String profileId) async {
    final docRef = collectionRef.doc(profileId);
    final profile = await getCacheFirstProfile(docRef);
    return InsightsProfileData(
      id: profile.id,
      consecutiveDaysCount: profile.statsReport.consecutiveDays.current,
    );
  }

}
