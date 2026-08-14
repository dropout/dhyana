import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/stats/data/mapper/stats_bucket_mapper.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/bar_chart_page/weeks_bar_chart_page.dart';
import 'package:dhyana/modules/stats/presentation/view/stats/tab/week_tab.dart';
import 'package:dhyana/modules/stats/presentation/viewmodel/stats_bucket_cubit.dart';

import '../../../../../../mock_definitions.dart';
import '../../../../../../test_context_providers.dart';

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
        (_) async => FakeModelFactory().createWeekStatsBucketEntityList(4).map((e) => e.toApi()).toList()
      );

      await tester.pumpWidget(
        withAllContextProviders(
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
