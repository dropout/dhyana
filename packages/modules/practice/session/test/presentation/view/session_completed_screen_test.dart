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
import 'package:session/src/domain/entity/session_entity.dart';
import 'package:session/src/domain/usecase/log_session_insights_use_case.dart';
import 'package:session/src/domain/usecase/update_profile_with_session_use_case.dart';
import 'package:session/src/presentation/view/session_completed_screen.dart';
import 'package:session/src/presentation/view/completed/signed_in_completed_view.dart';
import 'package:session/src/presentation/view/completed/signed_out_completed_view.dart';
import 'package:session/src/presentation/viewmodel/session_completed/session_completed_cubit.dart';

import '../../session_mock_definitions.dart';
import '../../session_test_helper.dart';

void main() {
  group('SessionCompletedScreen', () {
    late MockProfileCubit profileCubit;
    late MockAuthStateCubit mockAuthBloc;

    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockHapticsService mockHapticsService;
    late MockHomeNavigator mockHomeNavigator;
  

    late LogSessionInsightsUseCase mockLogSessionUseCase;
    late UpdateProfileWithSessionUseCase mockUpdateProfileWithSessionUseCase;

    setUp(() async {
      profileCubit = MockProfileCubit();
      mockAuthBloc = MockAuthStateCubit();
      mockServices = MockServices();

      mockCrashlyticsService = MockCrashlyticsService();
      mockHapticsService = MockHapticsService();
      mockHomeNavigator = MockHomeNavigator();

      mockLogSessionUseCase = MockLogSessionUseCase();
      mockUpdateProfileWithSessionUseCase =
          MockUpdateProfileWithSessionUseCase();

      when(() => profileCubit.stream)
          .thenAnswer((_) => const Stream<ProfileState>.empty());

      when(() => profileCubit.state).thenReturn(const ProfileState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

      when(() => mockServices.crashlyticsService)
          .thenReturn(mockCrashlyticsService);

      when(() => profileCubit.stream)
          .thenAnswer((_) => const Stream<ProfileState>.empty());

      when(() => profileCubit.state).thenReturn(const ProfileState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

      when(() => mockServices.crashlyticsService)
          .thenReturn(mockCrashlyticsService);
      when(() => mockServices.hapticsService).thenReturn(mockHapticsService);
      when(() => mockServices.homeNavigator).thenReturn(mockHomeNavigator);

      GetIt.I.registerFactory<SessionCompletedCubit>(() {
        return SessionCompletedCubit(
          logSessionUseCase: mockLogSessionUseCase,
          updateProfileWithSessionUseCase: mockUpdateProfileWithSessionUseCase,
          crashlyticsService: mockCrashlyticsService,
        );
      });
    });

    tearDown(() {
      GetIt.I.reset();
    });

    testWidgets('can display session completed view when signed out', (
      WidgetTester tester,
    ) async {
      SessionEntity session = Faker().createSessionEntity();

      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

      await tester
          .runAsync(() async {
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
            await tester.pumpAndSettle();
          })
          .then((_) async {
            expect(find.byType(SignedOutCompletedView), findsOneWidget);
          });
    });

    testWidgets('can display session completed view when signed in', (
      WidgetTester tester,
    ) async {
      final profile = Faker().createProfile();
      final session = Faker().createSessionEntity();

      when(() => mockAuthBloc.state)
          .thenReturn(AuthState.signedIn(userId: Faker().guid.guid()));

      when(() => profileCubit.state)
          .thenReturn(ProfileState.loaded(profile: profile));

      await tester
          .runAsync(() async {
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
            await tester.pumpAndSettle(const Duration(milliseconds: 500));
          })
          .then((_) async {
            expect(find.byType(SignedInCompletedView), findsOneWidget);
          });
    });

    testWidgets('can display okay button', (WidgetTester tester) async {
      final profile = Faker().createProfile();
      final session = Faker().createSessionEntity();

      when(() => mockAuthBloc.state)
          .thenReturn(AuthState.signedIn(userId: Faker().guid.guid()));

      when(() => profileCubit.state)
          .thenReturn(ProfileState.loaded(profile: profile));

      await tester
          .runAsync(() async {
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
            await tester.pumpAndSettle();
          })
          .then((_) async {
            expect(
              find.byKey(const Key('session_completed_screen_okay_button')),
              findsOneWidget,
            );
          });
    });

    testWidgets('can go to home screen when okay button tapped', (
      WidgetTester tester,
    ) async {
      SessionEntity session = Faker().createSessionEntity();

      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());      
      when(() => mockHomeNavigator.navigateToHome()).thenAnswer((_) async {});

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

      await tester.pumpAndSettle();

      await tester.tap(
        find.byKey(const Key('session_completed_screen_okay_button')),
      );
      await tester.pumpAndSettle();

      verify(() => mockHomeNavigator.navigateToHome()).called(1);

      // expect(didPop, true);
      // expect(goRouter.state.path, '/');
    });
  }); // eof group
} // eof main
