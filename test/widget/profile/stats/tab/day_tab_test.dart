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

  group('DaysTab', () {

    late MockServices mockServices;
    late MockRepositories mockRepositories;
    late MockStatisticsRepository mockStatisticsRepository;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockCacheManagerService mockCacheManagerService;

    setUpAll(() {
      registerFallbackValue(DayQueryOptions(
        from: DateTime.now().subtract(const Duration(days: 7)),
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

      when(() => mockStatisticsRepository.queryDays(profile.id, any()))
        .thenAnswer((_) async => FakeModelFactory().createDays(10));

      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices),
              Provider<Repositories>(create: (context) => mockRepositories),
            ],
            child: DaysTab(
              profile: profile,
            ),
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byType(DaysBarChartPage), findsOneWidget);
      final DaysTabState daysTabState = tester.state(find.byType(DaysTab));

      // Verify that a query was made for the first interval
      verify(() => mockStatisticsRepository.queryDays(profile.id, DayQueryOptions(
        from: daysTabState.intervals[0].from,
        to: daysTabState.intervals[0].to,
      ))).called(1);

    });

  }); // eof group
} // eof main
