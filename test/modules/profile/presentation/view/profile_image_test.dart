import 'package:dhyana/core/util/services.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';

import 'package:dhyana/core/presentation/view/util/app_cached_network_image.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../mock_definitions.dart';
import '../../../../test_context_providers.dart';

void main() {
  final Profile testProfile = FakeModelFactory().createProfile();

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;

  setUpAll(() async {
    mockServices = MockServices();
    mockCrashlyticsService = MockCrashlyticsService();
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
