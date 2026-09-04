import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';

import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/public/model/milestone_progress.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/model/profile_stats_report.dart';
import 'package:profile/src/public/view/stats/milestones_view.dart';

import '../../../profile_test_helper.dart';


void main() {

  group('MilestonesView', () {

    setUp(() async {

    });

    testWidgets('can show milestone count', (WidgetTester tester) async {
      final Profile profile = Faker().createProfile().copyWith(
        statsReport: ProfileStatsReport(
          milestoneCount: 5,
          milestoneProgress: MilestoneProgress(
            targetDaysCount: 7,
            completedDaysCount: 5,
          )
        )
      );

      await tester.pumpWidget(
        ProfileTestHelper.withLocalizationProvider(
          MilestonesView(
            profileStatsReport: profile.statsReport,
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.text(profile.statsReport.milestoneCount.toStringAsFixed(0)), findsOneWidget);

    });

  }); // eof group
} // eof main
