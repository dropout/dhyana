import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/bloc/session_completed/session_completed_cubit.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/update_profile_stats_result.dart';
import 'package:dhyana/widget/presence/presence_area.dart';
import 'package:dhyana/widget/session/all.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../mock_definitions.dart';
import '../../../test_context_providers.dart';

void main() {

  late MockProfileCubit mockProfileCubit;
  late MockSessionCompletedCubit mockSessionCompletedCubit;

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;
  late MockCacheManagerService mockCacheManagerService;

  late MockRepositories mockRepositories;
  late MockProfileRepository mockProfileRepository;
  late MockPresenceRepository mockPresenceRepository;

  setUpAll(() async {

    mockProfileCubit = MockProfileCubit();
    mockSessionCompletedCubit = MockSessionCompletedCubit();

    mockServices = MockServices();
    mockCrashlyticsService = MockCrashlyticsService();
    mockCacheManagerService = MockCacheManagerService();

    when(() => mockServices.crashlyticsService)
      .thenReturn(mockCrashlyticsService);

    when(() => mockServices.cacheManagerService)
      .thenReturn(mockCacheManagerService);
    when(() => mockCacheManagerService.cacheManager)
      .thenReturn(MockCacheManager());

    mockRepositories = MockRepositories();
    mockProfileRepository = MockProfileRepository();
    mockPresenceRepository = MockPresenceRepository();

    when(() => mockRepositories.profileRepository)
      .thenReturn(mockProfileRepository);
    when(() => mockRepositories.presenceRepository)
      .thenReturn(mockPresenceRepository);

  });

  group('SignedInCompletedView', () {

    testWidgets('can log session on initialization', (WidgetTester tester) async {

      final profileId = 'profileId';
      final session = FakeModelFactory().createSession();
      final UpdateProfileStatsResult updateResult = UpdateProfileStatsResult(
        updatedProfile: FakeModelFactory().createProfile(),
        oldProfile: FakeModelFactory().createProfile(),
        session: session,
      );

      when(() =>mockSessionCompletedCubit.state)
        .thenReturn(const SessionCompletedInitialState());
      when(() => mockSessionCompletedCubit.stream)
        .thenAnswer((_) => const Stream<SessionCompletedState>.empty());

      when(() => mockSessionCompletedCubit.logSession(
        profileId,
        session,
        onComplete: any(named: 'onComplete'),
      )).thenAnswer((invocation) async {
        final onComplete = invocation.namedArguments[const Symbol('onComplete')]
          as void Function(UpdateProfileStatsResult)?;
        onComplete?.call(updateResult);
      });

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
                BlocProvider<SessionCompletedCubit>.value(value: mockSessionCompletedCubit)
              ],
              child: SignedInCompletedView(
                profileId: 'profileId',
                session: session,
              )
            ),
          )
        );
        await tester.pump();
      }).then((_) {

        verify(() => mockSessionCompletedCubit.logSession(
          'profileId',
          session,
          onComplete: any(named: 'onComplete'),
        )).called(1);

        verify(() => mockProfileCubit.loadProfile(
          'profileId',
          profile: updateResult.updatedProfile,
        )).called(1);

      });

    });


    testWidgets('can show loading when initial state', (WidgetTester tester) async {
      final Session session = FakeModelFactory().createSession();

      when(() =>mockSessionCompletedCubit.state)
        .thenReturn(const SessionCompletedState.initial());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
                BlocProvider<SessionCompletedCubit>.value(value: mockSessionCompletedCubit)
              ],
              child: SignedInCompletedView(
                profileId: 'profileId',
                session: session,
              )
            ),
          )
        );
        await tester.pump();
      }).then((_) {
        expect(find.byType(AppLoadingDisplay), findsOneWidget);
      });

    });

    testWidgets('can show loading when loading state', (WidgetTester tester) async {
      final Session session = FakeModelFactory().createSession();

      when(() =>mockSessionCompletedCubit.state)
        .thenReturn(const SessionCompletedState.loading());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
                BlocProvider<SessionCompletedCubit>.value(value: mockSessionCompletedCubit)
              ],
              child: SignedInCompletedView(
                profileId: 'profileId',
                session: session,
              )
            ),
          )
        );
        await tester.pump();
      }).then((_) {
        expect(find.byType(AppLoadingDisplay), findsOneWidget);
      });
    });

    testWidgets('can show error when error state', (WidgetTester tester) async {
      final Session session = FakeModelFactory().createSession();

      when(() =>mockSessionCompletedCubit.state)
        .thenReturn(const SessionCompletedState.error());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
                BlocProvider<SessionCompletedCubit>.value(value: mockSessionCompletedCubit)
              ],
              child: SignedInCompletedView(
                profileId: 'profileId',
                session: session,
              )
            ),
          )
        );
        await tester.pump();
      }).then((_) {
        expect(find.byType(AppErrorDisplay), findsOneWidget);
      });
    });

    testWidgets('can show loaded when saving session', (WidgetTester tester) async {
      final Session session = FakeModelFactory().createSession();
      UpdateProfileStatsResult updateResult = UpdateProfileStatsResult(
        updatedProfile: FakeModelFactory().createProfile(),
        oldProfile: FakeModelFactory().createProfile(),
        session: session,
      );

      when(() => mockSessionCompletedCubit.state)
        .thenReturn(SessionCompletedState.saving(
          updateResult: updateResult,
        ));

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                Provider<Repositories>.value(value: mockRepositories),
                BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
                BlocProvider<SessionCompletedCubit>.value(value: mockSessionCompletedCubit),
              ],
              child: SignedInCompletedView(
                profileId: 'profileId',
                session: session,
              )
            ),
          )
        );
        await tester.pumpAndSettle();
      }).then((_) {
        expect(find.byType(SessionResult), findsOneWidget);
        expect(find.byType(MilestoneProgressView), findsOneWidget);
        expect(find.byType(ProgressSummary), findsOneWidget);
        expect(find.byType(PresenceArea), findsOneWidget);
      });
    });

    testWidgets('can show loaded when saving session completed', (WidgetTester tester) async {
      final Session session = FakeModelFactory().createSession();
      UpdateProfileStatsResult updateResult = UpdateProfileStatsResult(
        updatedProfile: FakeModelFactory().createProfile(),
        oldProfile: FakeModelFactory().createProfile(),
        session: session,
      );

      when(() => mockSessionCompletedCubit.state)
        .thenReturn(SessionCompletedState.saved(
          updateResult: updateResult,
        ));

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                Provider<Repositories>.value(value: mockRepositories),
                BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
                BlocProvider<SessionCompletedCubit>.value(value: mockSessionCompletedCubit),
              ],
              child: SignedInCompletedView(
                profileId: 'profileId',
                session: session,
              )
            ),
          )
        );
        await tester.pumpAndSettle();
      }).then((_) {
        expect(find.byType(SessionResult), findsOneWidget);
        expect(find.byType(MilestoneProgressView), findsOneWidget);
        expect(find.byType(ProgressSummary), findsOneWidget);
        expect(find.byType(PresenceArea), findsOneWidget);
      });
    });

  }); // eof group
} // eof main
