import 'package:mobile_app/app.dart';
import 'package:mobile_app/bootstrap/init_result.dart';
import 'package:mobile_app/bootstrap/initializer.dart';
import 'package:firebase_provider/firebase_provider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';


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

  InitResult initResult = await Initializer().init(firebaseProvider);
  runApp(App(
    initResult: initResult,
  ));
}
