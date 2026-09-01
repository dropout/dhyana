import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

/// Extension on [WidgetTester] to repeatedly pump the widget tree until 
/// a specific [Finder] is found or a timeout occurs.
/// Useful for waiting for asynchronous operations to complete 
/// in integration tests.
extension WidgetTesterExtensions on WidgetTester {
  Future<void> pumpUntilFound(
    Finder finder, {
    Duration timeout = const Duration(seconds: 10),
  }) async {
    bool timerDone = false;
    final timer = Timer(timeout, () => timerDone = true);
    
    while (timerDone != true) {
      await pump(const Duration(milliseconds: 100));
      
      final found = any(finder);
      if (found) {
        timer.cancel();
        return;
      }
    }
    
    throw Exception('Timeout waiting for $finder to appear.');
  }
}
