import 'package:dhyana/model/presence.dart';
import 'package:dhyana/model/public_profile.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/util/all.dart';

class StubbedPresenceRepository implements PresenceRepository {

  @override
  Future<List<Presence>> getPresence(String? ownProfileId) {
    return Future.sync(() {
      return List<Presence>.generate(20, (index) {
        return Presence(
          id: 'presence-id-$index',
          profile: PublicProfile(
            id: 'profile-id-$index',
            firstName: 'Firstname-$index',
            lastName: 'Lastname-$index',
            photoUrl: DefaultProfileData.photoUrl,
            photoBlurhash: DefaultProfileData.photoBlurhash,
          ),
          startedAt: DateTime.now().subtract(Duration(minutes: 1 + index * 3)),
        );
      });
    });
  }

  @override
  Future<void> showPresence(Presence presence) {
    return Future.value();
  }

}
