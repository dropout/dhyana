import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/profile/stats/consecutive_days_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_context_providers.dart';

void main() {

  group('ConsecutiveDaysView', () {

    setUp(() async {

    });

    testWidgets('can show consecutive days count', (WidgetTester tester) async {
      final Profile profile = FakeModelFactory().createProfile().copyWith(
        statsReport: ProfileStatisticsReport(
          consecutiveDays: ConsecutiveDays(
            current: 5,
            longest: 10,
            startedAt: DateTime.now().subtract(const Duration(days: 5)),
            lastChecked: DateTime.now().subtract(const Duration(hours: 1)),
          )
        )
      );

      await tester.pumpWidget(
        withAllContextProviders(
          ConsecutiveDaysView(
            profile: profile,
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.text(profile.statsReport.consecutiveDays.current.toString()), findsOneWidget);
    });

  }); // eof group
} // eof main
