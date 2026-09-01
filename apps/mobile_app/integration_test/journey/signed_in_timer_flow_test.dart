import 'package:core/core.dart';
import 'package:firebase_provider/firebase_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../robot/app_robot.dart';
import '../robot/auth_robot.dart';
import '../util/pump_until_found.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  FirebaseProvider firebaseProvider = FirebaseProvider();
  await firebaseProvider.initialize();

  group('signed in timer flow test', () {
    setUp(() async {
      await firebaseProvider.auth.signOut();
    });

    testWidgets('can configure timer settings', (tester) async {
      await AppRobot.runTestApp(firebaseProvider);
      await tester.pumpUntilFound(find.byType(HomeScreen));

      final authRobot = AuthRobot(tester);
      await authRobot.autoSigninWithEmailAndPassword();
      await tester.pumpUntilFound(find.byKey(const Key('profile_screen')));

      expect(find.textContaining('Adam'), findsOneWidget);
    });

    // testWidgets('can use the timer', (
    //   tester,
    // ) async {
    //   await AppRobot.runTestApp(firebaseProvider);
    //   await tester.pumpAndSettle();

    //   expect(find.byType(HomeScreen), findsOneWidget);

    // });
  });
}
