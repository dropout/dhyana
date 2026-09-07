import 'package:profile/profile.dart';
import 'package:session/src/domain/entity/session_entity.dart';


/// An interface that defines the contract for session-related operations
abstract interface class SessionAppPort {

  /// Updates the profile statistics with the completed session.
  Future<({Profile originalProfile, Profile updatedProfile})> updateProfileWithSession(
    String profileId,
    SessionEntity session,
  );

  /// Logs a completed session to the StatsPublicApi.
  Future<void> logSessionStatistics(
    String profileId, 
    SessionEntity session
  );

  /// Checks if the Mindful Minutes service is authorized.
  Future<bool> isMindfulMinutesAuthorized();

  /// Logs a completed session to the Mindful Minutes service.
  Future<void> logMindfulMinutes(DateTime startTime, DateTime endTime);

}
