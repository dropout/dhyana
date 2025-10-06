import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/session/completed/progress_summary.dart';
import 'package:dhyana/widget/session/completed/progress_summary_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock_definitions.dart';
import '../../../test_context_providers.dart';

// Helper to get the Type of a generic class
// This is to make a generic widget class work with find.byType
Type typeOf<T>() => T;

void main() {

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;
  late MockCacheManagerService mockCacheManagerService;

  setUpAll(() async {

    mockServices = MockServices();

    mockCrashlyticsService = MockCrashlyticsService();
    mockCacheManagerService = MockCacheManagerService();

    when(() => mockServices.crashlyticsService)
      .thenReturn(mockCrashlyticsService);

    when(() => mockServices.cacheManagerService)
      .thenReturn(mockCacheManagerService);
    when(() => mockCacheManagerService.cacheManager)
      .thenReturn(MockCacheManager());

  });

  group('ProgressSummaryTest', () {

    testWidgets('can be created with its default values', (WidgetTester tester) async {

      Profile oldProfile = FakeModelFactory().createProfile();
      Profile updatedProfile = FakeModelFactory().createProfile().copyWith(
        statsReport: oldProfile.statsReport.copyWith(
          completedSessionsCount: oldProfile.statsReport.completedSessionsCount + 1,
          completedMinutesCount: oldProfile.statsReport.completedMinutesCount + 20,
          completedDaysCount: oldProfile.statsReport.completedDaysCount + 1,
          milestoneProgress: oldProfile.statsReport.milestoneProgress.copyWith(
            completedDaysCount: 3,
            targetDaysCount: 7,
          ),
        ),
      );

      await tester.pumpWidget(
        withAllContextProviders(
          ProgressSummary(
            oldProfile: oldProfile,
            updatedProfile: updatedProfile,
          ),
        )
      );
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Sessions
      final sessionsSummaryItem =
        tester.widget(find.byKey(const Key('progress_summary_sessions')))
        as ProgressSummaryItem;
      expect(
        sessionsSummaryItem.oldValue,
        oldProfile.statsReport.completedSessionsCount
      );
      expect(
        sessionsSummaryItem.newValue,
        updatedProfile.statsReport.completedSessionsCount
      );

      // Minutes
      final minutesSummaryItem =
        tester.widget(find.byKey(const Key('progress_summary_minutes')))
        as ProgressSummaryItem;
      expect(
        minutesSummaryItem.oldValue,
        oldProfile.statsReport.completedMinutesCount
      );
      expect(
        minutesSummaryItem.newValue,
        updatedProfile.statsReport.completedMinutesCount
      );

      // Days
      final daysSummaryItem =
        tester.widget(find.byKey(const Key('progress_summary_days')))
        as ProgressSummaryItem;
      expect(
        daysSummaryItem.oldValue,
        oldProfile.statsReport.completedDaysCount
      );
      expect(
        daysSummaryItem.newValue,
        updatedProfile.statsReport.completedDaysCount
      );

    });

  }); // eof group
} // eof main
