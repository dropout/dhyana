import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/profile/profile_module.dart';

import 'package:dhyana/modules/stats/presentation/view/stats/detailed_milestones_view.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/label_value_detail.dart';
import 'package:dhyana/core/presentation/view/util/app_context.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_context_providers.dart';

void main() {

  group('DetailedMilestonesView', () {

    setUp(() async {

    });

    testWidgets('can show detailed milestone data', (WidgetTester tester) async {
      final Profile profile = FakeModelFactory().createProfile().copyWith(
        statsReport: ProfileStatsReport(
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
