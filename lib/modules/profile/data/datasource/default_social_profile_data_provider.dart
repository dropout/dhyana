import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/data/datasource/firebase_model_extension.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/modules/profile/data/datasource/cache_first_profile_data_provider.dart';
import 'package:dhyana/modules/social/data/datasource/social_profile_data_provider.dart';

class DefaultSocialProfileDataProvider 
    extends CacheFirstProfileDataProvider 
    implements SocialProfileDataProvider {
  
  final CollectionReference<Profile> collectionRef;

  DefaultSocialProfileDataProvider(FirebaseFirestore fireStore)
    : collectionRef = fireStore
          .collection('profiles')
          .withConverter<Profile>(
            fromFirestore: (snapshot, _) =>
                fromFireStore(snapshot, Profile.fromJson),
            toFirestore: (profile, _) => profile.toFireStore(),
          );

  @override
  Future<SocialProfileData> getSocialProfileData(String profileId) async {
    final docRef = collectionRef.doc(profileId);
    final profile = await getCacheFirstProfile(docRef);
    return SocialProfileData(
      id: profile.id,
      firstName: profile.firstName,
      lastName: profile.lastName,
      photoBlurhash: profile.photoBlurhash,
      location: profile.location,
    );
  }

}
