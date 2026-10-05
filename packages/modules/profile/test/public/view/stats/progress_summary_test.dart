import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/public/view/stats/progress_summary_item.dart';

import '../../../profile_test_helper.dart';


// Helper to get the Type of a generic class
// This is to make a generic widget class work with find.byType
Type typeOf<T>() => T;

void main() {

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;

  setUpAll(() async {
    mockServices = MockServices();
    mockCrashlyticsService = MockCrashlyticsService();

    when(() => mockServices.crashlyticsService)
      .thenReturn(mockCrashlyticsService);
  });

  group('ProgressSummaryTest', () {

    testWidgets('can be created with its default values', (WidgetTester tester) async {

      Profile oldProfile = Faker().createProfile();
      Profile updatedProfile = Faker().createProfile().copyWith(
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
        ProfileTestHelper.withLocalizationProvider(
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
