import 'package:material_ui/material_ui.dart';

import 'package:firebase_provider/firebase_provider.dart';
import 'package:stepstones/app.dart';
import 'package:stepstones/bootstrap/init_result.dart';
import 'package:stepstones/bootstrap/initializer.dart';


class AppRobot {

  /// Aims to reduce boilerplate code for initializing the 
  /// application in integration tests.
  static Future<Widget> runTestApp(FirebaseProvider firebaseProvider) async {
    InitResult initResult = await Initializer().init(firebaseProvider);
    final app = App(initResult: initResult);
    runApp(app);
    return app;
  }

}