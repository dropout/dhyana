import 'package:dhyana/core/domain/model/fake/fake_model_factory.dart';
import 'package:dhyana/modules/insights/domain/model/milestone_progress.dart';
import 'package:dhyana/modules/account/domain/model/profile.dart';
import 'package:dhyana/modules/insights/domain/model/profile_statistics_report.dart';
import 'package:dhyana/modules/insights/presentation/widget/stats/detailed_milestones_view.dart';
import 'package:dhyana/modules/insights/presentation/widget/stats/label_value_detail.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_context_providers.dart';

void main() {

  group('DetailedMilestonesView', () {

    setUp(() async {

    });

    testWidgets('can show detailed milestone data', (WidgetTester tester) async {
      final Profile profile = FakeModelFactory().createProfile().copyWith(
        statsReport: ProfileStatisticsReport(
          milestoneCount: 5,
          milestoneProgress: MilestoneProgress(
            targetDaysCount: 7,
            completedDaysCount: 5,
          )
        )
      );

      await tester.pumpWidget(
        withAllContextProviders(
          DetailedMilestonesView(
            profileStatsReport: profile.statsReport,
          )
        )
      );
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(DetailedMilestonesView));

      expect(find.text(profile.statsReport.milestoneCount.toString()), findsOneWidget);
      expect(find.text(context.l10n.statsNextMilestoneInShort(2)), findsOneWidget);

      expect(find.byType(LabelValueDetail), findsNWidgets(2));
    });

  }); // eof group
} // eof main
