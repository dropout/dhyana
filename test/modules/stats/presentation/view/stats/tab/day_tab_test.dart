import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/stats/data/mapper/stats_bucket_mapper.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/bar_chart_page/days_bar_chart_page.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/tab/day_tab.dart';
import 'package:dhyana/modules/stats/presentation/viewmodel/stats_bucket_cubit.dart';


import '../../../../../../mock_definitions.dart';
import '../../../../../../test_context_providers.dart';

void main() {
  group('DaysTab', () {

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

    testWidgets('can be created with its default values', (
      WidgetTester tester,
    ) async {


      when(
        () => mockStatsPublicApi.queryBuckets(
          profileId: 'profileId',
          from: any(named: 'from'),
          to: any(named: 'to'),
          granularity: .days,
        ),
      ).thenAnswer(
        (_) async => FakeModelFactory().createDayStatsBucketEntityList(10).map((e) => e.toApi()).toList(),
      );

      await tester.pumpWidget(
        withAllContextProviders(
          DaysTab(profileId: 'profileId'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DaysBarChartPage), findsOneWidget);
      final DaysTabState daysTabState = tester.state(find.byType(DaysTab));

      
      expect(daysTabState.days.length, 10);
      expect(daysTabState.calculatedStats, isNotNull);

      // Verify that a query was made for the first interval
      verify(
        () => mockStatsPublicApi.queryBuckets(
          profileId: 'profileId',
          from: any(named: 'from'),
          to: any(named: 'to'),
          granularity: .days,
        ),
      ).called(1);
    });
  }); // eof group
} // eof main
