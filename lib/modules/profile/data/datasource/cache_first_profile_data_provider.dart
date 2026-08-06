import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/modules/profile/profile_module.dart';

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
