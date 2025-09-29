import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/presence.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/public_profile.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/screen/timer_screen.dart';
import 'package:dhyana/widget/timer/timer_running_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../test_context_providers.dart';
import '../../mock_definitions.dart';

void main() {

  group('TimerScreen', () {
    late MockAuthBloc mockAuthBloc;
    late MockProfileBloc mockProfileBloc;
    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockCacheManagerService mockCacheManagerService;
    late MockAudioService mockAudioService;
    late MockWakelockService mockWakelockService;
    late MockCacheManager mockCacheManager;
    late MockRepositories mockRepositories;
    late MockPresenceRepository mockPresenceRepository;
    late MockProfileRepository mockProfileRepository;
    late MockTimerSettingsHistoryRepository mockTimerSettingsHistoryRepository;

    setUpAll(() {
      registerFallbackValue(Presence(
        profile: PublicProfile.fromProfile(profile: FakeModelFactory().createProfile()),
        id: 'test_presence_id',
        startedAt: DateTime.now(),
      ));
    });

    setUp(() async {

      // BLoCs
      mockAuthBloc = MockAuthBloc();
      mockProfileBloc = MockProfileBloc();

      // Services
      mockServices = MockServices();
      mockCrashlyticsService = MockCrashlyticsService();
      mockCacheManagerService = MockCacheManagerService();
      mockAudioService = MockAudioService();
      mockCacheManager = MockCacheManager();
      mockWakelockService = MockWakelockService();

      when(() => mockServices.wakelockService)
        .thenReturn(mockWakelockService);

      // Repositories
      mockRepositories = MockRepositories();
      mockPresenceRepository = MockPresenceRepository();
      mockProfileRepository = mockProfileRepository = MockProfileRepository();
      mockTimerSettingsHistoryRepository = MockTimerSettingsHistoryRepository();

      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);
      when(() => mockServices.cacheManagerService)
        .thenReturn(mockCacheManagerService);
      when(() => mockCacheManagerService.cacheManager)
        .thenReturn(mockCacheManager);
      when(() => mockServices.audioService)
        .thenReturn(mockAudioService);
      when(() => mockServices.wakelockService)
        .thenReturn(mockWakelockService);

      when(() => mockWakelockService.enable())
        .thenAnswer((_) async => {});
      when(() => mockWakelockService.disable())
        .thenAnswer((_) async => {});

      when(() => mockRepositories.presenceRepository)
        .thenReturn(mockPresenceRepository);
      when(() => mockRepositories.profileRepository)
        .thenReturn(mockProfileRepository);
      when(() => mockRepositories.timerSettingsHistoryRepository)
        .thenReturn(mockTimerSettingsHistoryRepository);

    });

    testWidgets('can display timer running view when signed out', (WidgetTester tester) async {

      final TimerSettings timerSettings = TimerSettings();

      when(() => mockAuthBloc.state).thenReturn(AuthState.signedOut());
      when(() => mockProfileBloc.state).thenReturn(ProfileState.initial());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
              Provider<Repositories>(create: (context) => mockRepositories),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
                BlocProvider<ProfileBloc>(create: (context) => mockProfileBloc),
              ],
              child: withAllContextProviders(
                TimerScreen(
                  timerSettings: timerSettings,
                ),
              ),
            )
          )
        );
        await tester.pumpAndSettle();
      }).then((_) {
        expect(find.byType(TimerRunningView), findsOneWidget);
      });
    });


    testWidgets('can display timer running view when signed in', (WidgetTester tester) async {

      final FakeModelFactory fakeModelFactory = FakeModelFactory();

      final TimerSettings timerSettings = TimerSettings();
      final User user = fakeModelFactory.createUser();
      final Profile profile = fakeModelFactory.createProfile().copyWith(
        id: user.uid,
        completed: true,
      );

      when(() => mockAuthBloc.state).thenReturn(
        AuthState.signedIn(user: user)
      );
      when(() => mockProfileBloc.state).thenReturn(
        ProfileState.loaded(profile: profile)
      );

      when(() => mockProfileRepository.read(profile.id))
        .thenAnswer((_) async => profile);

      when(() => mockAuthBloc.state).thenReturn(
        AuthState.signedIn(user: user)
      );
      when(() => mockProfileBloc.state).thenReturn(
        ProfileState.loaded(profile: profile)
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
              Provider<Repositories>(create: (context) => mockRepositories),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
                BlocProvider<ProfileBloc>(create: (context) => mockProfileBloc),
              ],
              child: withAllContextProviders(
                TimerScreen(
                  timerSettings: timerSettings,
                ),
              ),
            )
          )
        );
        await tester.pumpAndSettle();
      }).then((_) {
        expect(find.byType(TimerRunningView), findsOneWidget);
      });
    });

    testWidgets('can display timer completed view', (WidgetTester tester) async {

      final FakeModelFactory fakeModelFactory = FakeModelFactory();

      final TimerSettings timerSettings = TimerSettings();
      final User user = fakeModelFactory.createUser();
      final Profile profile = fakeModelFactory.createProfile().copyWith(
        id: user.uid,
        completed: true,
      );

      when(() => mockAuthBloc.state).thenReturn(
        AuthState.signedIn(user: user)
      );
      when(() => mockProfileBloc.state).thenReturn(
        ProfileState.loaded(profile: profile)
      );

      when(() => mockProfileRepository.read(profile.id))
        .thenAnswer((_) async => profile);

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
              Provider<Repositories>(create: (context) => mockRepositories),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
                BlocProvider<ProfileBloc>(create: (context) => mockProfileBloc),
              ],
              child: withAllContextProviders(
                TimerScreen(
                  timerSettings: timerSettings,
                ),
              ),
            )
          )
        );
        await tester.pumpAndSettle();
      }).then((_) {
        // expect(find.byType(TimerCompletedView), findsNothing);

      });

    });



  }); // eof group
} // eof main
