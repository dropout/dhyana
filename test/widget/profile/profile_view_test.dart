import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/profile/all.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/profile/stats/consecutive_days_view.dart';
import 'package:dhyana/widget/profile/stats/milestones_view.dart';
import 'package:dhyana/widget/profile/stats/summary_view.dart';
import 'package:dhyana/widget/timer/completed/milestone_progress_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../test_context_providers.dart';
import '../../mock_definitions.dart';

void main() {

  group('ProfileView', () {
    late MockProfileBloc mockProfileBloc;
    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockCacheManagerService mockCacheManagerService;
    late MockCacheManager mockCacheManager;

    setUp(() async {
      mockProfileBloc = MockProfileBloc();
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
    });

    testWidgets('has all the required widgets to display profile info ', (WidgetTester tester) async {

      final Profile profile = FakeModelFactory().createProfile();

      await tester.runAsync(() async {
        await tester.pumpWidget(
            Provider<Services>(
                create: (context) => mockServices,
                child: withAllContextProviders(
                    MultiBlocProvider(
                      providers: [
                        BlocProvider<ProfileBloc>(
                          create: (context) => mockProfileBloc,
                        ),
                      ],
                      child: SingleChildScrollView(
                        child: ProfileView(
                          profile: profile,
                        ),
                      ),
                    )
                )
            )
        );
        await tester.pumpAndSettle();
      }).then((_) {
        expect(find.byType(ProfileImage), findsOneWidget);
        expect(find.text(profile.displayName), findsOneWidget);
        expect(find.byType(MilestoneProgressView), findsOneWidget);
        expect(find.byType(ConsecutiveDaysView), findsOneWidget);
        expect(find.byType(MilestonesView), findsOneWidget);
        expect(find.byType(SummaryView), findsOneWidget);
        expect(find.byType(ProfileMenu), findsOneWidget);
        expect(find.byType(ProfileFooter), findsOneWidget);
      });
    });

  });

}
