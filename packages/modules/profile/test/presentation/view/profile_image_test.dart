import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';

import 'package:core/core.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/view/profile_image.dart';
import 'package:provider/provider.dart';



void main() {
  final Profile testProfile = Faker().createProfile();

  late MockServices mockServices;
  late MockResourceResolver mockResourceResolver;
  late MockCrashlyticsService mockCrashlyticsService;

  setUpAll(() async {
    mockServices = MockServices();
    mockCrashlyticsService = MockCrashlyticsService();
    mockResourceResolver = MockResourceResolver();

    when(
      () => mockServices.crashlyticsService,
    ).thenReturn(mockCrashlyticsService);

    when(
      () => mockServices.resourceResolver,
    ).thenReturn(mockResourceResolver);

    when(
      () => mockResourceResolver.resolveStoragePath(any()),
    ).thenAnswer((_) async => 'https://example.com/profile.jpg');

    when(
      () => mockServices.crashlyticsService,
    ).thenReturn(mockCrashlyticsService);
  });

  group('ProfileImage', () {
    testWidgets('can be created with its default values', (
      WidgetTester tester,
    ) async {
      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              withAllContextProviders(
                MultiProvider(
                  providers: [
                    Provider<Services>(create: (context) => mockServices),
                  ],
                  child: ProfileImage(
                    profileId: testProfile.id,
                    profileName: testProfile.displayName,
                    profilePhotoBlurhash: testProfile.photoBlurhash,
                    size: 32.0,
                  ),
                ),
              ),
            );
          })
          .then((_) async {
            final sizedBox = tester.widget<SizedBox>(
              find.byKey(const Key('profile_image_sized_box')),
            );
            expect(sizedBox.width, equals(32.0));
            expect(sizedBox.height, equals(32.0));

            expect(find.byType(AppCachedNetworkImage), findsOneWidget);
          });
    });
  }); // eof group
} // eof main
