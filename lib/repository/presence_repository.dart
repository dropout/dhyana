import 'package:dhyana/model/presence.dart';

abstract interface class PresenceRepository {

  Future<void> showPresence(Presence presence);
  Future<List<Presence>> getPresence(String? ownProfileId);

}
