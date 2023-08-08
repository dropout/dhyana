import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dhyana/initalizer.dart';

import 'widgets/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom]
  );

  Initializer initializer = Initializer();
  InitResult initResult = await initializer.init();
  runApp(App(
    initResult: initResult,
  ));
}
