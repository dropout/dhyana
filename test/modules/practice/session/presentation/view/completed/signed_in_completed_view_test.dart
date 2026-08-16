import 'package:dhyana/modules/practice/session/data/mapper/session_mapper.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_completed_data_entity.dart';
import 'package:dhyana/core/presentation/viewmodel/profile_cubit.dart';
import 'package:dhyana/modules/practice/session/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:dhyana/core/util/services.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/modules/practice/session/domain/entity/update_profile_stats_result_entity.dart';
import 'package:dhyana/modules/social/domain/usecase/query_presence_use_case.dart';
import 'package:dhyana/modules/social/public/view/presence_area.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/milestone_progress_view.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/progress_summary.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/session_result.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/signed_in_completed_view.dart';
import 'package:dhyana/core/presentation/view/util/app_error_display.dart';
import 'package:dhyana/core/presentation/view/util/app_loading_display.dart';
import 'package:dhyana/modules/social/public/viewmodel/presence_cubit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nock/nock.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../../../../mock_definitions.dart';
import '../../../../../../test_context_providers.dart';
import '../../../../../social/social_mock_definitions.dart';

void main() {
  late MockProfileCubit mockProfileCubit;
  late MockSessionCompletedCubit mockSessionCompletedCubit;

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;
  late MockResourceResolver mockResourceResolver;

  late QueryPresenceUseCase mockQueryPresenceUseCase;

  setUpAll(() async {
    nock.init();

    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    mockProfileCubit = MockProfileCubit();
    mockSessionCompletedCubit = MockSessionCompletedCubit();

    mockServices = MockServices();
    mockCrashlyticsService = MockCrashlyticsService();
    mockResourceResolver = MockResourceResolver();
    mockQueryPresenceUseCase = MockQueryPresenceUseCase();

    when(
      () => mockServices.crashlyticsService,
    ).thenReturn(mockCrashlyticsService);

    when(() => mockServices.resourceResolver).thenReturn(mockResourceResolver);

    when(() => mockResourceResolver.resolveStoragePath(any())).thenAnswer((_) {
      return Future.value('https://example.com/profile.jpg');
    });

    GetIt.I.registerFactory<QueryPresenceUseCase>(
      () => mockQueryPresenceUseCase,
    );
    GetIt.I.registerFactory<PresenceCubit>(
      () => PresenceCubit(
        crashlyticsService: mockCrashlyticsService,
        queryPresenceDataUseCase: mockQueryPresenceUseCase,
      ),
    );

      nock.cleanAll();
      // Mock the MethodChannel for path_provider to return a valid path
      // CachedNetworkImage uses path_provider to get the cache directory, 
      // so we need to mock it for testing
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async => '.',
        );    
  });

  tearDown(() {
    GetIt.I.reset();

    // Clear the mock handler for the MethodChannel to avoid affecting other tests
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      null, // <--- Removes the mock handler
    );
  });

  group('SignedInCompletedView', () {
    testWidgets('can log session on initialization', (
      WidgetTester tester,
    ) async {
      final profileId = 'profileId';
      final session = FakeModelFactory().createSessionEntity();
      final UpdateProfileStatsResultEntity updateResult =
          UpdateProfileStatsResultEntity(
            updatedProfile: FakeModelFactory().createProfile(),
            oldProfile: FakeModelFactory().createProfile(),
            session: session,
          );

      when(
        () => mockSessionCompletedCubit.state,
      ).thenReturn(const SessionCompletedInitialDataEntity());
      when(
        () => mockSessionCompletedCubit.stream,
      ).thenAnswer((_) => const Stream<SessionCompletedDataEntity>.empty());

      when(
        () => mockSessionCompletedCubit.logSession(
          profileId,
          session.toApi(),
          onComplete: any(named: 'onComplete'),
        ),
      ).thenAnswer((invocation) async {
        final onComplete =
            invocation.namedArguments[const Symbol('onComplete')]
                as void Function(UpdateProfileStatsResultEntity)?;
        onComplete?.call(updateResult);
      });

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    Provider<Services>.value(value: mockServices),
                    BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
                    BlocProvider<SessionCompletedCubit>.value(
                      value: mockSessionCompletedCubit,
                    ),
                  ],
                  child: SignedInCompletedView(
                    profileId: 'profileId',
                    session: session.toApi(),
                    profileSettings: ProfileSettings(),
                  ),
                ),
              ),
            );
            await tester.pump();
          })
          .then((_) {
            verify(
              () => mockSessionCompletedCubit.logSession(
                'profileId',
                session.toApi(),
                onComplete: any(named: 'onComplete'),
              ),
            ).called(1);

            verify(
              () => mockProfileCubit.loadProfile(
                'profileId',
                profile: updateResult.updatedProfile,
              ),
            ).called(1);
          });
    });

    testWidgets('can show loading when initial state', (
      WidgetTester tester,
    ) async {
      final SessionEntity session = FakeModelFactory().createSessionEntity();

      when(
        () => mockSessionCompletedCubit.state,
      ).thenReturn(const SessionCompletedDataEntity.initial());

      when(
        () => mockSessionCompletedCubit.logSession(
          'profileId',
          session.toApi(),
          onComplete: any(named: 'onComplete'),
        ),
      ).thenAnswer((_) => Future.value(null));

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    Provider<Services>.value(value: mockServices),
                    BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
                    BlocProvider<SessionCompletedCubit>.value(
                      value: mockSessionCompletedCubit,
                    ),
                  ],
                  child: SignedInCompletedView(
                    profileId: 'profileId',
                    session: session.toApi(),
                    profileSettings: ProfileSettings(),
                  ),
                ),
              ),
            );
            await tester.pump();
          })
          .then((_) {
            expect(find.byType(AppLoadingDisplay), findsOneWidget);
          });
    });

    testWidgets('can show loading when loading state', (
      WidgetTester tester,
    ) async {
      final SessionEntity session = FakeModelFactory().createSessionEntity();

      when(
        () => mockSessionCompletedCubit.state,
      ).thenReturn(const SessionCompletedDataEntity.loading());

      when(
        () => mockSessionCompletedCubit.logSession(
          'profileId',
          session.toApi(),
          onComplete: any(named: 'onComplete'),
        ),
      ).thenAnswer((_) => Future.value(null));

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    Provider<Services>.value(value: mockServices),
                    BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
                    BlocProvider<SessionCompletedCubit>.value(
                      value: mockSessionCompletedCubit,
                    ),
                  ],
                  child: SignedInCompletedView(
                    profileId: 'profileId',
                    session: session.toApi(),
                    profileSettings: ProfileSettings(),
                  ),
                ),
              ),
            );
            await tester.pump();
          })
          .then((_) {
            expect(find.byType(AppLoadingDisplay), findsOneWidget);
          });
    });

    testWidgets('can show error when error state', (WidgetTester tester) async {
      final SessionEntity session = FakeModelFactory().createSessionEntity();

      when(
        () => mockSessionCompletedCubit.state,
      ).thenReturn(const SessionCompletedDataEntity.error());

      when(
        () => mockSessionCompletedCubit.logSession(
          'profileId',
          session.toApi(),
          onComplete: any(named: 'onComplete'),
        ),
      ).thenAnswer((_) => Future.value(null));

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    Provider<Services>.value(value: mockServices),
                    BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
                    BlocProvider<SessionCompletedCubit>.value(
                      value: mockSessionCompletedCubit,
                    ),
                  ],
                  child: SignedInCompletedView(
                    profileId: 'profileId',
                    session: session.toApi(),
                    profileSettings: ProfileSettings(),
                  ),
                ),
              ),
            );
            await tester.pump();
          })
          .then((_) {
            expect(find.byType(AppErrorDisplay), findsOneWidget);
          });
    });

    testWidgets('can show loaded when saving session', (
      WidgetTester tester,
    ) async {
      final SessionEntity session = FakeModelFactory().createSessionEntity();
      final oldProfile = FakeModelFactory().createProfile();
      final updatedProfile = oldProfile.copyWith(
        statsReport: oldProfile.statsReport.copyWith(
          completedSessionsCount:
              oldProfile.statsReport.completedSessionsCount + 1,
        ),
      );

      UpdateProfileStatsResultEntity updateResult =
          UpdateProfileStatsResultEntity(
            updatedProfile: updatedProfile,
            oldProfile: oldProfile,
            session: session,
          );

      when(() => mockSessionCompletedCubit.state).thenReturn(
        SessionCompletedDataEntity.saving(updateResult: updateResult),
      );

      when(
        () => mockSessionCompletedCubit.logSession(
          'profileId',
          session.toApi(),
          onComplete: any(named: 'onComplete'),
        ),
      ).thenAnswer((_) => Future.value(null));

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    Provider<Services>.value(value: mockServices),
                    BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
                    BlocProvider<SessionCompletedCubit>.value(
                      value: mockSessionCompletedCubit,
                    ),
                  ],
                  child: SignedInCompletedView(
                    profileId: 'profileId',
                    session: session.toApi(),
                    profileSettings: ProfileSettings(),
                  ),
                ),
              ),
            );
            await tester.pumpAndSettle();
          })
          .then((_) {
            expect(find.byType(SessionResult), findsOneWidget);
            expect(find.byType(MilestoneProgressView), findsOneWidget);
            expect(find.byType(ProgressSummary), findsOneWidget);
            expect(find.byType(PresenceArea), findsOneWidget);
          });
    });

    testWidgets('can show loaded when saving session completed', (
      WidgetTester tester,
    ) async {
      final SessionEntity session = FakeModelFactory().createSessionEntity();
      UpdateProfileStatsResultEntity updateResult =
          UpdateProfileStatsResultEntity(
            updatedProfile: FakeModelFactory().createProfile(),
            oldProfile: FakeModelFactory().createProfile(),
            session: session,
          );

      when(() => mockSessionCompletedCubit.state).thenReturn(
        SessionCompletedDataEntity.saved(updateResult: updateResult),
      );

      when(
        () => mockSessionCompletedCubit.logSession(
          'profileId',
          session.toApi(),
          onComplete: any(named: 'onComplete'),
        ),
      ).thenAnswer((_) => Future.value(null));

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    Provider<Services>.value(value: mockServices),
                    BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
                    BlocProvider<SessionCompletedCubit>.value(
                      value: mockSessionCompletedCubit,
                    ),
                  ],
                  child: SignedInCompletedView(
                    profileId: 'profileId',
                    session: session.toApi(),
                    profileSettings: ProfileSettings(),
                  ),
                ),
              ),
            );
            await tester.pumpAndSettle();
          })
          .then((_) {
            expect(find.byType(SessionResult), findsOneWidget);
            expect(find.byType(MilestoneProgressView), findsOneWidget);
            expect(find.byType(ProgressSummary), findsOneWidget);
            expect(find.byType(PresenceArea), findsOneWidget);
          });
    });
  }); // eof group
} // eof main
