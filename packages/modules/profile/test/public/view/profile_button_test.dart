import 'package:core/core.dart';
import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/profile_routes.dart';
import 'package:profile/src/public/view/profile_button.dart';
import 'package:profile/src/public/view/profile_image.dart';


void main() {
  late MockAuthStateCubit mockAuthBloc;
  late MockProfileStateCubit mockProfileCubit;
  late MockGoRouter mockGoRouter;

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;
  late MockHapticsService mockHapticsService;
  late ResourceResolver mockResourceResolver;

  setUpAll(() async {
    mockAuthBloc = MockAuthStateCubit();
    mockProfileCubit = MockProfileStateCubit();
    mockGoRouter = MockGoRouter();
    mockServices = MockServices();
    mockResourceResolver = MockResourceResolver();

    mockCrashlyticsService = MockCrashlyticsService();
    mockHapticsService = MockHapticsService();

    when(
      () => mockServices.crashlyticsService,
    ).thenReturn(mockCrashlyticsService);
    when(() => mockServices.hapticsService).thenReturn(mockHapticsService);

    when(() => mockServices.resourceResolver).thenReturn(mockResourceResolver);
    when(
      () => mockResourceResolver.resolveStoragePath(any()),
    ).thenAnswer((_) async => 'https://example.com/profile.jpg');

    registerFallbackValue(Faker().createProfile());
    registerFallbackValue("String");
    registerFallbackValue(Uri());
  });

  group('ProfileButton', () {
    testWidgets('will show signed out state', (WidgetTester tester) async {
      when(() => mockAuthBloc.state).thenReturn(const AuthState.signedOut());

      when(() => mockGoRouter.go(any())).thenAnswer((_) async {});

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    Provider<Services>(create: (context) => mockServices),
                    BlocProvider<AuthStateCubit>(
                      create: (context) => mockAuthBloc,
                    ),
                  ],
                  child: MockGoRouterProvider(
                    mockGoRouter: mockGoRouter,
                    child: ProfileButton(),
                  ),
                ),
              ),
            );
            await tester.pumpAndSettle();
          })
          .then((_) async {
            expect(
              find.byKey(const Key('profile_button_signed_out_icon')),
              findsOneWidget,
            );

            // ACT: Simulate the user action that triggers navigation
            final buttonFinder = find.byKey(
              const Key('profile_button_signed_out_ink_well'),
            );
            expect(buttonFinder, findsOneWidget);
            await tester.tap(buttonFinder);
            await tester.pumpAndSettle(); // Wait for navigation to complete

            // ASSERT: Verify that GoRouter.push() was called once with the expected path
            verify(() => mockGoRouter.go('/login')).called(1);
            verify(() => mockHapticsService.tap()).called(1);

            // Verify that no other navigation method was called
            verifyNever(() => mockGoRouter.go(any()));
          });
    });

    testWidgets('will show loading state when profile is loading', (
      WidgetTester tester,
    ) async {
      final userId = Faker().guid.guid();

      when(
        () => mockAuthBloc.state,
      ).thenReturn(AuthState.signedIn(userId: userId));
      when(() => mockProfileCubit.state).thenReturn(ProfileState.loading());

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    Provider<Services>(create: (context) => mockServices),
                    BlocProvider<AuthStateCubit>(
                      create: (context) => mockAuthBloc,
                    ),
                    BlocProvider<ProfileStateCubit>(
                      create: (context) => mockProfileCubit,
                    ),
                  ],
                  child: MockGoRouterProvider(
                    mockGoRouter: mockGoRouter,
                    child: ProfileButton(),
                  ),
                ),
              ),
            );
          })
          .then((_) async {
            expect(find.byType(AppLoadingIndicator), findsOneWidget);
          });
    });

    testWidgets('will show error state when profile loading failed', (
      WidgetTester tester,
    ) async {
      final userId = Faker().guid.guid();

      when(
        () => mockAuthBloc.state,
      ).thenReturn(AuthState.signedIn(userId: userId));
      when(() => mockProfileCubit.state).thenReturn(ProfileState.error());

      when(() => mockGoRouter.push(any())).thenAnswer((_) async => null);
      when(() => mockGoRouter.go(any())).thenAnswer((_) async {});

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    Provider<Services>(create: (context) => mockServices),
                    BlocProvider<AuthStateCubit>(
                      create: (context) => mockAuthBloc,
                    ),
                    BlocProvider<ProfileStateCubit>(
                      create: (context) => mockProfileCubit,
                    ),
                  ],
                  child: MockGoRouterProvider(
                    mockGoRouter: mockGoRouter,
                    child: ProfileButton(),
                  ),
                ),
              ),
            );
            await tester.pumpAndSettle();
          })
          .then((_) async {
            expect(
              find.byKey(const Key('profile_button_error_icon')),
              findsOneWidget,
            );

            await tester.tap(
              find.byKey(const Key('profile_button_error_icon')),
            );
            await tester.pumpAndSettle();

            verify(
              () => mockGoRouter.go(ProfileRoute(profileId: userId).location),
            ).called(1);
            verify(() => mockHapticsService.tap()).called(1);
            verifyNever(() => mockGoRouter.go(any()));
          });
    });

    testWidgets('will show profile image profile loaded and is completed', (
      WidgetTester tester,
    ) async {
      final userId = Faker().guid.guid();
      final profile = Faker().createProfile().copyWith(
        id: userId,
        completed: true,
      );

      final location = ProfileRoute(profileId: profile.id).location;

      when(
        () => mockAuthBloc.state,
      ).thenReturn(AuthState.signedIn(userId: userId));
      when(
        () => mockProfileCubit.state,
      ).thenReturn(ProfileState.loaded(profile: profile));

      final GoRouter goRouter = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => withAllContextProviders(
              MultiProvider(
                providers: [
                  Provider<Services>(create: (context) => mockServices),
                  BlocProvider<AuthStateCubit>(
                    create: (context) => mockAuthBloc,
                  ),
                  BlocProvider<ProfileStateCubit>(
                    create: (context) => mockProfileCubit,
                  ),
                ],
                child: ProfileButton(),
              ),
            ),
          ),
          GoRoute(
            path: location,
            name: location,
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      );

      await tester.pumpWidget(MaterialApp.router(routerConfig: goRouter));
      await tester.pumpAndSettle();
      expect(find.byType(ProfileImage), findsOneWidget);

      await tester.tap(
        find.byKey(const Key('profile_button_signed_in_ink_well')),
      );
      await tester.pumpAndSettle();

      verify(() => mockHapticsService.tap()).called(1);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    // Cannot stub mockGoRouter.push
    // because of it won't return the
    // Need to assert with GoRouter implementation
    testWidgets('will show profile image profile loaded and is not completed', (
      WidgetTester tester,
    ) async {
      final userId = Faker().guid.guid();
      final profile = Faker().createProfile().copyWith(
        id: userId,
        completed: false,
      );

      final location = ProfileWizardRoute(profileId: profile.id).location;

      when(
        () => mockAuthBloc.state,
      ).thenReturn(AuthState.signedIn(userId: userId));
      when(
        () => mockProfileCubit.state,
      ).thenReturn(ProfileState.loaded(profile: profile));

      final GoRouter goRouter = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => withAllContextProviders(
              MultiProvider(
                providers: [
                  Provider<Services>(create: (context) => mockServices),
                  BlocProvider<AuthStateCubit>(
                    create: (context) => mockAuthBloc,
                  ),
                  BlocProvider<ProfileStateCubit>(
                    create: (context) => mockProfileCubit,
                  ),
                ],
                child: ProfileButton(),
              ),
            ),
          ),
          GoRoute(
            path: location,
            name: location,
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      );

      await tester.pumpWidget(MaterialApp.router(routerConfig: goRouter));
      await tester.pumpAndSettle();
      expect(find.byType(ProfileImage), findsOneWidget);

      await tester.tap(
        find.byKey(const Key('profile_button_signed_in_ink_well')),
      );
      await tester.pumpAndSettle();

      verify(() => mockHapticsService.tap()).called(1);
      expect(find.byType(SizedBox), findsOneWidget);
    });
  }); // eof group
} // eof main
