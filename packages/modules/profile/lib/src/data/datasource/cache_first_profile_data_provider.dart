import 'package:firebase_provider/firebase_provider.dart';
import 'package:profile/src/public/model/profile.dart';

abstract class CacheFirstProfileDataProvider {

  Future<Profile> getCacheFirstProfile(DocumentReference<Profile> docRef) async {
    late final DocumentSnapshot<Profile> snapshot;
    try {
      snapshot = await docRef.get(GetOptions(source: .cache));
    } catch (e) {
      snapshot = await docRef.get(GetOptions(source: .server));
    }
    if (!snapshot.exists) {
      throw Exception('Profile not found');
    }

    final profile = snapshot.data();
    if (profile == null) {
      throw Exception('Profile not found');
    }
    return profile;
  }
}
