import 'package:stepstones/app.dart';
import 'package:firebase_provider/firebase_provider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:stepstones/bootstrap/init_result.dart';
import 'package:stepstones/bootstrap/initializer.dart';


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
