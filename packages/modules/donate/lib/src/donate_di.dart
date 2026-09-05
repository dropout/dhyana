import 'package:core/core.dart';
import 'package:donate/src/data/service/default_donate_navigator.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';


extension DonateDependencyInjection on GetIt {
  void registerDonateModuleDependencies() {

    // Navigator
    registerLazySingleton<DonateNavigator>(
      () => DefaultDonateNavigator(get<GoRouter>())
    );

  }
}