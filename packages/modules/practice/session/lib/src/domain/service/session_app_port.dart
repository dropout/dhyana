import 'package:profile/profile.dart';
import 'package:stats/stats.dart';

abstract interface class SessionAppPort {

  Future<({Profile originalProfile, Profile updatedProfile})> updateProfileStatsWithSession(
    String profileId,
    ProfileSession session,
  );

  Future<void> logSessionStatistics(String profileId, StatsSession session);

  Future<bool> isMindfulMinutesAuthorized();
  Future<void> logMindfulMinutes(DateTime startTime, DateTime endTime);

}
