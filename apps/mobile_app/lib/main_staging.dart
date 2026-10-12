import 'package:mobile_app/app.dart';
import 'package:firebase_provider/firebase_provider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/bootstrap/init_error_display.dart';

import 'bootstrap/init_result.dart';
import 'bootstrap/initializer.dart';


void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // Firebase
    FirebaseProvider firebaseProvider = FirebaseProvider();
    await firebaseProvider.initialize();

    // Set system UI
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: []
    );

    // Bloc.observer = DebugPrintBlocObserver();

    InitResult initResult = await Initializer().init(firebaseProvider);
    runApp(App(
      initResult: initResult,
    ));
  
  } catch (e, stack) {
    FirebaseCrashlytics.instance.recordError(
      e,
      stack,
      reason: 'Unable to initalize the application',
      fatal: true,
    );
    runApp(InitErrorDisplay());
  }


}
