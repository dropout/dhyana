import 'package:core/core.dart';
import 'package:faker/faker.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/profile.dart';
import 'package:stats/src/data/datasource/faker_stats_extension.dart';

import 'package:stats/src/presentation/viewmodel/stats_bucket_cubit.dart';
import 'package:stats/src/public/api/stats_public_api.dart';

import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:nock/nock.dart';

import 'package:stats/src/presentation/view/profile_stats_view.dart';
import 'package:stats/src/presentation/view/stats/tab/day_tab.dart';
import 'package:stats/src/presentation/view/stats/tab/month_tab.dart';
import 'package:stats/src/presentation/view/stats/tab/week_tab.dart';
import 'package:stats/src/presentation/view/stats/tab/year_tab.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../stats_mock_definitions.dart';


void main() {
  
  TestWidgetsFlutterBinding.ensureInitialized();


  group('ProfileStatsView', () {
    late MockProfileStateCubit mockProfileBloc;
    late StatsPublicApi mockStatsPublicApi;
    late Services mockServices;
    late CrashlyticsService mockCrashlyticsService;
    late ResourceResolver mockResourceResolver;
    
    // Setup disaster for testin widgets with cached network image widget
    setUpAll(() async {
      nock.init();

      // Initialize sqflite_ffi for testing because 
      // app cached network image uses sqflite for caching images
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    });

    setUp(() async {
      mockProfileBloc = MockProfileStateCubit();
      mockStatsPublicApi = MockStatsPublicApi();

      mockServices = MockServices();
      mockCrashlyticsService = MockCrashlyticsService();      
      mockResourceResolver = MockResourceResolver();

      GetIt.I.registerFactory<StatsBucketCubit>(() {
        return StatsBucketCubit(
          statsPublicApi: mockStatsPublicApi,
          crashlyticsService: mockCrashlyticsService,
        );
      });

      when(
        () => mockServices.resourceResolver,
      ).thenReturn(mockResourceResolver);
      when(
        () => mockResourceResolver.resolveStoragePath(any()),
      ).thenAnswer((_) async => 'https://example.com/profile.jpg');
      when(
        () => mockServices.crashlyticsService,
      ).thenReturn(mockCrashlyticsService);

      nock.cleanAll();
      // Mock the MethodChannel for path_provider to return a valid path
      // CachedNetworkImage uses path_provider to get the cache directory, 
      // so we need to mock it for testing
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async => '.',
        );
    });

    tearDown(() async {
      await GetIt.I.reset();

      // Clear the mock handler for the MethodChannel to avoid affecting other tests
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        const MethodChannel('plugins.flutter.io/path_provider'),
        null, // <--- Removes the mock handler
      );
    });

    testWidgets('has all the required widgets to display', (
      WidgetTester tester,
    ) async {
      final Profile profile = Faker().createProfile();

      when(
        () => mockProfileBloc.state,
      ).thenReturn(ProfileState.loaded(profile: profile));

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              MultiProvider(
                providers: [
                  Provider<Services>(create: (_) => mockServices),
                  BlocProvider<ProfileStateCubit>(create: (_) => mockProfileBloc),
                ],
                child: withAllContextProviders(
                  Material(child: ProfileStatsView(profileId: profile.id)),
                ),
              ),
            );
            await tester.pumpAndSettle();
          })
          .then((_) async {
            expect(find.byType(DetailedProfileView), findsOneWidget);
            expect(find.byType(DetailedConsecutiveDaysView), findsOneWidget);
            expect(find.byType(DetailedMilestonesView), findsOneWidget);
            expect(find.byType(DetailedSummaryView), findsOneWidget);

            await tester.dragUntilVisible(
              find.byKey(const Key('profile_stats_tab_bar')),
              find.byKey(const Key('profile_stats_custom_scroll_view')),
              Offset(0, -500),
            );

            final tabBar = tester.widget<TabBar>(
              find.byKey(const Key('profile_stats_tab_bar')),
            );
            expect(tabBar.tabs.length, equals(4));
            expect(find.byType(DaysTab), findsOneWidget);
          });
    });

    testWidgets('shows loading state', (WidgetTester tester) async {
      final Profile profile = Faker().createProfile();

      when(() => mockProfileBloc.state).thenReturn(ProfileLoadingState());

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              MultiProvider(
                providers: [
                  // Provider<Services>(create: (_) => mockServices),
                  BlocProvider<ProfileStateCubit>(create: (_) => mockProfileBloc),
                ],
                child: withAllContextProviders(
                  Material(child: ProfileStatsView(profileId: profile.id)),
                ),
              ),
            );
            await tester.pump();
          })
          .then((_) async {
            expect(find.byType(AppLoadingDisplay), findsOneWidget);
          });
    });

    testWidgets('shows error state', (WidgetTester tester) async {
      final Profile profile = Faker().createProfile();

      when(() => mockProfileBloc.state).thenReturn(ProfileErrorState());

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              MultiProvider(
                providers: [
                  // Provider<Services>(create: (_) => mockServices),
                  BlocProvider<ProfileStateCubit>(create: (_) => mockProfileBloc),
                ],
                child: withAllContextProviders(
                  Material(child: ProfileStatsView(profileId: profile.id)),
                ),
              ),
            );
            await tester.pump();
          })
          .then((_) async {
            expect(find.byType(AppErrorDisplay), findsOneWidget);
          });
    });

    testWidgets('can switch tabs', (WidgetTester tester) async {
      final Profile profile = Faker().createProfile();

      when(
        () => mockProfileBloc.state,
      ).thenReturn(ProfileState.loaded(profile: profile));

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              MultiProvider(
                providers: [
                  Provider<Services>(create: (_) => mockServices),
                  BlocProvider<ProfileStateCubit>(create: (_) => mockProfileBloc),
                ],
                child: withAllContextProviders(
                  Material(child: ProfileStatsView(profileId: profile.id)),
                ),
              ),
            );
            await tester.pumpAndSettle();
          })
          .then((_) async {
            expect(find.byType(DetailedProfileView), findsOneWidget);
            expect(find.byType(DetailedConsecutiveDaysView), findsOneWidget);
            expect(find.byType(DetailedMilestonesView), findsOneWidget);
            expect(find.byType(DetailedSummaryView), findsOneWidget);

            await tester.dragUntilVisible(
              find.byKey(const Key('profile_stats_tab_bar')),
              find.byKey(const Key('profile_stats_custom_scroll_view')),
              Offset(0, -500),
            );

            final tabBar = tester.widget<TabBar>(
              find.byKey(const Key('profile_stats_tab_bar')),
            );
            expect(tabBar.tabs.length, equals(4));
            expect(find.byType(DaysTab), findsOneWidget);

            await tester.tap(
              find.byKey(const Key('profile_stats_view_weeks_tab')),
            );
            await tester.pumpAndSettle();
            expect(find.byType(WeekTab), findsOneWidget);

            await tester.tap(
              find.byKey(const Key('profile_stats_view_months_tab')),
            );
            await tester.pumpAndSettle();
            expect(find.byType(MonthTab), findsOneWidget);

            await tester.tap(
              find.byKey(const Key('profile_stats_view_years_tab')),
            );
            await tester.pumpAndSettle();
            expect(find.byType(YearTab), findsOneWidget);
          });
    });
  }); // eof group
} // eof main
