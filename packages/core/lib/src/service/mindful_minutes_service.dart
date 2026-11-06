import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';

abstract interface class MindfulMinutesService {

  /// Checks whether the service required to store mindful minutes on the platform is available.
  /// Throws an exception if the service is not available.
  Future<void> checkAvailability();

  /// Gets the current authorization status for accessing mindful minutes data.
  Future<AuthorizationStatus> getAuthorizationStatus();

  /// Gets the current request status for authorization to access mindful minutes data.
  Future<RequestStatusForAuthorization> getRequestForAuthorizationStatus();

  /// Actually requests authorization to access mindful minutes data. 
  /// Returns true if authorization was granted, false otherwise.
  Future<bool> requestAuthorization();

  /// Logs mindful minutes for the specified time range.
  Future<void> logMindfulMinutes(DateTime start, DateTime end);
  
}
