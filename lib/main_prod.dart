import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dhyana/initalizer.dart';

import 'widgets/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase
  await Firebase.initializeApp();
  if (kDebugMode) {
    await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(false);
  }
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  // Set system UI
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom]
  );

  Initializer initializer = Initializer();
  InitResult initResult = await initializer.init();
  runApp(App(
    initResult: initResult,
  ));
}
