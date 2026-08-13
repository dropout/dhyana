import 'package:dhyana/core/util/services.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/bar_chart_page/years_bar_chart_page.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/tab/year_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../../../mock_definitions.dart';
import '../../../../../../test_context_providers.dart';

void main() {

  group('YearTab', () {

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

      when(() => mockStatisticsRepository.queryYears(profile.id, from: any(named: 'from'), to: any(named: 'to')))
        .thenAnswer((_) async => FakeModelFactory().createYearStatsBucketList(2));

      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
            ],
            child: YearTab(
              profileId: profile.id,
            ),
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byType(YearsBarChartPage), findsOneWidget);
      final YearTabState yearsTabState = tester.state(find.byType(YearTab));

      // Verify that a query was made for the first interval
      verify(() => mockStatisticsRepository.queryYears(profile.id, 
        from: yearsTabState.intervals[0].from,
        to: yearsTabState.intervals[0].to,
      )).called(1);

    });

  }); // eof group
} // eof main
