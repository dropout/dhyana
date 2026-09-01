import 'package:core/core.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:profile/profile.dart';
import 'package:stats/src/data/datasource/faker_stats_extension.dart';
import 'package:stats/src/presentation/view/stats/summary_view.dart';



void main() {

  group('SummaryView', () {

    setUp(() async {

    });

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
        withAllContextProviders(
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
