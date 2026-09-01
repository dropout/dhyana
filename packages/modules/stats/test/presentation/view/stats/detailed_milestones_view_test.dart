import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:stats/src/data/datasource/faker_stats_extension.dart';

import 'package:stats/src/presentation/view/stats/detailed_milestones_view.dart';
import 'package:stats/src/presentation/view/stats/label_value_detail.dart';


void main() {

  group('DetailedMilestonesView', () {

    setUp(() async {

    });

    testWidgets('can show detailed milestone data', (WidgetTester tester) async {
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
