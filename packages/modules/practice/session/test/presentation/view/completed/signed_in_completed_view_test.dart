import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nock/nock.dart';
import 'package:profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:social/social.dart';

import 'package:core/core.dart';
import 'package:session/src/data/datasource/faker_session_extension.dart';
import 'package:session/src/data/mapper/update_profile_stats_result_mapper.dart';
import 'package:session/src/domain/entity/session_entity.dart';
import 'package:session/src/domain/entity/update_profile_stats_result_entity.dart';
import 'package:session/src/public/view/session_result.dart';
import 'package:session/src/public/view/signed_in_completed_view.dart';

import '../../../session_mock_definitions.dart';
import '../../../session_test_helper.dart';

void main() {
  late MockServices mockServices;
  late MockResourceResolver mockResourceResolver;
  late MockPresenceCubit mockPresenceCubit;

  setUpAll(() {
    registerFallbackValue(Duration.zero);
    nock.init();
  });

  setUp(() {
    mockServices = MockServices();
    mockResourceResolver = MockResourceResolver();
    mockPresenceCubit = MockPresenceCubit();

    when(() => mockPresenceCubit.state)
        .thenReturn(const PresenceState.initial());
    when(
      () => mockPresenceCubit.loadPresenceData(
        ownProfileId: any(named: 'ownProfileId'),
        limit: any(named: 'limit'),
        windowSize: any(named: 'windowSize'),
      ),
    ).thenAnswer((_) async {});
    GetIt.I.registerFactory<PresenceCubit>(() => mockPresenceCubit);

    when(() => mockServices.resourceResolver).thenReturn(mockResourceResolver);
    when(() => mockResourceResolver.resolveStoragePath(any())).thenAnswer((_) {
      return Future.value('https://example.com/profile.jpg');
    });

    nock.cleanAll();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async => '.',
        );
  });

  tearDown(() {
    GetIt.I.reset();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          null,
        );
  });

  late UpdateProfileStatsResultEntity updateResult;

  Future<void> pumpView(
    WidgetTester tester, {
    required bool showStats,
    required bool usePresence,
  }) async {
    final SessionEntity session = Faker().createSessionEntity();
    updateResult = UpdateProfileStatsResultEntity(
      updatedProfile: Faker().createProfile(),
      oldProfile: Faker().createProfile(),
      session: session,
    );

    await tester.pumpWidget(
      SessionTestHelper.withLocalizationProvider(
        Provider<Services>.value(
          value: mockServices,
          child: SignedInCompletedView(
            profileId: updateResult.updatedProfile.id,
            updateResult: updateResult.toApi(),
            showStatsOnFinishScreen: showStats,
            usePresenceFeature: usePresence,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  group('SignedInCompletedView settings', () {
    testWidgets('shows result, stats and presence when both enabled', (
      tester,
    ) async {
      await pumpView(tester, showStats: true, usePresence: true);

      expect(find.byType(SessionResult), findsOneWidget);
      expect(find.byType(MilestoneProgressView), findsOneWidget);
      expect(find.byType(ProgressSummary), findsOneWidget);
      expect(find.byType(PresenceArea), findsOneWidget);
    });

    testWidgets('loads presence data for the updated profile', (tester) async {
      await pumpView(tester, showStats: true, usePresence: true);

      verify(
        () => mockPresenceCubit.loadPresenceData(
          ownProfileId: updateResult.updatedProfile.id,
          limit: 18,
          windowSize: const Duration(minutes: 120),
        ),
      ).called(1);
    });

    testWidgets('hides presence when presence feature disabled', (
      tester,
    ) async {
      await pumpView(tester, showStats: true, usePresence: false);

      expect(find.byType(SessionResult), findsOneWidget);
      expect(find.byType(MilestoneProgressView), findsOneWidget);
      expect(find.byType(ProgressSummary), findsOneWidget);
      expect(find.byType(PresenceArea), findsNothing);
      verifyNever(
        () => mockPresenceCubit.loadPresenceData(
          ownProfileId: any(named: 'ownProfileId'),
          limit: any(named: 'limit'),
          windowSize: any(named: 'windowSize'),
        ),
      );
    });

    testWidgets('hides stats when stats disabled', (tester) async {
      await pumpView(tester, showStats: false, usePresence: true);

      expect(find.byType(SessionResult), findsOneWidget);
      expect(find.byType(MilestoneProgressView), findsNothing);
      expect(find.byType(ProgressSummary), findsNothing);
      expect(find.byType(PresenceArea), findsOneWidget);
    });

    testWidgets('shows only the result when both disabled', (tester) async {
      await pumpView(tester, showStats: false, usePresence: false);

      expect(find.byType(SessionResult), findsOneWidget);
      expect(find.byType(MilestoneProgressView), findsNothing);
      expect(find.byType(ProgressSummary), findsNothing);
      expect(find.byType(PresenceArea), findsNothing);
      expect(find.byType(SingleChildScrollView), findsNothing);
    });
  });
}
