import 'package:dhyana/modules/practice/session/data/mapper/session_mapper.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_completed_data_entity.dart';
import 'package:dhyana/core/presentation/viewmodel/profile_cubit.dart';
import 'package:dhyana/modules/practice/session/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:dhyana/core/util/services.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/modules/practice/session/domain/entity/update_profile_stats_result_entity.dart';
import 'package:dhyana/modules/social/public/view/presence_area.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/milestone_progress_view.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/progress_summary.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/session_result.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/signed_in_completed_view.dart';
import 'package:dhyana/core/presentation/view/util/app_error_display.dart';
import 'package:dhyana/core/presentation/view/util/app_loading_display.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../../../mock_definitions.dart';
import '../../../../../../test_context_providers.dart';

void main() {
  late MockProfileCubit mockProfileCubit;
  late MockSessionCompletedCubit mockSessionCompletedCubit;

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;

  setUpAll(() async {
    mockProfileCubit = MockProfileCubit();
    mockSessionCompletedCubit = MockSessionCompletedCubit();

    mockServices = MockServices();
    mockCrashlyticsService = MockCrashlyticsService();

    when(
      () => mockServices.crashlyticsService,
    ).thenReturn(mockCrashlyticsService);
  });

  group('SignedInCompletedView', () {
    testWidgets('can log session on initialization', (
      WidgetTester tester,
    ) async {
      final profileId = 'profileId';
      final session = FakeModelFactory().createSessionEntity();
      final UpdateProfileStatsResultEntity updateResult = UpdateProfileStatsResultEntity(
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
      UpdateProfileStatsResultEntity updateResult = UpdateProfileStatsResultEntity(
        updatedProfile: FakeModelFactory().createProfile(),
        oldProfile: FakeModelFactory().createProfile(),
        session: session,
      );

      when(
        () => mockSessionCompletedCubit.state,
      ).thenReturn(SessionCompletedDataEntity.saving(updateResult: updateResult));

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
      UpdateProfileStatsResultEntity updateResult = UpdateProfileStatsResultEntity(
        updatedProfile: FakeModelFactory().createProfile(),
        oldProfile: FakeModelFactory().createProfile(),
        session: session,
      );

      when(
        () => mockSessionCompletedCubit.state,
      ).thenReturn(SessionCompletedDataEntity.saved(updateResult: updateResult));

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
