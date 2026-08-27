import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/bootstrap/init_result.dart';
import 'package:dhyana/bootstrap/initializer.dart';
import 'package:dhyana/core/presentation/view/app.dart';
import 'package:flutter/material.dart';


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