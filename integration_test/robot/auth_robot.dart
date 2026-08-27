import 'package:dhyana/core/presentation/view/home/home_screen.dart';
import 'package:dhyana/modules/auth/presentation/view/login_with_email_and_password_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/pump_until_found.dart';

class AuthRobot {
  final WidgetTester tester;
  AuthRobot(this.tester);

  /// Taps the profile button in the app bar when the user is signed out.
  Future<void> tapSignedOutProfileButton() async {
    await tester.tap(find.byKey(Key('profile_button_signed_out_ink_well')));
  }

  /// Reads environment variables for email and password and logs in the user.
  Future<void> autoSigninWithEmailAndPassword() async {
    await tester.tap(find.byKey(Key('profile_button_signed_out_ink_well')));
    await tester.pumpAndSettle();

    final email = const String.fromEnvironment('TEST_USER_EMAIL');
    final password = const String.fromEnvironment('TEST_USER_PASSWORD');

    if (email.isEmpty || password.isEmpty) {
      throw Exception(
        'Environment variables TEST_USER_EMAIL and TEST_USER_PASSWORD must be set for auto login.',
      );
    }

    await tester.tap(find.byKey(Key('login_with_email_and_password_button')));
    await tester.pumpUntilFound(find.byType(LoginWithEmailAndPasswordScreen));

    // Fill in the email and password fields
    await tester.enterText(find.byKey(Key('login_form_email_input')), email);
    await tester.enterText(find.byKey(Key('login_form_password_input')), password);

    // Tap the sign in button
    await tester.tap(find.byKey(Key('login_with_email_and_password_button')));
    await tester.pumpAndSettle();
  }

  /// Requires you to pass in the email and password to log in the user.
  Future<void> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await tapSignedOutProfileButton();
    await tester.pumpAndSettle();
    expect(find.byType(LoginWithEmailAndPasswordScreen), findsOneWidget);
  }

  /// Signs out the user if they are signed in.
  Future<void> signOut() async {
    // Check if the user is signed in by looking for the profile button
    final signedInInkwellFinder = find.byKey(
      Key('profile_button_signed_in_ink_well'),
    );
    try {
      await tester.pumpUntilFound(signedInInkwellFinder);
    } catch (e) {
      debugPrint('Profile button not found. Cannot sign out.');
      return;
    }

    // Taps appbar profile button
    await tester.tap(signedInInkwellFinder);
    await tester.pumpAndSettle();

    // Scroll to the sign out tile in the profile menu
    final signoutTileFinder = find.byKey(Key('profile_menu_signout_tile'));
    await tester.scrollUntilVisible(signoutTileFinder, 50);
    await tester.pumpAndSettle();

    // Taps the sign out tile in the profile menu
    await tester.tap(signoutTileFinder);
    await tester.pumpAndSettle();

    // Acknowledge the sign out dialog
    final signoutDialogButtonFinder = find.byKey(
      Key('signout_dialog_signout_button'),
    );
    await tester.pumpUntilFound(signoutDialogButtonFinder);
    await tester.tap(signoutDialogButtonFinder);
    await tester.pumpAndSettle(Duration(seconds: 1));
    
    expect(find.byType(HomeScreen), findsOneWidget);
  }
}
