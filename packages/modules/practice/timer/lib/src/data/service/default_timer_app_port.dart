import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:social/social.dart';
import 'package:timer/src/domain/service/timer_app_port.dart';

class DefaultTimerAppPort implements TimerAppPort {
  /// Used to check if the user is authenticated and get the user's ID.
  final AuthPublicApi authPublicApi;

  /// Used to read the user's profile and get the user's settings.
  final ProfilePublicApi profilePublicApi;

  /// Used to show the user's presence when the timer starts.
  final SocialPublicApi socialPublicApi;

  const DefaultTimerAppPort({
    required this.authPublicApi,
    required this.profilePublicApi,
    required this.socialPublicApi,
  });

  @override
  Future<({String? userId, bool isAuthenticated})> getAuthSession() async {
    final authSession = await authPublicApi.authSessionStream.first;
    return (userId: authSession.userId, isAuthenticated: authSession.isAuthenticated);
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
  }) async {
    await socialPublicApi.showPresence(
      profileId: profileId,
      firstName: firstName,
      lastName: lastName,
      photoBlurhash: photoBlurhash,
      location: location,
      startedAt: startedAt,
    );
  }
  
}