import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:session/src/domain/entity/session_entity.dart';
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
  Future<void> saveSessionStats(
    String profileId,
    SessionEntity session,
  ) async => statsPublicApi.logSessionStats(
      profileId, 
      StatsSession(
        id: session.id,
        startTime: session.startTime,
        endTime: session.endTime,
        duration: session.duration,
        type: switch (session.type) {
          .timer => .sitting,
          .chanting => .chanting,
        },
      )
    );

  @override
  Future<({Profile originalProfile, Profile updatedProfile})>
  updateProfileWithSession(String profileId, SessionEntity session) => 
    profilePublicApi.updateProfileStatsWithSession(
      profileId, 
      ProfileSession(
        id: session.id,
        startTime: session.startTime,
        endTime: session.endTime,
        duration: session.duration,
        type: switch(session.type) {
          .timer => .sitting,
          .chanting => .chanting,
        },
      ),
    );
  
}
