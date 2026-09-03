import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:stats/stats.dart';

import 'package:session/src/domain/service/session_app_port.dart';

class DefaultSessionAppPort implements SessionAppPort {
  final ProfilePublicApi profilePublicApi;
  final StatsPublicApi statsPublicApi;
  final MindfulMinutesService mindfulMinutesService;

  const DefaultSessionAppPort({
    required this.profilePublicApi,
    required this.statsPublicApi,
    required this.mindfulMinutesService,
  });

  @override
  Future<bool> isMindfulMinutesAuthorized() async =>
      (await mindfulMinutesService.getAuthorizationStatus()) == .authorized;

  @override
  Future<void> logMindfulMinutes(DateTime startTime, DateTime endTime) async =>
      mindfulMinutesService.logMindfulMinutes(startTime, endTime);

  @override
  Future<void> logSessionStatistics(
    String profileId,
    StatsSession session,
  ) async => statsPublicApi.logSessionStatistics(profileId, session);

  @override
  Future<({Profile originalProfile, Profile updatedProfile})>
  updateProfileStatsWithSession(String profileId, ProfileSession session) =>
    profilePublicApi.updateProfileStatsWithSession(profileId, session);
  
}
