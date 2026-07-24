import 'package:dhyana/core/di/repositories.dart';
import 'package:dhyana/core/di/services.dart';
import 'package:dhyana/core/domain/model/fake/fake_model_factory.dart';
import 'package:dhyana/modules/insights/domain/model/milestone_progress.dart';
import 'package:dhyana/modules/insights/domain/model/month_query_options.dart';
import 'package:dhyana/core/domain/model/profile.dart';
import 'package:dhyana/modules/insights/domain/model/profile_statistics_report.dart';
import 'package:dhyana/modules/insights/presentation/widget/stats/bar_chart_page/months_bar_chart_page.dart';
import 'package:dhyana/modules/insights/presentation/widget/stats/tab/month_tab.dart';
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

    setUpAll(() {
      registerFallbackValue(MonthQueryOptions(
        from: DateTime.now().subtract(const Duration(days: 60)),
        to: DateTime.now(),
      ));
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
              profileId: profile.id,
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
