import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/public/model/milestone_progress.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/model/profile_stats_report.dart';
import 'package:profile/src/public/view/stats/detailed_summary_view.dart';
import 'package:profile/src/public/view/stats/label_value_detail.dart';

import '../../../profile_test_helper.dart';


void main() {

  group('DetailedSummaryView', () {

    setUp(() async {

    });

    testWidgets('can show detailed statistics summary data', (WidgetTester tester) async {
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
          DetailedSummaryView(
            profileStatsReport: profile.statsReport,
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.text(profile.statsReport.completedDaysCount.toString()), findsOneWidget);
      expect(find.text(profile.statsReport.completedSessionsCount.toString()), findsOneWidget);
      expect(find.text(profile.statsReport.completedMinutesCount.toString()), findsOneWidget);

      expect(find.byType(LabelValueDetail), findsNWidgets(3));
    });

  }); // eof group
} // eof main
