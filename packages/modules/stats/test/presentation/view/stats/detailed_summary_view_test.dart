import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';

import 'package:profile/profile.dart';
import 'package:stats/src/data/datasource/faker_stats_extension.dart';


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
        withAllContextProviders(
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
