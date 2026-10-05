import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';

import 'package:core/core.dart';
import 'package:stats/src/data/datasource/faker_stats_extension.dart';
import 'package:stats/src/data/mapper/stats_bucket_mapper.dart';
import 'package:stats/src/presentation/view/stats/bar_chart_page/weeks_bar_chart_page.dart';
import 'package:stats/src/presentation/view/stats/tab/week_tab.dart';
import 'package:stats/src/presentation/viewmodel/stats_bucket_cubit.dart';

import '../../../../stats_mock_definitions.dart';
import '../../../../stats_test_helper.dart';


void main() {

  group('WeekTab', () {
    late MockStatsPublicApi mockStatsPublicApi;
    late MockCrashlyticsService mockCrashlyticsService;  

    setUpAll(() {});

    setUp(() async {
      mockStatsPublicApi = MockStatsPublicApi();
      mockCrashlyticsService = MockCrashlyticsService();
      GetIt.I.registerFactory<StatsBucketCubit>(() {
        return StatsBucketCubit(
          statsPublicApi: mockStatsPublicApi,
          crashlyticsService: mockCrashlyticsService,
        );
      });
    });

    tearDown(() async {
      await GetIt.I.reset();
    });

    testWidgets('can be created with its default values', (WidgetTester tester) async {


      when(
        () => mockStatsPublicApi.queryBuckets(
          profileId: 'profileId', 
          from: any(named: 'from'), 
          to: any(named: 'to'),
          granularity: .weeks,
        ),
      ).thenAnswer(
        (_) async => Faker().createWeekStatsBucketEntityList(4).map((e) => e.toApi()).toList()
      );

      await tester.pumpWidget(
        StatsTestHelper.withLocalizationProvider(
          WeekTab(
            profileId: 'profileId',
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byType(WeeksBarChartPage), findsOneWidget);
      final WeekTabState weekTabState = tester.state(find.byType(WeekTab));

      expect(weekTabState.weeks.length, 4);
      expect(weekTabState.calculatedStats, isNotNull);

      // Verify that a query was made for the first interval
      verify(() => mockStatsPublicApi.queryBuckets(
        profileId: 'profileId',
        from: weekTabState.intervals[0].from,
        to: weekTabState.intervals[0].to,
        granularity: .weeks,
      )).called(1);

    });

  }); // eof group
} // eof main
