
import 'package:core/core.dart';
import 'package:faker/faker.dart';
import 'package:profile/profile.dart';
import 'package:stats/src/data/datasource/faker_stats_extension.dart';
import 'package:stats/src/presentation/view/stats/detailed_profile_view.dart';
import 'package:stats/src/presentation/view/stats/label_value_detail.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nock/nock.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


void main() {

  group('DetailedProfileView', () {

    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late ResourceResolver mockResourceResolver;

    setUpAll(() async {
      nock.init();

      // Initialize sqflite_ffi for testing because 
      // app cached network image uses sqflite for caching images
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    });

    setUp(() async {
      mockServices = MockServices();
      mockCrashlyticsService = MockCrashlyticsService();
      mockResourceResolver = MockResourceResolver();

      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);

      when(() => mockServices.resourceResolver)
        .thenReturn(mockResourceResolver);
        
      when(
        () => mockResourceResolver.resolveStoragePath(any()),
      ).thenAnswer((_) async => 'https://example.com/profile.jpg');


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
      // Clear the mock handler for the MethodChannel to avoid affecting other tests
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        const MethodChannel('plugins.flutter.io/path_provider'),
        null, // <--- Removes the mock handler
      );
    });

    testWidgets('can show statistics summary data', (WidgetTester tester) async {
      final Profile profile = Faker().createProfile().copyWith(
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
                Provider<Services>(create: (context) => mockServices),
              ],
              child: DetailedProfileView(
                profileId: profile.id,
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
