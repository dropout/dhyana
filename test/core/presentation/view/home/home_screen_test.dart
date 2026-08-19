import 'package:dhyana/core/presentation/view/home/home_screen_appbar.dart';
import 'package:dhyana/core/presentation/view/home/home_screen_bottom_menu.dart';
import 'package:dhyana/core/presentation/view/home/session_type_toggle.dart';
import 'package:dhyana/core/presentation/viewmodel/auth_cubit.dart';
import 'package:dhyana/core/presentation/viewmodel/home_screen_cubit.dart';
import 'package:dhyana/core/presentation/viewmodel/profile_cubit.dart';
import 'package:dhyana/core/util/services.dart';
import 'package:dhyana/modules/practice/chanting/public/view/chanting_settings/chanting_settings_view.dart';
import 'package:dhyana/modules/practice/chanting/public/viewmodel/chanting_settings_cubit.dart';
import 'package:dhyana/modules/practice/timer/public/viewmodel/timer_settings_cubit.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/core/infrastructure/platform/default_shader_service.dart';
import 'package:dhyana/core/service/shader_service.dart';
import 'package:dhyana/core/presentation/view/home/home_screen.dart';
import 'package:dhyana/core/presentation/view/app_bar/timer_settings_history_button.dart';
import 'package:dhyana/modules/practice/timer/public/view/timer_settings/timer_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../modules/practice/chanting/chanting_mock_definitions.dart';
import '../../../../test_context_providers.dart';
import '../../../../mock_definitions.dart';

void main() {
  group('HomeScreen', () {
    late MockAuthCubit mockAuthBloc;
    late MockProfileCubit mockProfileCubit;
    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockOverlayService mockOverlayService;
    late MockHapticsService mockHapticsService;
    late MockChantingApi mockChantingApi;
    late MockSharedPreferencesService mockSharedPreferencesService;

    // doesn't make sense to mock this because the FragmentShader
    // cannot be mocked neither, so you need to load the shader anyhow
    late ShaderService shaderService = DefaultShaderService();

    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final storage = MockHydratedStorage();
      when(() => storage.write(any(), any())).thenAnswer((_) async {});
      when(() => storage.read(any())).thenReturn(null);
      HydratedBloc.storage = storage;
    });

    setUp(() async {
      mockAuthBloc = MockAuthCubit();
      mockProfileCubit = MockProfileCubit();
      mockServices = MockServices();
      mockCrashlyticsService = MockCrashlyticsService();
      mockOverlayService = MockOverlayService();
      mockHapticsService = MockHapticsService();
      mockChantingApi = MockChantingApi();
      mockSharedPreferencesService = MockSharedPreferencesService();

      when(() => mockAuthBloc.state).thenReturn(const AuthState.signedOut());
      when(() => mockProfileCubit.state).thenReturn(ProfileState.initial());
      when(
        () => mockServices.crashlyticsService,
      ).thenReturn(mockCrashlyticsService);

      when(() => mockServices.shaderService).thenReturn(shaderService);
      when(() => mockServices.overlayService).thenReturn(mockOverlayService);
      when(() => mockServices.hapticsService).thenReturn(mockHapticsService);

      // preload the only shader which is used in HomeScreen
      await shaderService.loadShader('shaders/gradient_flow.frag');

      GetIt.I.registerFactory<HomeScreenCubit>(
        () => HomeScreenCubit(crashlyticsService: mockCrashlyticsService),
      );

      GetIt.I.registerFactory<TimerSettingsCubit>(
        () => TimerSettingsCubit(crashlyticsService: mockCrashlyticsService),
      );

      GetIt.I.registerFactory<ChantingSettingsCubit>(
        () => ChantingSettingsCubit(
          chantingApi: mockChantingApi,
          sharedPreferencesService: mockSharedPreferencesService,
          crashlyticsService: mockCrashlyticsService
        ),
      );
    });

    tearDown(() {
      shaderService.close();
      GetIt.I.reset();
    });

    testWidgets('can display timer settings when signed out', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(AuthState.signedOut());

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: withAllContextProviders(
            MultiBlocProvider(
              providers: [
                BlocProvider<AuthCubit>(create: (context) => mockAuthBloc),
                BlocProvider<ProfileCubit>(
                  create: (context) => mockProfileCubit,
                ),
              ],
              child: const HomeScreen(),
            ),
          ),
        ),
      );

      // Infinite animation in the start button prevents settling,
      // so we only pump for a duration
      await tester.pump(Duration(milliseconds: 512));

      expect(find.byType(HomeScreenAppbar), findsOneWidget);
      expect(find.byType(TimerSettingsView), findsOneWidget);
      expect(find.byType(TimerSettingsHistoryButton), findsNothing);
      expect(find.byType(HomeScreenBottomMenu), findsOneWidget);
    });

    testWidgets('can display timer settings when signed in', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.signedIn(userId: FakeModelFactory().createUserEntity().uid),
      );

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: withAllContextProviders(
            MultiBlocProvider(
              providers: [
                BlocProvider<AuthCubit>(create: (context) => mockAuthBloc),
                BlocProvider<ProfileCubit>(
                  create: (context) => mockProfileCubit,
                ),
              ],
              child: const HomeScreen(),
            ),
          ),
        ),
      );

      await tester.pump(Duration(milliseconds: 512));

      expect(find.byType(HomeScreenAppbar), findsOneWidget);
      expect(find.byType(TimerSettingsView), findsOneWidget);
      expect(find.byType(TimerSettingsHistoryButton), findsOneWidget);
      expect(find.byType(SessionTypeToggle), findsOneWidget);
    });

    testWidgets('can display chanting settings when signed in', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.signedIn(userId: FakeModelFactory().createUserEntity().uid),
      );

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: withAllContextProviders(
            MultiBlocProvider(
              providers: [
                BlocProvider<AuthCubit>(create: (context) => mockAuthBloc),
                BlocProvider<ProfileCubit>(
                  create: (context) => mockProfileCubit,
                ),
              ],
              child: const HomeScreen(),
            ),
          ),
        ),
      );

      await tester.pump(Duration(milliseconds: 512));
      await tester.tap(find.byKey(ValueKey('session_type_toggle')));
      await tester.pump();

      expect(find.byType(ChantingSettingsView), findsOneWidget);
    });
    
  });
}
