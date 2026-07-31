import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session.dart';

abstract class ProfileService {

  Future<({Profile originalProfile, Profile updatedProfile})> updateProfileStatsWithSession(
    String profileId,
    Session session,
  );

}