import 'package:dhyana/core/core_di.dart';
import 'package:dhyana/modules/auth/auth_di.dart';
import 'package:dhyana/modules/insights/insights_di.dart';
import 'package:dhyana/modules/practice/chanting/chanting_di.dart';
import 'package:dhyana/modules/practice/session/session_di.dart';
import 'package:dhyana/modules/profile/profile_di.dart';
import 'package:dhyana/modules/social/social_di.dart';
import 'package:dhyana/modules/practice/timer/timer_di.dart';
import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:get_it/get_it.dart';

Future<void> initializeDependencies() async {
  GetIt.I.registerSingleton<FirebaseProvider>(FirebaseProvider());

  configureCoreDependencies();
  configureAuthModuleDependencies();
  configureProfileModuleDependencies();
  configureSocialModuleDependencies();
  configureTimerModuleDependencies();
  configureChantingModuleDependencies();
  configureSessionModuleDependencies();
  configureInsightsModuleDependencies();
}
