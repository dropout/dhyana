import 'package:dhyana/init/all.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:dhyana/widget/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter', (
      tester,
    ) async {
      // Load app widget.
      FirebaseProvider firebaseProvider = FirebaseProvider();
      final originalError = FlutterError.onError;
      await firebaseProvider.initialize();
      FlutterError.onError = originalError;

      InitResult initResult = await Initializer().init(firebaseProvider);
      await tester.pumpWidget(App(initResult: initResult));

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final fab = find.byKey(const ValueKey('increment'));


      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);
    });
  });
}
