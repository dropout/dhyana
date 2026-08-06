import 'package:dhyana/core/di/services.dart';
import 'package:dhyana/core/domain/entity/fake/fake_model_factory.dart';
import 'package:dhyana/modules/profile/profile_module.dart';

import 'package:dhyana/core/util/date_time_utils.dart';
import 'package:dhyana/core/presentation/view/profile/profile_image.dart';
import 'package:dhyana/modules/insights/presentation/view/stats/detailed_profile_view.dart';
import 'package:dhyana/modules/insights/presentation/view/stats/label_value_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../mock_definitions.dart';
import '../../../test_context_providers.dart';

void main() {

  group('DetailedProfileView', () {

    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;

    setUp(() async {
      mockServices = MockServices();
      mockCrashlyticsService = MockCrashlyticsService();

      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);

    });

    testWidgets('can show statistics summary data', (WidgetTester tester) async {
      final Profile profile = FakeModelFactory().createProfile().copyWith(
        statsReport: ProfileStatsReport(
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
                profileName: profile.displayName,
                signupDate: profile.signupDate,
                profileStatsReport: profile.statsReport,
                profilePhotoUrl: profile.photoUrl,
                profilePhotoBlurhash: profile.photoBlurhash,
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
