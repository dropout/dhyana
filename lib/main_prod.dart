import 'package:dhyana/core/bootstrap/init_result.dart';
import 'package:dhyana/core/bootstrap/initializer.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/presentation/widget/app.dart';

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
