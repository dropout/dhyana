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

  group('WeekTab', () {

    late MockServices mockServices;
    late MockRepositories mockRepositories;
    late MockStatisticsRepository mockStatisticsRepository;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockCacheManagerService mockCacheManagerService;

    setUpAll(() {
      registerFallbackValue(WeekQueryOptions(
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
              profile: profile,
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
