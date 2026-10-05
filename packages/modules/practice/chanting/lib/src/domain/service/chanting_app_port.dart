import 'package:core/core.dart';
import 'package:profile/profile.dart';

/// A port to interact with the rest of the application
abstract interface class ChantingAppPort {
  Future<({String? userId, bool isAuthenticated})> getAuthSession();
  Future<Profile> getProfile(String profileId, {bool preferCache = false});
  Future<void> showPresence({
    required String profileId,
    required String firstName,
    required String lastName,
    required DateTime startedAt,
    String? photoBlurhash,
    Location? location,
  });
}
