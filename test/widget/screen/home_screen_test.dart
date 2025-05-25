
import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/default_shader_service.dart';
import 'package:dhyana/service/shader_service.dart';
import 'package:dhyana/service/timer_settings_shared_prefs_service.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:dhyana/widget/timer/all.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../test_context_providers.dart';

class MockAuthBloc
  extends MockBloc<AuthEvent, AuthState>
  implements AuthBloc {}

class MockProfileBloc
  extends MockBloc<ProfileEvent, ProfileState>
  implements ProfileBloc {}

class MockServices
  extends Mock
  implements Services {}

class MockCrashlyticsService
  extends Mock
  implements CrashlyticsService {}

class MockTimerSettingsSharedPrefsService
  extends Mock
  implements TimerSettingsSharedPrefsService {}

void main() {

  group('HomeScreen', () {
    late MockAuthBloc mockAuthBloc;
    late MockProfileBloc mockProfileBloc;
    late MockServices mockServices;
    late MockTimerSettingsSharedPrefsService mockTimerSettingsSharedPrefsService;
    late MockCrashlyticsService mockCrashlyticsService;

    // doesn't make sense to mock this because the FragmentShader
    // cannot be mocked neither, so you need to load the shader anyhow
    late ShaderService shaderService = DefaultShaderService();

    setUp(() async {
      mockAuthBloc = MockAuthBloc();
      mockProfileBloc = MockProfileBloc();
      mockServices = MockServices();
      mockTimerSettingsSharedPrefsService = MockTimerSettingsSharedPrefsService();
      mockCrashlyticsService = MockCrashlyticsService();

      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);
      when(() => mockServices.timerSettingsSharedPrefsService)
        .thenReturn(mockTimerSettingsSharedPrefsService);
      when(() => mockServices.shaderService)
        .thenReturn(shaderService);

      // preload the only shader which is used in HomeScreen
      await shaderService.loadShader('shaders/gradient_flow.frag');
    });

    tearDown(() {
      shaderService.close();
    });

    testWidgets('HomeScreen can load TimerSettings without constructor argument given', (WidgetTester tester) async {

      when(() => mockAuthBloc.state)
        .thenReturn(const AuthState.signedOut());

      when(() => mockTimerSettingsSharedPrefsService.getTimerSettings())
          .thenReturn(TimerSettings());

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: getAllTestContextProviders(
            MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(
                  create: (context) => mockAuthBloc,
                ),
              ],
              child: const HomeScreen(),
            )
          )
        )
      );

      // only pump no settle because of infinite animation startbutton
      await tester.pump();

      expect(find.byType(TimerSettingsView), findsOneWidget);
      verify(() => mockTimerSettingsSharedPrefsService.getTimerSettings()).called(1);

    });

    testWidgets('HomeScreen does not load TimerSettings when its given in the constructor', (WidgetTester tester) async {

      when(() => mockAuthBloc.state)
          .thenReturn(const AuthState.signedOut());

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: getAllTestContextProviders(
            MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(
                  create: (context) => mockAuthBloc,
                ),
              ],
              child: const HomeScreen(
                timerSettings: TimerSettings(),
              ),
            )
          )
        )
      );

      // only pump no settle because of infinite startbutton animation
      await tester.pump();

      expect(find.byType(TimerSettingsView), findsOneWidget);
      verifyNever(() => mockTimerSettingsSharedPrefsService.getTimerSettings());

    });

    testWidgets('HomeScreen can display an error state', (WidgetTester tester) async {

      when(() => mockAuthBloc.state)
          .thenReturn(const AuthState.signedOut());

      when(() => mockTimerSettingsSharedPrefsService.getTimerSettings())
        .thenThrow(Exception('Error occured'));

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: getAllTestContextProviders(
            MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(
                  create: (context) => mockAuthBloc,
                ),
              ],
              child: const HomeScreen(),
            )
          )
        )
      );

      // can settle because there is no start button in this case
      await tester.pumpAndSettle();
      expect(find.byType(AppErrorDisplay), findsOneWidget);
    });


    testWidgets('HomeScreen will display a sign in button when signed out', (WidgetTester tester) async {

      when(() => mockAuthBloc.state)
          .thenReturn(const AuthState.signedOut());

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: getAllTestContextProviders(
              MultiBlocProvider(
                providers: [
                  BlocProvider<AuthBloc>(
                    create: (context) => mockAuthBloc,
                  ),
                ],
                child: const HomeScreen(
                  timerSettings: TimerSettings(),
                ),
              )
          )
        )
      );

      await tester.pump();
      expect(find.byType(TimerSettingsView), findsOneWidget);
      expect(find.byIcon(Icons.account_circle_outlined), findsOneWidget);
    });

    testWidgets('HomeScreen will display a view profile button when signed in', (WidgetTester tester) async {

      when(() => mockAuthBloc.state)
        .thenReturn(
          AuthState.signedIn(
            user: FakeModelFactory().createUser()
          )
        );

      when(() => mockProfileBloc.state)
        .thenReturn(ProfileState.loaded(
            profile: FakeModelFactory().createProfile()
          )
        );

      // Because of ProfileImage initState Future.delayed
      // need to run the test in real async mode not fake async
      // hence the complication of runAsync
      await tester.runAsync(() async {
        await tester.pumpWidget(
            Provider<Services>(
                create: (context) => mockServices,
                child: getAllTestContextProviders(
                    MultiBlocProvider(
                      providers: [
                        BlocProvider<AuthBloc>(
                          create: (context) => mockAuthBloc,
                        ),
                        BlocProvider<ProfileBloc>(
                          create: (context) => mockProfileBloc,
                        )
                      ],
                      child: const HomeScreen(
                        timerSettings: TimerSettings(),
                      ),
                    )
                )
            )
        );

        await tester.pump(Duration(milliseconds: 1000));

        expect(find.byType(TimerSettingsView), findsOneWidget);
        expect(find.byType(ProfileImage), findsOneWidget);

      });

    });



  });





}
