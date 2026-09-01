import 'package:auth/src/presentation/view/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'package:core/core.dart';




void main() {

  group('LoginScreen', () {
    late MockAuthStateCubit mockAuthCubit;
    late MockUrlLauncher mockUrlLauncher;
    late MockServices mockServices;
    late MockAnalyticsService mockAnalyticsService;
    late MockHapticsService mockHapticsService;

    setUp(() {
      mockAuthCubit = MockAuthStateCubit();
      mockUrlLauncher = MockUrlLauncher();
      mockServices = MockServices();
      mockAnalyticsService = MockAnalyticsService();
      mockHapticsService = MockHapticsService();

      when(() => mockServices.analyticsService)
        .thenReturn(mockAnalyticsService);
      when(() => mockServices.hapticsService)
        .thenReturn(mockHapticsService);
      when(() => mockServices.urlLauncher)
        .thenReturn(mockUrlLauncher);
    });

    group('LoginScreen states', () {

      testWidgets('LoginScreen can display login buttons when signed out', (WidgetTester tester) async {

        when(() => mockAuthCubit.state)
          .thenReturn(const AuthState.signedOut());

        await tester.pumpWidget(
          withAllContextProviders(
            BlocProvider<AuthStateCubit>(
              create: (context) => mockAuthCubit,
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

        when(() => mockAuthCubit.state)
          .thenReturn(const AuthState.signingIn());

        await tester.pumpWidget(
          withAllContextProviders(
            BlocProvider<AuthStateCubit>(
              create: (context) => mockAuthCubit,
              child: const LoginScreen()
            )
          )
        );

        await tester.pump();
        expect(find.byType(AppLoadingDisplay), findsOneWidget);
      });

      testWidgets('LoginScreen can display an error message', (WidgetTester tester) async {

        when(() => mockAuthCubit.state)
            .thenReturn(const AuthState.error());

        await tester.pumpWidget(
          withAllContextProviders(
            BlocProvider<AuthStateCubit>(
              create: (context) => mockAuthCubit,
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

        when(() => mockAuthCubit.state)
          .thenReturn(const AuthState.signedOut());

        when(() => mockUrlLauncher.launchInAppWebView(any()))
          .thenAnswer((_) => Future.value(true));

        when(() => mockAuthCubit.signinWithGoogle(
          onComplete: any(named: 'onComplete'),
        )).thenAnswer((_) => Future.value(null));

        await tester.pumpWidget(
          Provider<Services>(
            create: (context) => mockServices,
            child: withAllContextProviders(
              BlocProvider<AuthStateCubit>(
                create: (context) => mockAuthCubit,
                child: LoginScreen()
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

        verify(() => mockAuthCubit.signinWithGoogle(
          onComplete: any(named: 'onComplete'),
        )).called(1);
      });

      testWidgets('LoginScreen has working login with Apple button', (WidgetTester tester) async {

        when(() => mockAuthCubit.state)
          .thenReturn(const AuthState.signedOut());

        when(() => mockUrlLauncher.launchInAppWebView(any()))
          .thenAnswer((_) => Future.value(true));

        when(() => mockAuthCubit.signinWithApple(
          onComplete: any(named: 'onComplete'),
        )).thenAnswer((_) => Future.value(null));

        await tester.pumpWidget(
          Provider<Services>(
            create: (context) => mockServices,
            child: withAllContextProviders(
              BlocProvider<AuthStateCubit>(
                create: (context) => mockAuthCubit,
                child: LoginScreen()
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
        verify(() => mockAuthCubit.signinWithApple(
          onComplete: any(named: 'onComplete'),
        )).called(1);
      });

      testWidgets('LoginScreen has working ToU button', (WidgetTester tester) async {

        when(() => mockAuthCubit.state)
            .thenReturn(const AuthState.signedOut());

        when(() => mockUrlLauncher.launchInAppWebView(any()))
            .thenAnswer((_) => Future.value(true));

        await tester.pumpWidget(
          Provider<Services>(
            create: (context) => mockServices,
            child: withAllContextProviders(
              BlocProvider<AuthStateCubit>(
                create: (context) => mockAuthCubit,
                child: LoginScreen()
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
