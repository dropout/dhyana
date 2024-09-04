import 'package:dhyana/service/all.dart';
import 'package:dhyana/service/haptics_service.dart';
import 'package:dhyana/service/shader_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {

  final AnalyticsService analyticsService;
  final CrashlyticsService crashlyticsService;
  final TimerSettingsSharedPrefsService timerSettingsSharedPrefsService;
  final ShaderService shaderService;
  final HapticsService hapticsService;
  final ResourceResolver resourceResolver;

  Services({
    required this.hapticsService,
    required this.resourceResolver,
    required SharedPreferences sharedPreferences,
    required FirebaseAnalytics firebaseAnalytics,
    required FirebaseCrashlytics firebaseCrashlytics,
  }) :
    analyticsService = FirebaseAnalyticsService(firebaseAnalytics),
    crashlyticsService = FirebaseCrashlyticsService(firebaseCrashlytics),
    timerSettingsSharedPrefsService = TimerSettingsSharedPrefsService(
      crashlyticsService: FirebaseCrashlyticsService(firebaseCrashlytics),
      sharedPrefs: sharedPreferences,
    ),
    shaderService = ShaderService();

}
