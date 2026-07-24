import 'package:dhyana/core/domain/model/fake/fake_model_factory.dart';
import 'package:dhyana/modules/insights/domain/model/milestone_progress.dart';
import 'package:dhyana/core/domain/model/profile.dart';
import 'package:dhyana/modules/insights/domain/model/profile_statistics_report.dart';
import 'package:dhyana/modules/insights/presentation/widget/stats/detailed_summary_view.dart';
import 'package:dhyana/modules/insights/presentation/widget/stats/label_value_detail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_context_providers.dart';

void main() {

  group('DetailedSummaryView', () {

    setUp(() async {

    });

    testWidgets('can show detailed statistics summary data', (WidgetTester tester) async {
      final Profile profile = FakeModelFactory().createProfile().copyWith(
        statsReport: ProfileStatisticsReport(
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
