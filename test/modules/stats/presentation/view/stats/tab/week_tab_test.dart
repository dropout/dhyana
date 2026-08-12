import 'package:dhyana/core/util/services.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/bar_chart_page/weeks_bar_chart_page.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/tab/week_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../../../mock_definitions.dart';
import '../../../../../../test_context_providers.dart';

void main() {

  group('WeekTab', () {

    late MockServices mockServices;
    late MockStatisticsRepository mockStatisticsRepository;
    late MockCrashlyticsService mockCrashlyticsService;  

    setUpAll(() {

    });

    setUp(() async {
      mockServices = MockServices();
      mockCrashlyticsService = MockCrashlyticsService();

      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);

      mockStatisticsRepository = MockStatisticsRepository();

    });

    testWidgets('can be created with its default values', (WidgetTester tester) async {
      final Profile profile = FakeModelFactory().createProfile().copyWith(
        statsReport: ProfileStatsReport(
          milestoneCount: 5,
          milestoneProgress: MilestoneProgress(
            targetDaysCount: 7,
            completedDaysCount: 5,
          )
        )
      );

      when(() => mockStatisticsRepository.queryWeeks(profile.id, from: any(named: 'from'), to: any(named: 'to')))
        .thenAnswer((_) async => FakeModelFactory().createWeeks(4));

      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
              // Provider<Repositories>(create: (context) => mockRepositories),
            ],
            child: WeekTab(
              profileId: profile.id,
            ),
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byType(WeeksBarChartPage), findsOneWidget);
      final WeekTabState weekTabState = tester.state(find.byType(WeekTab));

      // Verify that a query was made for the first interval
      verify(() => mockStatisticsRepository.queryWeeks(profile.id, 
        from: weekTabState.intervals[0].from,
        to: weekTabState.intervals[0].to,
      )).called(1);

    });

  }); // eof group
} // eof main
