import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/*
  Helper class to avoid using global static singletons
  and improve the testability of the application.

  Don't:
  SomeServiceOrDataProvider(FirebaseFirestore.instance)

  Do:
  SomeServiceOrDataProvider(firebaseProvider.firestore)
 */
class FirebaseProvider {

  bool _useEmulator = false;
  final bool persistenceEnabled;
  Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: false,
      excludeBox: {
        Level.trace: true
      },
    )
  );

  FirebaseProvider({this.persistenceEnabled = true});

  Future<FirebaseApp> initialize() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    if (kDebugMode) {
      await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(false);
    }
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    return firebaseApp;
  }

  Future<void> useEmulator() async {
    logger.i('Using Firebase Emulator with persistenceEnabled: $persistenceEnabled');
    if (persistenceEnabled == false) {
      firestore.settings = const Settings(
        persistenceEnabled: false,
      );
    }

    _setFirebaseFirestoreEmulatorUsage();
    await _setFirebaseStorageEmulatorUsage();
    await _setFirebaseAuthEmulatorUsage();
    await _setFirebaseFunctionsEmulatorUsage();
    _useEmulator = true;
  }

  FirebaseFirestore get firestore =>
    FirebaseFirestore.instance;

  FirebaseStorage get storage =>
    FirebaseStorage.instanceFor();

  FirebaseAuth get auth =>
    FirebaseAuth.instance;

  FirebaseCrashlytics get crashlytics =>
    FirebaseCrashlytics.instance;

  FirebaseAnalytics get analytics =>
    FirebaseAnalytics.instance;

  FirebaseRemoteConfig get remoteConfig =>
    FirebaseRemoteConfig.instance;

  FirebaseFunctions get functions =>
    FirebaseFunctions.instanceFor(region: "europe-central2");

  bool get isEmulatorUsageEnabled => _useEmulator;

  Future<void> clearPersistence() async {
    logger.t('Clearing persistance');
    await firestore.terminate();
    await firestore.clearPersistence();
  }

  void _setFirebaseFirestoreEmulatorUsage() {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator(
        _getEmulatorHost(),
        8080,
        sslEnabled: false,
      );
      logger.t('Firestore emulator: ${_getEmulatorHost()}:8080}');
    } catch (err) {
      logger.t('Unable to set FireStore emulator!');
      rethrow;
    }
  }

  Future<void> _setFirebaseStorageEmulatorUsage() async {
    try {
      await FirebaseStorage.instance.useStorageEmulator(_getEmulatorHost(), 9199);
      logger.t('Storage emulator: ${_getEmulatorHost()}:9199}');
    } catch (err) {
      logger.t('Unable to set Firebase Storage emulator!');
      rethrow;
    }
  }

  Future<void> _setFirebaseAuthEmulatorUsage() async {
    try {
      await FirebaseAuth.instance.useAuthEmulator(_getEmulatorHost(), 9099);
      logger.t('Storage emulator host: ${_getEmulatorHost()}:9099}');
    } catch (err) {
      logger.t('Unable to set Firebase Auth emulator!');
      rethrow;
    }
  }

    Future<void> _setFirebaseFunctionsEmulatorUsage() async {
      try {
        FirebaseFunctions.instance.useFunctionsEmulator(_getEmulatorHost(), 5001);
        logger.t('Functions emulator host: ${_getEmulatorHost()}:5001}');
      } catch (err) {
        logger.t('Unable to set Firebase Auth emulator!');
        rethrow;
      }
    }

  String _getEmulatorHost() {
    return '127.0.0.1';
  }

}
