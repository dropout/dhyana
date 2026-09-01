import 'package:go_router/go_router.dart';

enum NavigationType { push, replace, go }

abstract class BaseNavigator {
  final GoRouter router;
  const BaseNavigator(this.router);

  Future<T?> navigateTo<T extends Object?>(
    GoRouteData route, {
    NavigationType type = .push,
  }) async {
    switch (type) {
      case NavigationType.push:
        return router.push<T>(route.location);
      case NavigationType.replace:
        return router.replace<T>(route.location);
      case NavigationType.go:
        router.go(route.location);
        return null; // to avoid compiler warning for missing return
    }
  }
}
