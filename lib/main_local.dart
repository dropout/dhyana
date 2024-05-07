import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dhyana/init/all.dart';
import 'package:dhyana/util/firebase_provider.dart';

import 'widget/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase
  FirebaseProvider firebaseProvider =
    FirebaseProvider(persistenceEnabled: false);
  await firebaseProvider.initialize();
  await firebaseProvider.useEmulator();

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
}
