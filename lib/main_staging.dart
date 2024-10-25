import 'package:dhyana/bloc/debug_print_bloc_observer.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dhyana/init/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'init/init_result.dart';
import 'widget/app.dart';

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

  Bloc.observer = DebugPrintBlocObserver();

  InitResult initResult = await Initializer().init(firebaseProvider);
  runApp(App(
    initResult: initResult,
  ));
}
