import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:stats/src/data/datasource/faker_stats_extension.dart';
import 'package:stats/src/presentation/view/stats/consecutive_days_view.dart';



void main() {

  group('ConsecutiveDaysView', () {

    setUp(() async {

    });

    testWidgets('can show consecutive days count', (WidgetTester tester) async {
      final Profile profile = Faker().createProfile().copyWith(
        statsReport: ProfileStatsReport(
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
