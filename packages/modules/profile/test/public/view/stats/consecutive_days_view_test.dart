import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';


import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/public/model/consecutive_days.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/model/profile_stats_report.dart';
import 'package:profile/src/public/view/stats/consecutive_days_view.dart';

import '../../../profile_test_helper.dart';


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
        ProfileTestHelper.withLocalizationProvider(
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
