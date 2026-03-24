import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/milestone_progress.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:dhyana/widget/profile/stats/milestones_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_context_providers.dart';

void main() {

  group('MilestonesView', () {

    setUp(() async {

    });

    testWidgets('can show milestone count', (WidgetTester tester) async {
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
          MilestonesView(
            profile: profile,
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.text(profile.statsReport.milestoneCount.toStringAsFixed(0)), findsOneWidget);

    });

  }); // eof group
} // eof main
