import 'package:auth/auth.dart';
import 'package:chanting/src/domain/service/chanting_app_port.dart';
import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:social/social.dart';

class DefaultChantingAppPort implements ChantingAppPort {
  /// Used to check if the user is authenticated and get the user's ID.
  final AuthPublicApi authPublicApi;

  /// Used to read the user's profile and presence settings.
  final ProfilePublicApi profilePublicApi;

  /// Used to show the user's presence when chanting starts.
  final SocialPublicApi socialPublicApi;

  const DefaultChantingAppPort({
    required this.authPublicApi,
    required this.profilePublicApi,
    required this.socialPublicApi,
  });

  @override
  Future<({String? userId, bool isAuthenticated})> getAuthSession() async {
    final authSession = await authPublicApi.authSessionStream.first;
    return (
      userId: authSession.userId,
      isAuthenticated: authSession.isAuthenticated,
    );
  }

  @override
  Future<Profile> getProfile(String profileId, {bool preferCache = false}) =>
      profilePublicApi.getProfile(profileId, preferCache: preferCache);

  @override
  Future<void> showPresence({
    required String profileId,
    required String firstName,
    required String lastName,
    required DateTime startedAt,
    String? photoBlurhash,
    Location? location,
  }) => socialPublicApi.showPresence(
    profileId: profileId,
    firstName: firstName,
    lastName: lastName,
    photoBlurhash: photoBlurhash,
    location: location,
    startedAt: startedAt,
  );
}
