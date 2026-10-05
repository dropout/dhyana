import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';

import 'package:core/src/service/mindful_minutes_service.dart';


class DefaultMindfulMinutesService implements MindfulMinutesService {

  final FlutterMindfulMinutes flutterMindfulMinutes;

  DefaultMindfulMinutesService({
    required this.flutterMindfulMinutes,
  }); 

  @override
  Future<bool> isServiceAvailable() => 
    flutterMindfulMinutes.isAvailable();

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
