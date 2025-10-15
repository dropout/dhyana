import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../mock_definitions.dart';
import '../../../../test_context_providers.dart';

void main() {

  group('YearTab', () {

    late MockServices mockServices;
    late MockRepositories mockRepositories;
    late MockStatisticsRepository mockStatisticsRepository;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockCacheManagerService mockCacheManagerService;

    setUpAll(() {
      registerFallbackValue(YearQueryOptions(
        from: DateTime.now().subtract(const Duration(days: 365*2)),
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

      when(() => mockStatisticsRepository.queryYears(profile.id, any()))
        .thenAnswer((_) async => FakeModelFactory().createYears(2));

      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
              Provider<Repositories>(create: (context) => mockRepositories),
            ],
            child: YearTab(
              profile: profile,
            ),
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byType(YearsBarChartPage), findsOneWidget);
      final YearTabState yearsTabState = tester.state(find.byType(YearTab));

      // Verify that a query was made for the first interval
      verify(() => mockStatisticsRepository.queryYears(profile.id, YearQueryOptions(
        from: yearsTabState.intervals[0].from,
        to: yearsTabState.intervals[0].to,
      ))).called(1);

    });

  }); // eof group
} // eof main
