
import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile_settings.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/default/default_shader_service.dart';
import 'package:dhyana/service/shader_service.dart';
import 'package:dhyana/widget/profile/profile_button.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:dhyana/widget/timer/all.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../test_context_providers.dart';
import '../../mock_definitions.dart';

void main() {

  group('HomeScreen', () {
    late MockAuthBloc mockAuthBloc;
    late MockProfileCubit mockProfileCubit;
    late MockServices mockServices;
    late MockTimerSettingsSharedPrefsService mockTimerSettingsSharedPrefsService;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockOverlayService mockOverlayService;
    late MockCacheManagerService mockCacheManagerService;
    late MockCacheManager mockCacheManager;

    // doesn't make sense to mock this because the FragmentShader
    // cannot be mocked neither, so you need to load the shader anyhow
    late ShaderService shaderService = DefaultShaderService();

    setUp(() async {
      mockAuthBloc = MockAuthBloc();
      mockProfileCubit = MockProfileCubit();
      mockServices = MockServices();
      mockTimerSettingsSharedPrefsService = MockTimerSettingsSharedPrefsService();
      mockCrashlyticsService = MockCrashlyticsService();
      mockOverlayService = MockOverlayService();
      mockCacheManagerService = MockCacheManagerService();
      mockCacheManager = MockCacheManager();

      when(() => mockAuthBloc.state)
        .thenReturn(const AuthState.signedOut());

      when(() => mockProfileCubit.state)
        .thenReturn(ProfileState.initial());

      when(() => mockServices.cacheManagerService)
        .thenReturn(mockCacheManagerService);

      when(() => mockCacheManagerService.cacheManager)
        .thenReturn(mockCacheManager);

      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);
      when(() => mockServices.timerSettingsSharedPrefsService)
        .thenReturn(mockTimerSettingsSharedPrefsService);
      when(() => mockServices.shaderService)
        .thenReturn(shaderService);
      when(() => mockServices.overlayService)
        .thenReturn(mockOverlayService);

      // preload the only shader which is used in HomeScreen
      await shaderService.loadShader('shaders/gradient_flow.frag');
    });

    tearDown(() {
      shaderService.close();
    });

    testWidgets('can load TimerSettings without constructor argument given', (WidgetTester tester) async {

      when(() => mockAuthBloc.state)
        .thenReturn(const AuthState.signedOut());

      when(() => mockTimerSettingsSharedPrefsService.getTimerSettings())
        .thenReturn(TimerSettings());

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: withAllContextProviders(
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

    testWidgets('does not load TimerSettings when its given as a parameter in the constructor', (WidgetTester tester) async {

      when(() => mockAuthBloc.state)
          .thenReturn(const AuthState.signedOut());

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: withAllContextProviders(
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

    testWidgets('can display an error state', (WidgetTester tester) async {

      when(() => mockAuthBloc.state)
          .thenReturn(const AuthState.signedOut());

      when(() => mockTimerSettingsSharedPrefsService.getTimerSettings())
        .thenThrow(Exception('Error occured'));

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: withAllContextProviders(
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


    testWidgets('will display a sign in button when signed out', (WidgetTester tester) async {

      when(() => mockAuthBloc.state)
          .thenReturn(const AuthState.signedOut());

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: withAllContextProviders(
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

    testWidgets('will display a view profile button when signed in', (WidgetTester tester) async {

      when(() => mockAuthBloc.state)
        .thenReturn(
          AuthState.signedIn(
            user: FakeModelFactory().createUser()
          )
        );

      final profile = FakeModelFactory().createProfile();
      when(() => mockProfileCubit.state)
        .thenReturn(ProfileState.loaded(
            profile: profile,
            settings: ProfileSettings(id: profile.id)
          )
        );

      // Because of ProfileImage initState Future.delayed
      // need to run the test in real async mode not fake async
      // hence the complication of runAsync
      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            Provider<Services>(
              create: (context) => mockServices,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<AuthBloc>(
                    create: (context) => mockAuthBloc,
                  ),
                  BlocProvider<ProfileCubit>(
                    create: (context) => mockProfileCubit,
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
        expect(find.byType(ProfileButton), findsOneWidget);
      });

    });

    testWidgets('will display a timer settings history button when signed in', (WidgetTester tester) async {

      when(() => mockAuthBloc.state)
        .thenReturn(
          AuthState.signedIn(
            user: FakeModelFactory().createUser()
          )
        );

      final profile = FakeModelFactory().createProfile();
      when(() => mockProfileCubit.state)
        .thenReturn(ProfileState.loaded(
            profile: profile,
            settings: ProfileSettings(id: profile.id)
          )
        );

      // Because of ProfileImage initState Future.delayed
      // need to run the test in real async mode not fake async
      // hence the complication of runAsync
      await tester.runAsync(() async {
        await tester.pumpWidget(
            Provider<Services>(
                create: (context) => mockServices,
                child: withAllContextProviders(
                    MultiBlocProvider(
                      providers: [
                        BlocProvider<AuthBloc>(
                          create: (context) => mockAuthBloc,
                        ),
                        BlocProvider<ProfileCubit>(
                          create: (context) => mockProfileCubit,
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

        expect(find.byType(TimerSettingsHistoryButton), findsOneWidget);

      });

    });

  });

}
