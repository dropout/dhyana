import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';
import 'package:stats/src/data/datasource/faker_stats_extension.dart';

import 'package:stats/src/data/mapper/stats_bucket_mapper.dart';
import 'package:stats/src/presentation/view/stats/bar_chart_page/years_bar_chart_page.dart';
import 'package:stats/src/presentation/view/stats/tab/year_tab.dart';
import 'package:stats/src/presentation/viewmodel/stats_bucket_cubit.dart';

import '../../../../stats_mock_definitions.dart';



void main() {

  group('YearTab', () {

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

      when(() => mockStatsPublicApi.queryBuckets(
        profileId: 'profileId', 
        from: any(named: 'from'), 
        to: any(named: 'to'),
        granularity: .years,
      )).thenAnswer((_) async => Faker().createYearStatsBucketEntityList(2).map((e) => e.toApi()).toList());

      await tester.pumpWidget(
        withAllContextProviders(
          YearTab(
            profileId: 'profileId',
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byType(YearsBarChartPage), findsOneWidget);
      final YearTabState yearsTabState = tester.state(find.byType(YearTab));

      expect(yearsTabState.years.length, 2);
      expect(yearsTabState.calculatedStats, isNotNull);

      // Verify that a query was made for the first interval
      verify(() => mockStatsPublicApi.queryBuckets(
        profileId: 'profileId',
        from: yearsTabState.intervals[0].from,
        to: yearsTabState.intervals[0].to,
        granularity: .years,
      )).called(1);

    });

  }); // eof group
} // eof main
