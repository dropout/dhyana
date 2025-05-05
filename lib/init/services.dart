import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dhyana/data_provider/firebase/firebase_id_generator.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/service/id_generator_service.dart';

class Services {

  final AnalyticsService analyticsService;
  final CrashlyticsService crashlyticsService;
  final TimerSettingsSharedPrefsService timerSettingsSharedPrefsService;
  final ShaderService shaderService;
  final HapticsService hapticsService;
  final ResourceResolver resourceResolver;
  final IdGeneratorService idGeneratorService;

  Services({
    required this.hapticsService,
    required this.resourceResolver,
    required SharedPreferences sharedPreferences,
    required FirebaseFirestore firebaseFirestore,
    required FirebaseAnalytics firebaseAnalytics,
    required FirebaseCrashlytics firebaseCrashlytics,
  }) :
    analyticsService = FirebaseAnalyticsService(firebaseAnalytics),
    crashlyticsService = FirebaseCrashlyticsService(firebaseCrashlytics),
    timerSettingsSharedPrefsService = TimerSettingsSharedPrefsService(
      crashlyticsService: FirebaseCrashlyticsService(firebaseCrashlytics),
      sharedPrefs: sharedPreferences,
    ),
    shaderService = ShaderService(),
    idGeneratorService = IdGeneratorService(FirebaseIdGenerator(firebaseFirestore));

}
