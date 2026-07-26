import 'package:dhyana/core/di/dependency_injection.dart';
import 'package:dhyana/modules/profile/di/dependency_injection.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerSingleton<FirebaseProvider>(FirebaseProvider());

  configureCoreDependencies();
  configureProfileModuleDependencies();
}
