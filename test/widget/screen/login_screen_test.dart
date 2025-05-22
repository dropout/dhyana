import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/util/all.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_context_providers.dart';

class MockAuthBloc
  extends MockBloc<AuthEvent, AuthState>
  implements AuthBloc {}

class MockUrlLauncher
  extends Mock
  implements UrlLauncher {}

void main() {

  group('LoginScreen', () {

    testWidgets('LoginScreen has all the necessary interface elements', (WidgetTester tester) async {

      await tester.pumpWidget(
        getAllTestContextProviders(
          BlocProvider<AuthBloc>(
            create: (context) => MockAuthBloc(),
            child: const LoginScreen()
          )
        )
      );

      // wait for the "Who are you?" animation to finish
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.text('Bejelentkezés Google-lal'), findsOneWidget);
      expect(find.text('Bejelentkezés Apple-lel'), findsOneWidget);

      expect(find.textContaining('ÁSZF-et', findRichText: true), findsOneWidget);
      expect(find.textContaining('Adatvédelmi nyilatkozatot', findRichText: true), findsOneWidget);
    });

  });



}
