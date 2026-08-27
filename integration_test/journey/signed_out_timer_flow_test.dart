import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../robot/app_robot.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final firebaseProvider = FirebaseProvider();
  await firebaseProvider.initialize();

  group('signed out timer flow test', () {

    setUp(() async {
      await firebaseProvider.auth.signOut();
    });

    testWidgets('can configure a timer session', (tester) async {
      AppRobot.runTestApp(firebaseProvider);
      await tester.pumpAndSettle();

    });

    testWidgets('can use the timer', (tester) async {
      AppRobot.runTestApp(firebaseProvider);
      await tester.pumpAndSettle();

    });

  });
}
