import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';
import 'package:profile/l10n/profile_localizations.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/public/model/milestone_progress.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/model/profile_stats_report.dart';
import 'package:profile/src/public/view/stats/detailed_milestones_view.dart';
import 'package:profile/src/public/view/stats/label_value_detail.dart';

import '../../../profile_test_helper.dart';


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
        ProfileTestHelper.withLocalizationProvider(
          DetailedMilestonesView(
            profileStatsReport: profile.statsReport,
          )
        )
      );
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(DetailedMilestonesView));

      expect(find.text(profile.statsReport.milestoneCount.toString()), findsOneWidget);
      expect(find.text(ProfileLocalizations.of(context).statsNextMilestoneInShort(2)), findsOneWidget);

      expect(find.byType(LabelValueDetail), findsNWidgets(2));
    });

  }); // eof group
} // eof main
