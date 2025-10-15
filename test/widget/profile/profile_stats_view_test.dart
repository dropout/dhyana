import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/profile/all.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/profile/stats/consecutive_days_view.dart';
import 'package:dhyana/widget/profile/stats/detailed_profile_view.dart';
import 'package:dhyana/widget/profile/stats/milestones_view.dart';
import 'package:dhyana/widget/profile/stats/summary_view.dart';
import 'package:dhyana/widget/session/completed/milestone_progress_view.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../test_context_providers.dart';
import '../../mock_definitions.dart';

void main() {

  group('ProfileStatsView', () {
    late MockProfileBloc mockProfileBloc;
    late MockServices mockServices;
    late MockRepositories mockRepositories;
    late MockStatisticsRepository mockStatisticsRepository;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockCacheManagerService mockCacheManagerService;
    late MockCacheManager mockCacheManager;

    setUp(() async {

      // Blocs
      mockProfileBloc = MockProfileBloc();

      // Services
      mockServices = MockServices();
      mockCrashlyticsService = MockCrashlyticsService();
      mockCacheManagerService = MockCacheManagerService();

      mockCacheManager = MockCacheManager();
      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);
      when(() => mockServices.cacheManagerService)
        .thenReturn(mockCacheManagerService);
      when(() => mockCacheManagerService.cacheManager)
          .thenReturn(mockCacheManager);

      // Repositories
      mockRepositories = MockRepositories();
      mockStatisticsRepository = MockStatisticsRepository();

      when(() => mockRepositories.statisticsRepository)
        .thenReturn(mockStatisticsRepository);

    });

    testWidgets('has all the required widgets to display', (WidgetTester tester) async {

      final Profile profile = FakeModelFactory().createProfile();

      when(() => mockProfileBloc.state)
        .thenReturn(ProfileLoadedState(profile: profile));

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              Provider<Services>(create: (_) => mockServices),
              Provider<Repositories>(create: (_) => mockRepositories),
              BlocProvider<ProfileBloc>(create: (_) => mockProfileBloc),
            ],
            child: withAllContextProviders(
              Material(
                child: ProfileStatsView(
                  profileId: profile.id,
                ),
              )
            )
          )
        );
        await tester.pumpAndSettle();
      }).then((_) async {

        expect(find.byType(DetailedProfileView), findsOneWidget);
        expect(find.byType(DetailedConsecutiveDaysView), findsOneWidget);
        expect(find.byType(DetailedMilestonesView), findsOneWidget);
        expect(find.byType(DetailedSummaryView), findsOneWidget);

        await tester.dragUntilVisible(
          find.byKey(const Key('profile_stats_tab_bar')),
          find.byKey(const Key('profile_stats_custom_scroll_view')),
          Offset(0, -500)
        );

        final tabBar = tester.widget<TabBar>(find.byKey(const Key('profile_stats_tab_bar')));
        expect(tabBar.tabs.length, equals(4));
        expect(find.byType(DaysTab), findsOneWidget);

      });
    });

    testWidgets('shows loading state', (WidgetTester tester) async {

      final Profile profile = FakeModelFactory().createProfile();

      when(() => mockProfileBloc.state)
        .thenReturn(ProfileLoadingState());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              Provider<Services>(create: (_) => mockServices),
              Provider<Repositories>(create: (_) => mockRepositories),
              BlocProvider<ProfileBloc>(create: (_) => mockProfileBloc),
            ],
            child: withAllContextProviders(
              Material(
                child: ProfileStatsView(
                  profileId: profile.id,
                ),
              )
            )
          )
        );
        await tester.pump();
      }).then((_) async {
        expect(find.byType(AppLoadingDisplay), findsOneWidget);
      });
    });

    testWidgets('shows error state', (WidgetTester tester) async {

      final Profile profile = FakeModelFactory().createProfile();

      when(() => mockProfileBloc.state)
        .thenReturn(ProfileErrorState());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              Provider<Services>(create: (_) => mockServices),
              Provider<Repositories>(create: (_) => mockRepositories),
              BlocProvider<ProfileBloc>(create: (_) => mockProfileBloc),
            ],
            child: withAllContextProviders(
              Material(
                child: ProfileStatsView(
                  profileId: profile.id,
                ),
              )
            )
          )
        );
        await tester.pump();
      }).then((_) async {
        expect(find.byType(AppErrorDisplay), findsOneWidget);
      });
    });

    testWidgets('can switch tabs', (WidgetTester tester) async {

      final Profile profile = FakeModelFactory().createProfile();

      when(() => mockProfileBloc.state)
        .thenReturn(ProfileLoadedState(profile: profile));

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              Provider<Services>(create: (_) => mockServices),
              Provider<Repositories>(create: (_) => mockRepositories),
              BlocProvider<ProfileBloc>(create: (_) => mockProfileBloc),
            ],
            child: withAllContextProviders(
              Material(
                child: ProfileStatsView(
                  profileId: profile.id,
                ),
              )
            )
          )
        );
        await tester.pumpAndSettle();
      }).then((_) async {

        expect(find.byType(DetailedProfileView), findsOneWidget);
        expect(find.byType(DetailedConsecutiveDaysView), findsOneWidget);
        expect(find.byType(DetailedMilestonesView), findsOneWidget);
        expect(find.byType(DetailedSummaryView), findsOneWidget);

        await tester.dragUntilVisible(
          find.byKey(const Key('profile_stats_tab_bar')),
          find.byKey(const Key('profile_stats_custom_scroll_view')),
          Offset(0, -500)
        );

        final tabBar = tester.widget<TabBar>(find.byKey(const Key('profile_stats_tab_bar')));
        expect(tabBar.tabs.length, equals(4));
        expect(find.byType(DaysTab), findsOneWidget);

        await tester.tap(find.byKey(const Key('profile_stats_view_weeks_tab')));
        await tester.pumpAndSettle();
        expect(find.byType(WeekTab), findsOneWidget);

        await tester.tap(find.byKey(const Key('profile_stats_view_months_tab')));
        await tester.pumpAndSettle();
        expect(find.byType(MonthTab), findsOneWidget);

        await tester.tap(find.byKey(const Key('profile_stats_view_years_tab')));
        await tester.pumpAndSettle();
        expect(find.byType(YearTab), findsOneWidget);
      });
    });

  }); // eof group
} // eof main
