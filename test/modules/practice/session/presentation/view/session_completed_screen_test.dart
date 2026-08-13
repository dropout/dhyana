import 'package:dhyana/modules/practice/session/data/mapper/session_mapper.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';
import 'package:dhyana/core/presentation/viewmodel/auth_cubit.dart';
import 'package:dhyana/core/presentation/viewmodel/profile_cubit.dart';
import 'package:dhyana/core/util/services.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/practice/session/presentation/view/session_completed_screen.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/signed_in_completed_view.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/signed_out_completed_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../../test_context_providers.dart';
import '../../../../../mock_definitions.dart';

void main() {
  group('SessionCompletedScreen', () {
    late MockProfileCubit profileCubit;
    late MockAuthCubit mockAuthBloc;

    late MockServices mockServices;

    late MockCrashlyticsService mockCrashlyticsService;
    late MockHapticsService mockHapticsService;

    setUp(() async {
      profileCubit = MockProfileCubit();
      mockAuthBloc = MockAuthCubit();

      mockServices = MockServices();

      mockCrashlyticsService = MockCrashlyticsService();
      mockHapticsService = MockHapticsService();

      when(
        () => profileCubit.stream,
      ).thenAnswer((_) => const Stream<ProfileState>.empty());

      when(() => profileCubit.state).thenReturn(const ProfileState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

      // when(
      //   () => mockServices.idGeneratorService,
      // ).thenReturn(mockIdGeneratorService);
      when(
        () => mockServices.crashlyticsService,
      ).thenReturn(mockCrashlyticsService);
      when(() => mockServices.hapticsService).thenReturn(mockHapticsService);

    });

    testWidgets('can display session completed view when signed out', (
      WidgetTester tester,
    ) async {
      SessionEntity session = FakeModelFactory().createSessionEntity();

      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    BlocProvider<AuthCubit>.value(value: mockAuthBloc),
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
      final profile = FakeModelFactory().createProfile();
      final session = FakeModelFactory().createSessionEntity();

      when(
        () => mockAuthBloc.state,
      ).thenReturn(AuthState.signedIn(userId: FakeModelFactory().createUserEntity().uid));

      when(() => profileCubit.state).thenReturn(ProfileState.loaded(
        profile: profile,
      ));
    
      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    BlocProvider<AuthCubit>.value(value: mockAuthBloc),
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
      final profile = FakeModelFactory().createProfile();
      final session = FakeModelFactory().createSessionEntity();

      when(
        () => mockAuthBloc.state,
      ).thenReturn(AuthState.signedIn(userId: FakeModelFactory().createUserEntity().uid));

      when(() => profileCubit.state).thenReturn(ProfileState.loaded(
        profile: profile,
      ));

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    BlocProvider<AuthCubit>.value(value: mockAuthBloc),
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
      bool didPop = false;
      SessionEntity session = FakeModelFactory().createSessionEntity();

      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

      final GoRouter goRouter = GoRouter(
        routes: [
          GoRoute(path: '/', builder: (context, state) => SizedBox.shrink()),
          GoRoute(
            path: '/test',
            name: 'test',
            onExit: (context, state) {
              didPop = true;
              return true;
            },
            builder: (context, state) {
              return withAllContextProviders(
                MultiProvider(
                  providers: [
                    BlocProvider<AuthCubit>.value(value: mockAuthBloc),
                    BlocProvider<ProfileCubit>.value(value: profileCubit),
                    Provider<Services>.value(value: mockServices),
                  ],
                  child: SessionCompletedScreen(session: session.toApi()),
                ),
              );
            },
          ),
        ],
      );

      await tester.pumpWidget(MaterialApp.router(routerConfig: goRouter));

      goRouter.pushNamed('test');
      await tester.pumpAndSettle();

      await tester.tap(
        find.byKey(const Key('session_completed_screen_okay_button')),
      );
      await tester.pumpAndSettle();

      expect(didPop, true);
      expect(goRouter.state.path, '/');
    });
  }); // eof group
} // eof main
