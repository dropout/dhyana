import 'package:dhyana/core/di/repositories.dart';
import 'package:dhyana/core/di/services.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/modules/insights/presentation/view/stats/bar_chart_page/days_bar_chart_page.dart';
import 'package:dhyana/modules/insights/presentation/view/stats/tab/day_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../mock_definitions.dart';
import '../../../../test_context_providers.dart';

void main() {

  group('DaysTab', () {

    late MockServices mockServices;
    late MockRepositories mockRepositories;
    late MockStatisticsRepository mockStatisticsRepository;
    late MockCrashlyticsService mockCrashlyticsService;

    setUpAll(() {

    });

    setUp(() async {
      mockServices = MockServices();
      mockCrashlyticsService = MockCrashlyticsService();

      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);

      mockRepositories = MockRepositories();
      mockStatisticsRepository = MockStatisticsRepository();


      when(() => mockRepositories.statisticsRepository)
        .thenReturn(mockStatisticsRepository);

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

      when(() => mockStatisticsRepository.queryDays(profile.id, from: any(named: 'from'), to: any(named: 'to')))
        .thenAnswer((_) async => FakeModelFactory().createDays(10));

      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
              Provider<Repositories>(create: (context) => mockRepositories),
            ],
            child: DaysTab(
              profileId: profile.id,
            ),
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byType(DaysBarChartPage), findsOneWidget);
      final DaysTabState daysTabState = tester.state(find.byType(DaysTab));

      // Verify that a query was made for the first interval
      verify(() => mockStatisticsRepository.queryDays(profile.id, 
        from: daysTabState.intervals[0].from, 
        to: daysTabState.intervals[0].to)
      ).called(1);

    });

  }); // eof group
} // eof main
