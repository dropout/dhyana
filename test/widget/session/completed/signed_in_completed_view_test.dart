import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/bloc/session_completed/session_completed_bloc.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/update_profile_stats_result.dart';
import 'package:dhyana/widget/presence/presence_area.dart';
import 'package:dhyana/widget/profile/profile_avatar.dart';
import 'package:dhyana/widget/session/all.dart';
import 'package:dhyana/widget/session/completed/session_result.dart';
import 'package:dhyana/widget/session/completed/signed_in_completed_view.dart';
import 'package:dhyana/widget/session/completed/signed_out_completed_view.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../mock_definitions.dart';
import '../../../test_context_providers.dart';

void main() {

  late MockProfileBloc mockProfileBloc;
  late MockSessionCompletedBloc mockSessionCompletedBloc;
  late MockPresenceBloc mockPresenceBloc;

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;
  late MockCacheManagerService mockCacheManagerService;

  late MockRepositories mockRepositories;
  late MockProfileRepository mockProfileRepository;
  late MockPresenceRepository mockPresenceRepository;

  setUpAll(() async {

    mockProfileBloc = MockProfileBloc();
    mockSessionCompletedBloc = MockSessionCompletedBloc();

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



    registerFallbackValue(LogSessionEvent(
      profileId: 'profileId',
      session: FakeModelFactory().createSession(),
    ));

    registerFallbackValue(LoadProfile(
      profileId: 'profileId'
    ));
  });

  group('SignedInCompletedView', () {

    testWidgets('can log session on initialization', (WidgetTester tester) async {

      final Session session = FakeModelFactory().createSession();

      when(() =>mockSessionCompletedBloc.state)
        .thenReturn(const SessionCompletedInitialState());
      when(() => mockSessionCompletedBloc.stream)
        .thenAnswer((_) => const Stream<SessionCompletedState>.empty());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                BlocProvider<ProfileBloc>.value(value: mockProfileBloc),
                BlocProvider<SessionCompletedBloc>.value(value: mockSessionCompletedBloc)
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

        final result = verify(() => mockSessionCompletedBloc.add(
          captureAny(that: isA<LogSessionEvent>())
        ));
        LogSessionEvent logSessionEvent = result.captured.first as LogSessionEvent;

        expect(logSessionEvent.profileId, equals('profileId'));
        expect(logSessionEvent.session, equals(session));

        UpdateProfileStatsResult updateResult = UpdateProfileStatsResult(
          updatedProfile: FakeModelFactory().createProfile(),
          oldProfile: FakeModelFactory().createProfile(),
          session: session,
        );

        logSessionEvent.onComplete!(updateResult);

        LoadProfile loadProfileEvent = verify(() => mockProfileBloc.add(
          captureAny(that: isA<LoadProfile>())
        )).captured.first as LoadProfile;

        expect(loadProfileEvent.profileId, equals('profileId'));
        expect(loadProfileEvent.profile, equals(updateResult.updatedProfile));

      });

    });


    testWidgets('can show loading when initial state', (WidgetTester tester) async {
      final Session session = FakeModelFactory().createSession();

      when(() =>mockSessionCompletedBloc.state)
        .thenReturn(const SessionCompletedState.initial());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                BlocProvider<ProfileBloc>.value(value: mockProfileBloc),
                BlocProvider<SessionCompletedBloc>.value(value: mockSessionCompletedBloc)
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

      when(() =>mockSessionCompletedBloc.state)
        .thenReturn(const SessionCompletedState.loading());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                BlocProvider<ProfileBloc>.value(value: mockProfileBloc),
                BlocProvider<SessionCompletedBloc>.value(value: mockSessionCompletedBloc)
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

      when(() =>mockSessionCompletedBloc.state)
        .thenReturn(const SessionCompletedState.error());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                BlocProvider<ProfileBloc>.value(value: mockProfileBloc),
                BlocProvider<SessionCompletedBloc>.value(value: mockSessionCompletedBloc)
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

      when(() => mockSessionCompletedBloc.state)
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
                BlocProvider<ProfileBloc>.value(value: mockProfileBloc),
                BlocProvider<SessionCompletedBloc>.value(value: mockSessionCompletedBloc),
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

      when(() => mockSessionCompletedBloc.state)
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
                BlocProvider<ProfileBloc>.value(value: mockProfileBloc),
                BlocProvider<SessionCompletedBloc>.value(value: mockSessionCompletedBloc),
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
