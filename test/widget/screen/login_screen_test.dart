import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/util/all.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../test_context_providers.dart';

typedef OnCompleteCallback = Function(User, bool);

class MockAuthBloc
  extends MockBloc<AuthEvent, AuthState>
  implements AuthBloc {}

class MockUrlLauncher
  extends Mock
  implements UrlLauncher {}

class MockServices
  extends Mock
  implements DefaultServices {}

class MockAnalyticsService
  extends Mock
  implements AnalyticsService {}

class MockHapticsService
  extends Mock
  implements HapticsService {}

class FakeSigninWithGoogle
  extends Fake
  implements SigninWithGoogle {

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FakeSigninWithGoogle';
  }
}

class FakeSigninWithApple
  extends Fake
  implements SigninWithApple {

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FakeSigninWithApple';
  }

}


void main() {

  group('LoginScreen', () {
    late MockAuthBloc mockAuthBloc;
    late MockUrlLauncher mockUrlLauncher;
    late MockServices mockServices;
    late MockAnalyticsService mockAnalyticsService;
    late MockHapticsService mockHapticsService;

    setUp(() {
      mockAuthBloc = MockAuthBloc();
      mockUrlLauncher = MockUrlLauncher();
      mockServices = MockServices();
      mockAnalyticsService = MockAnalyticsService();
      mockHapticsService = MockHapticsService();

      when(() => mockServices.analyticsService)
        .thenReturn(mockAnalyticsService);
      when(() => mockServices.hapticsService)
        .thenReturn(mockHapticsService);

      registerFallbackValue(FakeSigninWithGoogle());
      registerFallbackValue(FakeSigninWithApple());
    });

    group('LoginScreen states', () {

      testWidgets('LoginScreen can display login buttons when signed out', (WidgetTester tester) async {

        when(() => mockAuthBloc.state)
          .thenReturn(const AuthState.signedOut());

        await tester.pumpWidget(
          getAllTestContextProviders(
            BlocProvider<AuthBloc>(
              create: (context) => mockAuthBloc,
              child: const LoginScreen()
            )
          )
        );

        await tester.pumpAndSettle();

        expect(find.text('Bejelentkezés Google-lal'), findsOneWidget);
        expect(find.text('Bejelentkezés Apple-lel'), findsOneWidget);

        expect(find.textContaining('ÁSZF-et', findRichText: true), findsOneWidget);
        expect(find.textContaining('Adatvédelmi nyilatkozatot', findRichText: true), findsOneWidget);
      });

      testWidgets('LoginScreen can display a loading indicator', (WidgetTester tester) async {

        when(() => mockAuthBloc.state)
          .thenReturn(const AuthState.signingIn());

        await tester.pumpWidget(
          getAllTestContextProviders(
            BlocProvider<AuthBloc>(
              create: (context) => mockAuthBloc,
              child: const LoginScreen()
            )
          )
        );

        await tester.pump();
        expect(find.byType(AppLoadingDisplay), findsOneWidget);
      });

      testWidgets('LoginScreen can display an error message', (WidgetTester tester) async {

        when(() => mockAuthBloc.state)
            .thenReturn(const AuthState.error());

        await tester.pumpWidget(
          getAllTestContextProviders(
            BlocProvider<AuthBloc>(
              create: (context) => mockAuthBloc,
              child: const LoginScreen()
            )
          )
        );

        await tester.pumpAndSettle();
        expect(find.byType(AppErrorDisplay), findsOneWidget);
      });

    });



    group('LoginScreen events', () {
      testWidgets('LoginScreen has working login with Google button', (WidgetTester tester) async {

        when(() => mockAuthBloc.state)
          .thenReturn(const AuthState.signedOut());

        when(() => mockUrlLauncher.launchInAppWebView(any()))
          .thenAnswer((_) => Future.value(true));

        await tester.pumpWidget(
          Provider<DefaultServices>(
            create: (context) => mockServices,
            child: getAllTestContextProviders(
              BlocProvider<AuthBloc>(
                create: (context) => mockAuthBloc,
                child: LoginScreen(
                  urlLauncher: mockUrlLauncher,
                )
              )
            )
          )
        );

        await tester.pumpAndSettle();

        final googleButton = find.widgetWithText(
          AppButton,
          'Bejelentkezés Google-lal',
        );
        expect(googleButton, findsOneWidget);

        await tester.tap(googleButton);
        verify(() => mockAuthBloc.add(
            any(that: isA<SigninWithGoogle>())
        )).called(1);

      });

      testWidgets('LoginScreen has working login with Apple button', (WidgetTester tester) async {

        when(() => mockAuthBloc.state)
          .thenReturn(const AuthState.signedOut());

        when(() => mockUrlLauncher.launchInAppWebView(any()))
          .thenAnswer((_) => Future.value(true));

        await tester.pumpWidget(
          Provider<DefaultServices>(
            create: (context) => mockServices,
            child: getAllTestContextProviders(
              BlocProvider<AuthBloc>(
                create: (context) => mockAuthBloc,
                child: LoginScreen(
                  urlLauncher: mockUrlLauncher,
                )
              )
            )
          )
        );

        await tester.pumpAndSettle();
        final appleButton = find.widgetWithText(
          AppButton,
          'Bejelentkezés Apple-lel',
        );
        expect(appleButton, findsOneWidget);
        await tester.tap(appleButton);
        verify(() => mockAuthBloc.add(
            any(that: isA<SigninWithApple>())
        )).called(1);

      });

      testWidgets('LoginScreen has working ToU button', (WidgetTester tester) async {

        when(() => mockAuthBloc.state)
            .thenReturn(const AuthState.signedOut());

        when(() => mockUrlLauncher.launchInAppWebView(any()))
            .thenAnswer((_) => Future.value(true));

        await tester.pumpWidget(
          Provider<DefaultServices>(
            create: (context) => mockServices,
            child: getAllTestContextProviders(
              BlocProvider<AuthBloc>(
                create: (context) => mockAuthBloc,
                child: LoginScreen(
                  urlLauncher: mockUrlLauncher,
                )
              )
            )
          )
        );

        await tester.pumpAndSettle();

        final termsButton = find.textContaining('ÁSZF-et', findRichText: true);
        expect(termsButton, findsOneWidget);

        await tester.tapOnText(find.textRange.ofSubstring('ÁSZF-et'));
        verify(() => mockUrlLauncher.launchInAppWebView(any())).called(1);
      });
    });

  });

}
