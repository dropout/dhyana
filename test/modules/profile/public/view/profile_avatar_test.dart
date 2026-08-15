import 'package:dhyana/core/service/resource_resolver.dart';
import 'package:dhyana/core/util/services.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../mock_definitions.dart';
import '../../../../test_context_providers.dart';

void main() {

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;
  late ResourceResolver mockResourceResolver;

  setUpAll(() async {
    mockServices = MockServices();
    mockResourceResolver = MockResourceResolver();
    mockCrashlyticsService = MockCrashlyticsService();

    when(() => mockServices.crashlyticsService)
      .thenReturn(mockCrashlyticsService);
    when(() => mockServices.resourceResolver)
      .thenReturn(mockResourceResolver);
    when(
      () => mockResourceResolver.resolveStoragePath(any()),
    ).thenAnswer((_) async => 'https://example.com/profile.jpg');
    
  });

  group('ProfileAvatar', () {

    testWidgets('can be created with its default values', (WidgetTester tester) async {

      final Profile profile = FakeModelFactory().createProfile();

      await tester.runAsync(() async {

        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>(create: (context) =>mockServices ),
              ],
              child: ProfileAvatar(
                profileId: profile.id,
                profileName: profile.displayName,
                profilePhotoBlurhash: profile.photoBlurhash,
              ),
            )
          )
        );
      }).then((_) async {

        final sizedBox = tester.widget<SizedBox>(find.byKey(const Key('profile_avatar_sized_box')));
        expect(sizedBox.width, equals(128.0)); // Default size in constructor parameter
        expect(sizedBox.height, equals(128.0));

        expect(find.byKey(const Key('profile_avatar_name_text')), findsOneWidget);
        expect(find.text(profile.displayName), findsOneWidget);

      });

    });

  }); // eof group
} // eof main
