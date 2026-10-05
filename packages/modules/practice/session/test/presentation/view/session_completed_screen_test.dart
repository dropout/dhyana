import 'package:faker/faker.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:profile/profile.dart';
import 'package:provider/provider.dart';

import 'package:core/core.dart';
import 'package:session/src/data/datasource/faker_session_extension.dart';
import 'package:session/src/data/mapper/session_mapper.dart';
import 'package:session/src/data/mapper/update_profile_stats_result_mapper.dart';
import 'package:session/src/domain/entity/session_entity.dart';
import 'package:session/src/domain/entity/update_profile_stats_result_entity.dart';
import 'package:session/src/presentation/view/session_completed_screen.dart';
import 'package:session/src/public/view/signed_in_completed_view.dart';
import 'package:session/src/public/view/signed_out_completed_view.dart';
import 'package:session/src/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:session/src/public/view/session_result.dart';

import '../../session_mock_definitions.dart';
import '../../session_test_helper.dart';

void main() {
  group('SessionCompletedScreen', () {
    late MockProfileCubit profileCubit;
    late MockAuthStateCubit mockAuthBloc;
    late MockSessionCompletedCubit sessionCompletedCubit;

    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockHapticsService mockHapticsService;
    late MockHomeNavigator mockHomeNavigator;
    late MockResourceResolver mockResourceResolver;

    Future<void> pumpScreen(WidgetTester tester, SessionEntity session) async {
      await tester.pumpWidget(
        SessionTestHelper.withLocalizationProvider(
          MultiProvider(
            providers: [
              BlocProvider<AuthStateCubit>.value(value: mockAuthBloc),
              BlocProvider<ProfileCubit>.value(value: profileCubit),
              Provider<Services>.value(value: mockServices),
            ],
            child: SessionCompletedScreen(session: session.toApi()),
          ),
        ),
      );
      await tester.pump();
    }

    setUpAll(() {
      registerFallbackValue(Faker().createSessionEntity().toApi());
    });

    setUp(() async {
      profileCubit = MockProfileCubit();
      mockAuthBloc = MockAuthStateCubit();
      sessionCompletedCubit = MockSessionCompletedCubit();
      mockServices = MockServices();

      mockCrashlyticsService = MockCrashlyticsService();
      mockHapticsService = MockHapticsService();
      mockHomeNavigator = MockHomeNavigator();
      mockResourceResolver = MockResourceResolver();

      when(() => profileCubit.stream)
          .thenAnswer((_) => const Stream<ProfileState>.empty());

      when(() => profileCubit.state).thenReturn(const ProfileState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => sessionCompletedCubit.stream)
          .thenAnswer((_) => const Stream<SessionCompletedState>.empty());
      when(() => sessionCompletedCubit.state)
          .thenReturn(const SessionCompletedState.initial());
      when(
        () => sessionCompletedCubit.logSession(
          any(),
          any(),
          onComplete: any(named: 'onComplete'),
        ),
      ).thenAnswer((_) async {});

      when(() => mockServices.crashlyticsService)
          .thenReturn(mockCrashlyticsService);
      when(() => mockServices.hapticsService).thenReturn(mockHapticsService);
      when(() => mockServices.homeNavigator).thenReturn(mockHomeNavigator);
      when(() => mockServices.resourceResolver)
          .thenReturn(mockResourceResolver);
      when(() => mockResourceResolver.resolveStoragePath(any()))
          .thenAnswer((_) async => 'https://example.com/profile.jpg');

      GetIt.I.registerFactory<SessionCompletedCubit>(
        () => sessionCompletedCubit,
      );
    });

    tearDown(() {
      GetIt.I.reset();
    });

    testWidgets('can display session completed view when signed out', (
      WidgetTester tester,
    ) async {
      SessionEntity session = Faker().createSessionEntity();

      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

      await pumpScreen(tester, session);

      expect(find.byType(SignedOutCompletedView), findsOneWidget);
    });

    testWidgets('can display session completed view when signed in', (
      WidgetTester tester,
    ) async {
      final profile = Faker().createProfile().copyWith(
        settings: const ProfileSettings(
          showStats: false,
          usePresenceFeature: false,
        ),
      );
      final session = Faker().createSessionEntity();
      final result = UpdateProfileStatsResultEntity(
        oldProfile: profile,
        updatedProfile: profile,
        session: session,
      );

      when(() => mockAuthBloc.state)
          .thenReturn(AuthState.signedIn(userId: Faker().guid.guid()));

      when(() => profileCubit.state)
          .thenReturn(ProfileState.loaded(profile: profile));
      when(
        () => sessionCompletedCubit.state,
      ).thenReturn(SessionCompletedState.saved(updateResult: result.toApi()));

      await pumpScreen(tester, session);

      expect(find.byType(SignedInCompletedView), findsOneWidget);
      expect(find.byType(SessionResult), findsOneWidget);
      verify(
        () => sessionCompletedCubit.logSession(
          profile.id,
          session.toApi(),
          onComplete: any(named: 'onComplete'),
        ),
      ).called(1);
    });

    testWidgets('shows loading while the profile is loading', (
      WidgetTester tester,
    ) async {
      when(() => mockAuthBloc.state)
          .thenReturn(AuthState.signedIn(userId: Faker().guid.guid()));
      when(() => profileCubit.state).thenReturn(const ProfileState.loading());

      await pumpScreen(tester, Faker().createSessionEntity());

      expect(find.byType(AppLoadingDisplay), findsOneWidget);
    });

    testWidgets('shows an error when the profile fails to load', (
      WidgetTester tester,
    ) async {
      when(() => mockAuthBloc.state)
          .thenReturn(AuthState.signedIn(userId: Faker().guid.guid()));
      when(() => profileCubit.state).thenReturn(const ProfileState.error());

      await pumpScreen(tester, Faker().createSessionEntity());

      expect(find.byType(AppErrorDisplay), findsOneWidget);
    });

    testWidgets('can display okay button', (WidgetTester tester) async {
      final profile = Faker().createProfile().copyWith(
        settings: const ProfileSettings(
          showStats: false,
          usePresenceFeature: false,
        ),
      );
      final session = Faker().createSessionEntity();

      when(() => mockAuthBloc.state)
          .thenReturn(AuthState.signedIn(userId: Faker().guid.guid()));

      when(() => profileCubit.state)
          .thenReturn(ProfileState.loaded(profile: profile));

      await pumpScreen(tester, session);

      expect(
        find.byKey(const Key('session_completed_screen_okay_button')),
        findsOneWidget,
      );
    });

    testWidgets('can go to home screen when okay button tapped', (
      WidgetTester tester,
    ) async {
      SessionEntity session = Faker().createSessionEntity();

      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockHomeNavigator.navigateToHome()).thenAnswer((_) async {});

      await pumpScreen(tester, session);

      await tester.tap(
        find.byKey(const Key('session_completed_screen_okay_button')),
      );
      await tester.pump();

      verify(() => mockHomeNavigator.navigateToHome()).called(1);

      // expect(didPop, true);
      // expect(goRouter.state.path, '/');
    });
  });

  group('SessionCompletedScreen SessionCompletedCubit states', () {
    late MockProfileCubit profileCubit;
    late MockAuthStateCubit mockAuthBloc;
    late MockSessionCompletedCubit sessionCompletedCubit;
    late MockServices mockServices;
    late MockResourceResolver mockResourceResolver;

    setUp(() {
      profileCubit = MockProfileCubit();
      mockAuthBloc = MockAuthStateCubit();
      sessionCompletedCubit = MockSessionCompletedCubit();
      mockServices = MockServices();
      mockResourceResolver = MockResourceResolver();

      when(() => profileCubit.stream)
          .thenAnswer((_) => const Stream<ProfileState>.empty());
      when(() => profileCubit.state).thenReturn(const ProfileState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => sessionCompletedCubit.stream)
          .thenAnswer((_) => const Stream<SessionCompletedState>.empty());
      when(() => sessionCompletedCubit.state)
          .thenReturn(const SessionCompletedState.initial());
      when(
        () => sessionCompletedCubit.logSession(
          any(),
          any(),
          onComplete: any(named: 'onComplete'),
        ),
      ).thenAnswer((_) async {});
      when(() => mockServices.resourceResolver)
          .thenReturn(mockResourceResolver);
      when(() => mockResourceResolver.resolveStoragePath(any()))
          .thenAnswer((_) async => 'https://example.com/profile.jpg');

      GetIt.I.registerFactory<SessionCompletedCubit>(
        () => sessionCompletedCubit,
      );
    });

    tearDown(() {
      GetIt.I.reset();
    });

    Future<void> pumpSignedInScreen(
      WidgetTester tester,
      SessionEntity session,
    ) async {
      await tester.pumpWidget(
        SessionTestHelper.withLocalizationProvider(
          MultiProvider(
            providers: [
              BlocProvider<AuthStateCubit>.value(value: mockAuthBloc),
              BlocProvider<ProfileCubit>.value(value: profileCubit),
              Provider<Services>.value(value: mockServices),
            ],
            child: SessionCompletedScreen(session: session.toApi()),
          ),
        ),
      );
      await tester.pump();
    }

    UpdateProfileStatsResultEntity prepareSignedInState(SessionEntity session) {
      final profile = Faker().createProfile().copyWith(
        settings: const ProfileSettings(
          showStats: false,
          usePresenceFeature: false,
        ),
      );
      final result = UpdateProfileStatsResultEntity(
        oldProfile: profile,
        updatedProfile: profile,
        session: session,
      );

      when(() => mockAuthBloc.state)
          .thenReturn(AuthState.signedIn(userId: Faker().guid.guid()));
      when(() => profileCubit.state)
          .thenReturn(ProfileState.loaded(profile: profile));
      return result;
    }

    testWidgets('shows loading while the completion state is initial', (
      WidgetTester tester,
    ) async {
      final session = Faker().createSessionEntity();
      prepareSignedInState(session);

      await pumpSignedInScreen(tester, session);

      expect(find.byType(AppLoadingDisplay), findsOneWidget);
    });

    testWidgets('shows loading while the completion state is loading', (
      WidgetTester tester,
    ) async {
      final session = Faker().createSessionEntity();
      prepareSignedInState(session);
      when(() => sessionCompletedCubit.state)
          .thenReturn(const SessionCompletedState.loading());

      await pumpSignedInScreen(tester, session);

      expect(find.byType(AppLoadingDisplay), findsOneWidget);
    });

    testWidgets('shows an error when completion fails', (
      WidgetTester tester,
    ) async {
      final session = Faker().createSessionEntity();
      prepareSignedInState(session);
      when(() => sessionCompletedCubit.state)
          .thenReturn(const SessionCompletedState.error());

      await pumpSignedInScreen(tester, session);

      expect(find.byType(AppErrorDisplay), findsOneWidget);
    });

    testWidgets('shows the session result while stats are saving', (
      WidgetTester tester,
    ) async {
      final session = Faker().createSessionEntity();
      final result = prepareSignedInState(session);
      when(
        () => sessionCompletedCubit.state,
      ).thenReturn(SessionCompletedState.saving(updateResult: result.toApi()));

      await pumpSignedInScreen(tester, session);

      expect(find.byType(SignedInCompletedView), findsOneWidget);
      expect(find.byType(SessionResult), findsOneWidget);
    });

    testWidgets('shows the session result after stats are saved', (
      WidgetTester tester,
    ) async {
      final session = Faker().createSessionEntity();
      final result = prepareSignedInState(session);
      when(
        () => sessionCompletedCubit.state,
      ).thenReturn(SessionCompletedState.saved(updateResult: result.toApi()));

      await pumpSignedInScreen(tester, session);

      expect(find.byType(SignedInCompletedView), findsOneWidget);
      expect(find.byType(SessionResult), findsOneWidget);
    });
  });
} // eof main
