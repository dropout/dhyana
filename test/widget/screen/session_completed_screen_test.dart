import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:dhyana/widget/session/completed/signed_in_completed_view.dart';
import 'package:dhyana/widget/session/completed/signed_out_completed_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../test_context_providers.dart';
import '../../mock_definitions.dart';

void main() {

  group('SessionCompletedScreen', () {

    late MockProfileBloc mockProfileBloc;
    late MockAuthBloc mockAuthBloc;

    late MockServices mockServices;
    late MockRepositories mockRepositories;

    late MockProfileRepository mockProfileRepository;
    late MockStatisticsRepository mockStatisticsRepository;
    late MockIdGeneratorService mockIdGeneratorService;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockCacheManagerService mockCacheManagerService;
    late MockHapticsService mockHapticsService;

    setUp(() async {
      mockProfileBloc = MockProfileBloc();
      mockAuthBloc = MockAuthBloc();

      mockServices = MockServices();
      mockRepositories = MockRepositories();

      mockIdGeneratorService = MockIdGeneratorService();
      mockCrashlyticsService = MockCrashlyticsService();
      mockProfileRepository = MockProfileRepository();
      mockStatisticsRepository = MockStatisticsRepository();
      mockCacheManagerService = MockCacheManagerService();
      mockHapticsService = MockHapticsService();

      when(() => mockProfileBloc.stream)
        .thenAnswer((_) => const Stream<ProfileState>.empty());

      when(() => mockProfileBloc.state)
        .thenReturn(const ProfileState.initial());
      when(() => mockAuthBloc.state)
        .thenReturn(const AuthState.initial());

      when(() => mockServices.cacheManagerService)
        .thenReturn(mockCacheManagerService);
      when(() => mockCacheManagerService.cacheManager)
        .thenReturn(MockCacheManager());

      when(() => mockServices.idGeneratorService)
        .thenReturn(mockIdGeneratorService);
      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);
      when(() => mockServices.hapticsService)
        .thenReturn(mockHapticsService);

      when(() => mockRepositories.profileRepository)
        .thenReturn(mockProfileRepository);
      when(() => mockRepositories.statisticsRepository)
        .thenReturn(mockStatisticsRepository);

    });

    testWidgets('can display session completed view when signed out', (WidgetTester tester) async {

      Session session = FakeModelFactory().createSession();

      when(() => mockAuthBloc.state)
        .thenReturn(const AuthState.initial());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                BlocProvider<AuthBloc>.value(
                  value: mockAuthBloc,
                ),
                BlocProvider<ProfileBloc>.value(
                  value: mockProfileBloc,
                ),
                Provider<Repositories>.value(
                  value: mockRepositories,
                ),
                Provider<Services>.value(
                  value: mockServices,
                ),
              ],
              child: SessionCompletedScreen(
                session: session,
              ),
            )
          )
        );
        await tester.pumpAndSettle();
      }).then((_) async{
        expect(find.byType(SignedOutCompletedView), findsOneWidget);
      });

    });

    testWidgets('can display session completed view when signed in', (WidgetTester tester) async {

      Session session = FakeModelFactory().createSession();

      when(() => mockAuthBloc.state)
        .thenReturn(AuthState.signedIn(
        user: FakeModelFactory().createUser()
      ));

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                BlocProvider<AuthBloc>.value(
                  value: mockAuthBloc,
                ),
                BlocProvider<ProfileBloc>.value(
                  value: mockProfileBloc,
                ),
                Provider<Repositories>.value(
                  value: mockRepositories,
                ),
                Provider<Services>.value(
                  value: mockServices,
                ),
              ],
              child: SessionCompletedScreen(
                session: session,
              ),
            )
          )
        );
        await tester.pumpAndSettle();
      }).then((_) async{
        expect(find.byType(SignedInCompletedView), findsOneWidget);
      });

    });

    testWidgets('can display okay button', (WidgetTester tester) async {

      Session session = FakeModelFactory().createSession();

      when(() => mockAuthBloc.state)
        .thenReturn(AuthState.signedIn(
        user: FakeModelFactory().createUser()
      ));

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                BlocProvider<AuthBloc>.value(
                  value: mockAuthBloc,
                ),
                BlocProvider<ProfileBloc>.value(
                  value: mockProfileBloc,
                ),
                Provider<Repositories>.value(
                  value: mockRepositories,
                ),
                Provider<Services>.value(
                  value: mockServices,
                ),
              ],
              child: SessionCompletedScreen(
                session: session,
              ),
            )
          )
        );
        await tester.pumpAndSettle();
      }).then((_) async {
        expect(
          find.byKey(const Key('session_completed_screen_okay_button')),
          findsOneWidget
        );

      });


    });

    testWidgets('can go to home screen when okay button tapped', (WidgetTester tester) async {

      bool didPop = false;
      Session session = FakeModelFactory().createSession();

      when(() => mockAuthBloc.state)
        .thenReturn(const AuthState.initial());

      final GoRouter goRouter = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => SizedBox.shrink(),
          ),
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
                    BlocProvider<AuthBloc>.value(
                      value: mockAuthBloc,
                    ),
                    BlocProvider<ProfileBloc>.value(
                      value: mockProfileBloc,
                    ),
                    Provider<Repositories>.value(
                      value: mockRepositories,
                    ),
                    Provider<Services>.value(
                      value: mockServices,
                    ),
                  ],
                  child: SessionCompletedScreen(
                    session: session,
                  ),
                )
              );
            },
          )
        ]
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: goRouter,
        ),
      );

      goRouter.pushNamed('test');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('session_completed_screen_okay_button')));
      await tester.pumpAndSettle();

      expect(didPop, true);
      expect(goRouter.state.path, '/');

    });


  }); // eof group
} // eof main
