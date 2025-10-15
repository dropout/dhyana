import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/all.dart';
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
            profile: profile,
          )
        )
      );
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(DetailedMilestonesView));

      expect(find.text(profile.statsReport.milestoneCount.toString()), findsOneWidget);
      expect(find.text(context.localizations.statsNextMilestoneInShort(2)), findsOneWidget);

      expect(find.byType(LabelValueDetail), findsNWidgets(2));
    });

  }); // eof group
} // eof main
