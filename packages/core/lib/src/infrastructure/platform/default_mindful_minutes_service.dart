import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';

import 'package:core/src/service/mindful_minutes_service.dart';


class const DefaultMindfulMinutesService({
  required final FlutterMindfulMinutes flutterMindfulMinutes,
}) implements MindfulMinutesService {

  @override
  Future<void> checkAvailability() => 
    flutterMindfulMinutes.checkAvailability();

  @override
  Future<RequestStatusForAuthorization> getRequestForAuthorizationStatus() => 
    flutterMindfulMinutes.getRequestForAuthorizationStatus();

  @override
  Future<AuthorizationStatus> getAuthorizationStatus() => 
    flutterMindfulMinutes.getAuthorizationStatus();

  @override
  Future<bool> requestAuthorization() =>
    flutterMindfulMinutes.requestAuthorization();

  @override
  Future<void> logMindfulMinutes(DateTime start, DateTime end) async {
    return flutterMindfulMinutes.writeMindfulMinutes(start, end);
  }
}
