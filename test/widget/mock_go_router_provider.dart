import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../mock_definitions.dart';


class MockGoRouterProvider extends StatelessWidget {
  const MockGoRouterProvider({
    required this.mockGoRouter,
    required this.child,
    super.key,
  });

  final MockGoRouter mockGoRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // You'll need to use the internal InheritedGoRouter, which might be hidden
    // or you might mock the context extension directly, depending on the setup.
    // A simpler approach for tests is often to mock the extension methods directly
    // or use a helper that simulates the GoRouter context.
    return InheritedGoRouter(
      goRouter: mockGoRouter,
      child: child
    );

    /* A more robust, but complex, method involves using a key or an
       InheritedWidget that mimics how GoRouter.of(context) works.
       However, for unit/widget testing of calls, mocking the methods
       on a mock object is the most common and effective approach. */
  }
}

void registerFallbackValues() {
  registerFallbackValue(Uri()); // Fallback for path-based navigation
}
