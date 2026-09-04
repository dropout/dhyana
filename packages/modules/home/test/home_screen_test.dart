import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:profile/profile.dart';
import 'package:provider/provider.dart';

import 'package:core/core.dart';
import 'package:chanting/chanting.dart';
import 'package:timer/timer.dart';

import 'package:home/src/public/view/home_screen.dart';
import 'package:home/src/public/view/home_screen_appbar.dart';
import 'package:home/src/public/view/home_screen_bottom_menu.dart';
import 'package:home/src/public/view/session_type_toggle.dart';
import 'package:home/src/public/viewmodel/home_screen_cubit.dart';

import 'home_mock_definitions.dart';
import 'home_test_helper.dart';


void main() {
  group('HomeScreen', () {
    late MockAuthStateCubit mockAuthBloc;
    late MockProfileCubit mockProfileCubit;
    late MockTimerSettingsCubit mockTimerSettingsCubit;
    late MockChantingSettingsCubit mockChantingSettingsCubit;
    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockOverlayService mockOverlayService;
    late MockHapticsService mockHapticsService;

    // doesn't make sense to mock this because the FragmentShader
    // cannot be mocked neither, so you need to load the shader anyhow
    late ShaderService shaderService = MockShaderService();

    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final storage = MockHydratedStorage();
      when(() => storage.write(any(), any())).thenAnswer((_) async {});
      when(() => storage.read(any())).thenReturn(null);
      HydratedBloc.storage = storage;
    });

    setUp(() async {
      mockAuthBloc = MockAuthStateCubit();
      mockProfileCubit = MockProfileCubit();
      mockTimerSettingsCubit = MockTimerSettingsCubit();
      mockServices = MockServices();
      mockCrashlyticsService = MockCrashlyticsService();
      mockOverlayService = MockOverlayService();
      mockHapticsService = MockHapticsService();
      mockChantingSettingsCubit = MockChantingSettingsCubit();

      when(() => mockAuthBloc.state).thenReturn(const AuthState.signedOut());
      when(() => mockProfileCubit.state).thenReturn(ProfileState.initial());
      when(
        () => mockServices.crashlyticsService,
      ).thenReturn(mockCrashlyticsService);

      when(() => mockServices.shaderService).thenReturn(shaderService);
      when(() => mockServices.overlayService).thenReturn(mockOverlayService);
      when(() => mockServices.hapticsService).thenReturn(mockHapticsService);

      GetIt.I.registerFactory<HomeScreenCubit>(
        () => HomeScreenCubit(crashlyticsService: mockCrashlyticsService),
      );

      GetIt.I.registerFactory<TimerSettingsCubit>(
        () => mockTimerSettingsCubit,
      );

      GetIt.I.registerFactory<ChantingSettingsCubit>(
        () => mockChantingSettingsCubit,
      );
    });

    tearDown(() {
      shaderService.close();
      GetIt.I.reset();
    });

    testWidgets('can display timer settings when signed out', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(AuthState.signedOut());
      when(() => mockTimerSettingsCubit.state).thenReturn(TimerSettingsState(timerSettings: TimerSettings()));

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: HomeTestHelper.withLocalizationProvider(
            MultiBlocProvider(
              providers: [
                BlocProvider<AuthStateCubit>(create: (context) => mockAuthBloc),
                BlocProvider<ProfileCubit>(
                  create: (context) => mockProfileCubit,
                ),
              ],
              child: ShaderRenderingScope(
                enabled: false , 
                child: const HomeScreen()
              )
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
        AuthState.signedIn(userId: 'userid'),
      );
      when(() => mockTimerSettingsCubit.state).thenReturn(TimerSettingsState(timerSettings: TimerSettings()));

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: HomeTestHelper.withLocalizationProvider(
            MultiBlocProvider(
              providers: [
                BlocProvider<AuthStateCubit>(create: (context) => mockAuthBloc),
                BlocProvider<ProfileCubit>(
                  create: (context) => mockProfileCubit,
                ),
              ],
              child: ShaderRenderingScope(
                enabled: false,
                child: const HomeScreen()
              ),
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
        AuthState.signedIn(userId: 'userid'),
      );
      when(() => mockTimerSettingsCubit.state).thenReturn(TimerSettingsState(timerSettings: TimerSettings()));
      when(() => mockChantingSettingsCubit.state).thenReturn(
        ChantingSettingsState(
          availableChants: [],
          isLoading: false,
          playlist: [],
        )
      );

      when(() => mockChantingSettingsCubit.loadAvailableChants()).thenAnswer((_) async {});

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: HomeTestHelper.withLocalizationProvider(
            MultiBlocProvider(
              providers: [
                BlocProvider<AuthStateCubit>(create: (context) => mockAuthBloc),
                BlocProvider<ProfileCubit>(
                  create: (context) => mockProfileCubit,
                ),
              ],
              child: ShaderRenderingScope(
                enabled: false,
                child: const HomeScreen(),
              ),
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
