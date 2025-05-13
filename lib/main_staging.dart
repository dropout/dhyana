import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'init/all.dart';
import 'util/firebase_provider.dart';
import 'widget/app.dart';
import 'widget/app_maintenance_mode.dart';

void main() async {
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

  if (initResult.services.remoteConfigService.maintenanceModeEnabled) {
    runApp(AppMaintenanceMode());
  } else {
    runApp(App(
      initResult: initResult,
    ));
  }

}
