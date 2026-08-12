import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/profile/profile_module.dart';

import 'package:dhyana/modules/stats/presentation/view/stats/milestones_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_context_providers.dart';

void main() {

  group('MilestonesView', () {

    setUp(() async {

    });

    testWidgets('can show milestone count', (WidgetTester tester) async {
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
