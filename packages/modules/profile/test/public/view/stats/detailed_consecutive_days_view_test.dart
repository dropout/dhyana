import 'package:core/core.dart';
import 'package:faker/faker.dart';
import 'package:profile/profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';

import '../../../profile_test_helper.dart';


void main() {

  group('DetailedConsecutiveDaysView', () {

    setUp(() async {

    });

    testWidgets('can show detailed consecutive days data', (WidgetTester tester) async {
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
          DetailedConsecutiveDaysView(
            profileStatsReport: profile.statsReport,
          )
        )
      );
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(DetailedConsecutiveDaysView));

      expect(find.text(profile.statsReport.consecutiveDays.current.toString()), findsOneWidget);
      expect(find.text(profile.statsReport.consecutiveDays.startedAt!.toFormattedDateTimeString(context)), findsOneWidget);
      expect(find.text(profile.statsReport.consecutiveDays.lastChecked!.toFormattedDateTimeString(context)), findsOneWidget);
      expect(find.text(profile.statsReport.consecutiveDays.longest.toString()), findsOneWidget);

      expect(find.byType(LabelValueDetail), findsNWidgets(4));
    });

  }); // eof group
} // eof main
