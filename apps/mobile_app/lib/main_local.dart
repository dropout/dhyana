import 'package:dhyana/app.dart';
import 'package:firebase_provider/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dhyana/bootstrap/init_result.dart';
import 'package:dhyana/bootstrap/initializer.dart';


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
