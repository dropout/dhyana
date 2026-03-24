import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/milestone_progress.dart';
import 'package:dhyana/model/month_query_options.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:dhyana/widget/profile/stats/bar_chart_page/months_bar_chart_page.dart';
import 'package:dhyana/widget/profile/stats/tab/month_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../mock_definitions.dart';
import '../../../../test_context_providers.dart';

void main() {

  group('MonthTab', () {

    late MockServices mockServices;
    late MockRepositories mockRepositories;
    late MockStatisticsRepository mockStatisticsRepository;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockCacheManagerService mockCacheManagerService;

    setUpAll(() {
      registerFallbackValue(MonthQueryOptions(
        from: DateTime.now().subtract(const Duration(days: 60)),
        to: DateTime.now(),
      ));
    });

    setUp(() async {

      mockServices = MockServices();

      mockCrashlyticsService = MockCrashlyticsService();
      mockCacheManagerService = MockCacheManagerService();

      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);
      when(() => mockServices.cacheManagerService)
        .thenReturn(mockCacheManagerService);
      when(() => mockCacheManagerService.cacheManager)
        .thenReturn(MockCacheManager());

      mockRepositories = MockRepositories();
      mockStatisticsRepository = MockStatisticsRepository();

      when(() => mockRepositories.statisticsRepository)
        .thenReturn(mockStatisticsRepository);
    });

    testWidgets('can be created with its default values', (WidgetTester tester) async {
      final Profile profile = FakeModelFactory().createProfile().copyWith(
        statsReport: ProfileStatisticsReport(
          milestoneCount: 5,
          milestoneProgress: MilestoneProgress(
            targetDaysCount: 7,
            completedDaysCount: 5,
          )
        )
      );

      when(() => mockStatisticsRepository.queryMonths(profile.id, any()))
        .thenAnswer((_) async => FakeModelFactory().createMonths(4));

      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
              Provider<Repositories>(create: (context) => mockRepositories),
            ],
            child: MonthTab(
              profile: profile,
            ),
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byType(MonthsBarChartPage), findsOneWidget);
      final MonthTabState monthTabState = tester.state(find.byType(MonthTab));

      // Verify that a query was made for the first interval
      verify(() => mockStatisticsRepository.queryMonths(profile.id, MonthQueryOptions(
        from: monthTabState.intervals[0].from,
        to: monthTabState.intervals[0].to,
      ))).called(1);

    });

  }); // eof group
} // eof main
