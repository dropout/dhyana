import 'package:dhyana/core/util/services.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/bar_chart_page/months_bar_chart_page.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/tab/month_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../../../mock_definitions.dart';
import '../../../../../../test_context_providers.dart';

void main() {

  group('MonthTab', () {

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

      when(() => mockStatisticsRepository.queryMonths(profile.id, from: any(named: 'from'), to: any(named: 'to')))
        .thenAnswer((_) async => FakeModelFactory().createMonthStatsBucketEntityList(4));

      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
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
      verify(() => mockStatisticsRepository.queryMonths(profile.id, 
        from: monthTabState.intervals[0].from,
        to: monthTabState.intervals[0].to,
      )).called(1);

    });

  }); // eof group
} // eof main
