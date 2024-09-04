import 'dart:convert';

import 'package:dhyana/model/factory/all.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dhyana/model/timer_settings.dart';

import 'crashlytics_service.dart';

class TimerSettingsSharedPrefsService {

  static const String sharedPreferencesKey = 'timerSettings';

  final CrashlyticsService crashlyticsService;
  final SharedPreferences sharedPrefs;

  TimerSettingsSharedPrefsService({
    required this.crashlyticsService,
    required this.sharedPrefs,
  });

  TimerSettings getTimerSettings() {

    String? timerSettingsJson = sharedPrefs.getString(sharedPreferencesKey);

    // Fallback to default if no entry found
    if (timerSettingsJson == null) {
      return TimerSettingsFactory.withUuid();
    }

    // Fallback to default if unable to convert
    try {
      Map<String, dynamic> jsonData = const JsonDecoder().convert(timerSettingsJson);
      TimerSettings timerSettings = TimerSettings.fromJson(jsonData);
      return timerSettings;
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to get TimerSettings from shared preferences',
      );
      return TimerSettingsFactory.withUuid();
    }

  }

  Future<void> setTimerSettings(TimerSettings timerSettings) async {
    try {
      Map<String, dynamic> dataMap = timerSettings.toJson();
      String jsonString = const JsonEncoder().convert(dataMap);
      sharedPrefs.setString(sharedPreferencesKey, jsonString);
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to save TimerSettings to shared preferences',
      );
    }
  }

}
