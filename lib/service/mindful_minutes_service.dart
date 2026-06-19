import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';

abstract interface class MindfulMinutesService {
  Future<bool> isServiceAvailable();
  Future<AuthorizationStatus> getAuthorizationStatus();
  Future<RequestStatusForAuthorization> getRequestForAuthorizationStatus();
  Future<bool> requestAuthorization();
  Future<void> saveMindfulMinutes(DateTime start, DateTime end);
}
