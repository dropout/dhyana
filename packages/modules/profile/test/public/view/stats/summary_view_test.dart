import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/public/model/milestone_progress.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/model/profile_stats_report.dart';
import 'package:profile/src/public/view/stats/summary_view.dart';

import '../../../profile_test_helper.dart';


void main() {

  group('SummaryView', () {

    setUp(() async {});

    testWidgets('can show statistics summary data', (WidgetTester tester) async {
      final Profile profile = Faker().createProfile().copyWith(
        statsReport: ProfileStatsReport(
          milestoneCount: 5,
          completedSessionsCount: 43,
          completedMinutesCount: 1234,
          completedDaysCount: 12,
          milestoneProgress: MilestoneProgress(
            targetDaysCount: 7,
            completedDaysCount: 5,
          )
        )
      );

      await tester.pumpWidget(
        ProfileTestHelper.withLocalizationProvider(
          SummaryView(
            profile: profile,
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byType(SummaryItem), findsNWidgets(3));
      expect(find.text(profile.statsReport.completedDaysCount.toString()), findsOneWidget);
      expect(find.text(profile.statsReport.completedSessionsCount.toString()), findsOneWidget);
      expect(find.text(profile.statsReport.completedMinutesCount.toString()), findsOneWidget);
    });

  }); // eof group
} // eof main
