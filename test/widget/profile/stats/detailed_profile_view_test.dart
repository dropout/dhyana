import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/util/all.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../mock_definitions.dart';
import '../../../test_context_providers.dart';

void main() {

  group('DetailedProfileView', () {

    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockCacheManagerService mockCacheManagerService;

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

    });

    testWidgets('can show statistics summary data', (WidgetTester tester) async {
      final Profile profile = FakeModelFactory().createProfile().copyWith(
        statsReport: ProfileStatisticsReport(
          milestoneCount: 5,
          completedSessionsCount: 43,
          completedMinutesCount: 1234,
          completedDaysCount: 12,
          firstSessionDate: DateTime.now().subtract(const Duration(days: 30)),
          lastSessionDate: DateTime.now().subtract(const Duration(days: 1)),
          milestoneProgress: MilestoneProgress(
            targetDaysCount: 7,
            completedDaysCount: 5,
          )
        )
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>(create: (context) =>mockServices ),
              ],
              child: DetailedProfileView(
                profile: profile,
              ),
            )
          )
        );
        await tester.pumpAndSettle();
      }).then((_) async {

        expect(find.byType(ProfileImage), findsOneWidget);
        expect(find.text(profile.displayName), findsOneWidget);
        expect(find.byType(LabelValueDetail), findsNWidgets(3));

        final context = tester.element(find.byType(DetailedProfileView));

        expect(find.text(profile.signupDate.toFormattedDateTimeString(context)), findsOneWidget);
        expect(find.text(profile.statsReport.firstSessionDate!.toFormattedDateTimeString(context)), findsOneWidget);
        expect(find.text(profile.statsReport.lastSessionDate!.toFormattedDateTimeString(context)), findsOneWidget);
      });

    });

  }); // eof group
} // eof main
