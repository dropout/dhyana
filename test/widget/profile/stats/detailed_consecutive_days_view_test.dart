import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_context_providers.dart';

void main() {

  group('DetailedConsecutiveDaysView', () {

    setUp(() async {

    });

    testWidgets('can show detailed consecutive days data', (WidgetTester tester) async {
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
          DetailedConsecutiveDaysView(
            profile: profile,
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
