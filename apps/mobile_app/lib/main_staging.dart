import 'package:stepstones/app.dart';
import 'package:firebase_provider/firebase_provider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';

import 'bootstrap/init_result.dart';
import 'bootstrap/initializer.dart';


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
  runApp(App(
    initResult: initResult,
  ));
}
