import 'package:dhyana/core/di/core_dependencies.dart';
import 'package:dhyana/modules/insights/di/insights_dependencies.dart';
import 'package:dhyana/modules/practice/session/di/session_dependencies.dart';
import 'package:dhyana/modules/profile/di/dependency_injection.dart';
import 'package:dhyana/modules/social/di/social_dependencies.dart';
import 'package:dhyana/modules/practice/timer/di/timer_dependencies.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerSingleton<FirebaseProvider>(FirebaseProvider());

  configureCoreDependencies();
  configureProfileModuleDependencies();
  configureSocialModuleDependencies();
  configureTimerModuleDependencies();
  configureSessionModuleDependencies();
  configureInsightsModuleDependencies();
}
