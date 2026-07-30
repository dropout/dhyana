import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/modules/practice/timer/data/datasource/timer_profile_data_provider.dart';
import 'package:dhyana/modules/profile/data/datasource/cache_first_profile_data_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DefaultTimerProfileDataProvider extends CacheFirstProfileDataProvider
    implements TimerProfileDataProvider {
  final CollectionReference<Profile> collectionRef;

  DefaultTimerProfileDataProvider(FirebaseFirestore firestore)
    : collectionRef = firestore
          .collection('profiles')
          .withConverter<Profile>(
            fromFirestore: (snapshot, _) =>
                fromFireStore(snapshot, Profile.fromJson),
            toFirestore: (profile, _) => profile.toFireStore(),
          );

  @override
  Future<TimerProfileData> getTimerProfileData(String userId) async {
    final docRef = collectionRef.doc(userId);
    final profile = await getCacheFirstProfile(docRef);
    return TimerProfileData(
      profileId: profile.id,
      firstName: profile.firstName,
      lastName: profile.lastName,
      location: profile.location,
      photoBlurhash: profile.photoBlurhash,
      usePresenceFeature: profile.settings.usePresenceFeature,
    );
  }
}
