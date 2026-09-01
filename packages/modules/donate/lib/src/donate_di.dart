import 'package:get_it/get_it.dart';


extension DonateDependencyInjection on GetIt {
  void registerDonateModuleDependencies() {
    // Register dependencies for the Donate module here.
    // For example, if you have a repository or service for donations, register it.
    // get.registerLazySingleton<DonateRepository>(() => DonateRepositoryImpl());
  }
}