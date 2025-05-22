import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/factory/timer_settings_factory.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/logging_crashlytics_service.dart';
import 'package:dhyana/service/shader_service.dart';
import 'package:dhyana/service/timer_settings_shared_prefs_service.dart';
import 'package:dhyana/widget/profile/all.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:dhyana/widget/timer/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../test_context_providers.dart';

class MockTimerSettingsBloc
  extends MockBloc<TimerSettingsEvent, TimerSettingsState>
  implements TimerSettingsBloc {}

class MockAuthBloc
  extends MockBloc<AuthEvent, AuthState>
  implements AuthBloc {}

class MockServices
  extends Mock
  implements Services {}

class MockTimerSettingsSharedPrefsService
  extends Mock
  implements TimerSettingsSharedPrefsService {}

class MockShaderService
  extends Mock
  implements ShaderService {}


void main() {

  group('HomeScreenContent signed out', () {
    late MockAuthBloc authBloc;
    late MockTimerSettingsBloc timerSettingsBloc;
    late MockServices services;
    late MockTimerSettingsSharedPrefsService timerSettingsSharedPrefsService;
    late ShaderService mockShaderService;

    setUp(() async {
      authBloc = MockAuthBloc();
      timerSettingsBloc = MockTimerSettingsBloc();
      services = MockServices();
      timerSettingsSharedPrefsService = MockTimerSettingsSharedPrefsService();
      mockShaderService = MockShaderService();


      when(() => authBloc.state)
        .thenReturn(const AuthState.signedOut());
      when(() => authBloc.stream)
        .thenAnswer((_) => Stream.value(const AuthState.signedOut()));
      when(() => timerSettingsBloc.state)
        .thenReturn(const TimerSettingsState.loading());
      when(() => timerSettingsBloc.stream)
        .thenAnswer((_) => Stream.value(const TimerSettingsState.loading()));

      when(() => timerSettingsSharedPrefsService.getTimerSettings())
        .thenReturn(TimerSettings());

      FragmentProgram program = await FragmentProgram.fromAsset('shaders/gradient_flow.frag');
      FragmentShader shader = program.fragmentShader();

      when(() => mockShaderService.get(any()))
        .thenReturn(shader);

      // BloCs
      when(() => authBloc.stream)
        .thenAnswer((_) => Stream.value(const AuthState.signedOut()));
      when(() => timerSettingsBloc.stream)
        .thenAnswer((_) => Stream.value(const TimerSettingsState.loading()));
      when(() => timerSettingsBloc.state)
        .thenReturn(const TimerSettingsState.loading());
      when(() => authBloc.state)
        .thenReturn(const AuthState.signedOut());

      // Services
      when(() => services.crashlyticsService)
        .thenReturn(LoggingCrashlyticsService());
      when(() => services.timerSettingsSharedPrefsService)
        .thenReturn(timerSettingsSharedPrefsService);
      when(() => services.shaderService)
        .thenReturn(mockShaderService);

    });


    testWidgets('HomeScreenContent can display a loading state', (WidgetTester tester) async {

      when(() => timerSettingsBloc.state)
        .thenReturn(const TimerSettingsState.loading());

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => services,
          child: getAllTestContextProviders(
            MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(
                  create: (context) => authBloc,
                ),
                BlocProvider<TimerSettingsBloc>(
                  create: (context) => timerSettingsBloc,
                ),
              ],
              child: const HomeScreen(),
            )
          )
        )
      );
      await tester.pump(const Duration(milliseconds: 120));
      expect(find.text('Loading'), findsOne);
    });


    testWidgets('HomeScreenContent can display an error state', (WidgetTester tester) async {

      when(() => timerSettingsBloc.state)
        .thenReturn(const TimerSettingsState.error());

      await tester.pumpWidget(
        getAllTestContextProviders(
          MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (context) => authBloc,
              ),
              BlocProvider<TimerSettingsBloc>(
                create: (context) => timerSettingsBloc,
              ),
            ],
            child: const HomeScreen(),
          )
        )
      );

      await tester.pumpAndSettle();
      expect(find.text('Error occured'), findsOne);
    });


    testWidgets('HomeScreen can a loaded state', (WidgetTester tester) async {

      when(() => timerSettingsBloc.state).thenReturn(
        TimerSettingsState.loaded(
          timerSettings: TimerSettingsFactory.withUuid()
        )
      );

      await tester.pumpWidget(
          getAllTestContextProviders(
              MultiBlocProvider(
                providers: [
                  BlocProvider<AuthBloc>(
                    create: (context) => authBloc,
                  ),
                  BlocProvider<TimerSettingsBloc>(
                    create: (context) => timerSettingsBloc,
                  ),
                ],
                child: const HomeScreen(),
              )
          )
      );

      await tester.pumpAndSettle();
      expect(find.byType(TimerSettingsView), findsOneWidget);
      expect(find.byType(ProfileButton), findsOneWidget);
    });

  });



}
