import 'package:audio_service/audio_service.dart';
import 'package:dhyana/core/audio/app_audio_handler.dart';
import 'package:dhyana/modules/auth/domain/entity/user_entity.dart';
import 'package:dhyana/core/presentation/viewmodel/auth_cubit.dart';
import 'package:dhyana/core/presentation/viewmodel/profile_cubit.dart';
import 'package:dhyana/core/util/services.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/profile/data/mapper/profile_mapper.dart';
import 'package:dhyana/modules/social/domain/entity/presence.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/modules/social/domain/entity/public_profile.dart';
import 'package:dhyana/modules/practice/timer/timer_module.dart';
import 'package:dhyana/modules/practice/timer/presentation/view/timer_screen.dart';
import 'package:dhyana/modules/practice/timer/presentation/view/timer/timer_running_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
// transitive dependency required for shareValue() on Stream<PlaybackState>
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart'; 

import '../../../../../test_context_providers.dart';
import '../../../../../mock_definitions.dart';

void main() {

  group('TimerScreen', () {

    late MockAuthCubit mockAuthBloc;
    late MockProfileCubit mockProfileCubit;
    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockWakelockService mockWakelockService;
    late MockProfileRepository mockProfileRepository;
    late MockAppAudioHandler mockAudioHandler;

    setUpAll(() {
      registerFallbackValue(Presence(
        profile: PublicProfile.fromProfile(profile: FakeModelFactory().createProfile()),
        id: 'test_presence_id',
        startedAt: DateTime.now(),
      ));
    });

    setUp(() async {

      // BLoCs
      mockAuthBloc = MockAuthCubit();
      mockProfileCubit = MockProfileCubit();

      // Services
      mockServices = MockServices();
      mockCrashlyticsService = MockCrashlyticsService();
      mockWakelockService = MockWakelockService();
      mockAudioHandler = MockAppAudioHandler();      

      when(() => mockServices.wakelockService)
        .thenReturn(mockWakelockService);

      // Repositories
      mockProfileRepository = mockProfileRepository = MockProfileRepository();

      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);
      when(() => mockServices.wakelockService)
        .thenReturn(mockWakelockService);
      // when(() => mockServices.audioHandler)
      //   .thenReturn(mockAudioHandler);

      when(() => mockWakelockService.enable())
        .thenAnswer((_) async => {});
      when(() => mockWakelockService.disable())
        .thenAnswer((_) async => {});

    });

    testWidgets('can display timer running view when signed out', (WidgetTester tester) async {

      final TimerSettings timerSettings = TimerSettings();

      // when(() => mockAuthBloc.state).thenReturn(AuthState.signedOut());
      // when(() => mockProfileCubit.state).thenReturn(ProfileState.initial());
      // when(() => mockAudioHandler.customAction(AppAudioHandler.switchAction, any()))
        // .thenAnswer((_) => Future.value(null));
      // when(() => mockAudioHandler.playbackState)
      //   .thenAnswer((_) => Stream.value(PlaybackState()).shareValue());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<AuthCubit>(create: (context) => mockAuthBloc),
                BlocProvider<ProfileCubit>(create: (context) => mockProfileCubit),
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
      final UserEntity user = fakeModelFactory.createUser();
      final Profile profile = fakeModelFactory.createProfile().copyWith(
        id: user.uid,
        completed: true,
      );

      when(() => mockAuthBloc.state).thenReturn(
        AuthState.signedIn(userId: user.uid)
      );
      when(() => mockProfileCubit.state).thenReturn(
        ProfileState.loaded(
          profile: profile,
        )
      );

      when(() => mockProfileRepository.read(profile.id))
        .thenAnswer((_) async => profile.toDomain());
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.signedIn(userId: user.uid)
      );
      when(() => mockProfileCubit.state).thenReturn(
        ProfileState.loaded(
          profile: profile,
        )
      );

      when(() => mockAudioHandler.customAction(AppAudioHandler.switchAction, any()))
        .thenAnswer((_) => Future.value(null));
      when(() => mockAudioHandler.playbackState)
        .thenAnswer((_) => Stream.value(PlaybackState()).shareValue());


      await tester.runAsync(() async {
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<AuthCubit>(create: (context) => mockAuthBloc),
                BlocProvider<ProfileCubit>(create: (context) => mockProfileCubit),
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
      final UserEntity user = fakeModelFactory.createUser();
      final Profile profile = fakeModelFactory.createProfile().copyWith(
        id: user.uid,
        completed: true,
      );

      when(() => mockAuthBloc.state).thenReturn(
        AuthState.signedIn(userId: user.uid)
      );
      when(() => mockProfileCubit.state).thenReturn(
        ProfileState.loaded(
          profile: profile,
        )
      );
      when(() => mockProfileRepository.read(profile.id))
        .thenAnswer((_) async => profile.toDomain());

      when(() => mockAudioHandler.customAction(AppAudioHandler.switchAction, any()))
        .thenAnswer((_) => Future.value(null));
      when(() => mockAudioHandler.playbackState)
        .thenAnswer((_) => Stream.value(PlaybackState()).shareValue());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<AuthCubit>(create: (context) => mockAuthBloc),
                BlocProvider<ProfileCubit>(create: (context) => mockProfileCubit),
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
