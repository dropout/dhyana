import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_context_providers.dart';

void main() {

  group('SummaryView', () {

    setUp(() async {

    });

    testWidgets('can show statistics summary data', (WidgetTester tester) async {
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
