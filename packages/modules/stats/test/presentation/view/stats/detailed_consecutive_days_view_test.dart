import 'package:core/core.dart';
import 'package:faker/faker.dart';
import 'package:profile/profile.dart';
import 'package:stats/src/data/datasource/faker_stats_extension.dart';
import 'package:profile/src/public/view/stats/detailed_consecutive_days_view.dart';
import 'package:profile/src/public/view/stats/label_value_detail.dart';
import 'package:flutter_test/flutter_test.dart';


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
        withAllContextProviders(
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
