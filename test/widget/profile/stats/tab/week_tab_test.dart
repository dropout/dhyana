import 'package:dhyana/core/di/repositories.dart';
import 'package:dhyana/core/di/services.dart';
import 'package:dhyana/core/domain/model/fake/fake_model_factory.dart';
import 'package:dhyana/modules/insights/domain/model/milestone_progress.dart';
import 'package:dhyana/core/domain/model/profile.dart';
import 'package:dhyana/modules/insights/domain/model/profile_statistics_report.dart';
import 'package:dhyana/modules/insights/domain/model/week_query_options.dart';
import 'package:dhyana/modules/insights/presentation/widget/stats/bar_chart_page/weeks_bar_chart_page.dart';
import 'package:dhyana/modules/insights/presentation/widget/stats/tab/week_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../mock_definitions.dart';
import '../../../../test_context_providers.dart';

void main() {

  group('WeekTab', () {

    late MockServices mockServices;
    late MockRepositories mockRepositories;
    late MockStatisticsRepository mockStatisticsRepository;
    late MockCrashlyticsService mockCrashlyticsService;  

    setUpAll(() {
      registerFallbackValue(WeekQueryOptions(
        from: DateTime.now().subtract(const Duration(days: 7)),
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

      when(() => mockStatisticsRepository.queryWeeks(profile.id, any()))
        .thenAnswer((_) async => FakeModelFactory().createWeeks(4));

      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
              Provider<Repositories>(create: (context) => mockRepositories),
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
      verify(() => mockStatisticsRepository.queryWeeks(profile.id, WeekQueryOptions(
        from: weekTabState.intervals[0].from,
        to: weekTabState.intervals[0].to,
      ))).called(1);

    });

  }); // eof group
} // eof main
