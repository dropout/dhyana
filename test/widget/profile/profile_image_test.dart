import 'package:dhyana/init/services.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/util/app_cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../mock_definitions.dart';
import '../../test_context_providers.dart';

void main() {

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;
  late MockCacheManagerService mockCacheManagerService;

  setUpAll(() async {

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

  group('ProfileImage', () {

    testWidgets('can be created with its default values', (WidgetTester tester) async {

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>(create: (context) =>mockServices ),
              ],
              child:const ProfileImage(
                photoUrl: 'https://example.com/photo.jpg',
                photoBlurhash: 'LKO2?U%2Tw=w]~RBVZRi};RPxuwH',
              ),
            )
          )
        );
      }).then((_) async {

        final sizedBox = tester.widget<SizedBox>(find.byKey(const Key('profile_image_sized_box')));
        expect(sizedBox.width, equals(ProfileImage.defaultSize));
        expect(sizedBox.height, equals(ProfileImage.defaultSize));

        expect(find.byType(AppCachedNetworkImage), findsOneWidget);

      });



    });

  }); // eof group
} // eof main
