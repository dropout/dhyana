import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/default_profile_data.dart';
import 'package:dhyana/widget/profile/profile_avatar.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/session/completed/progress_summary_item.dart';
import 'package:dhyana/widget/util/app_cached_network_image.dart';
import 'package:flip_board/flip_widget.dart';
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
                profile: profile,
              ),
            )
          )
        );
      }).then((_) async {

        final sizedBox = tester.widget<SizedBox>(find.byKey(const Key('profile_avatar_sized_box')));
        expect(sizedBox.width, equals(DefaultProfileData.defaultProfileImageSize));
        expect(sizedBox.height, equals(DefaultProfileData.defaultProfileImageSize));

        expect(find.byKey(const Key('profile_avatar_name_text')), findsOneWidget);
        expect(find.text(profile.firstName), findsOneWidget);

      });

    });

  }); // eof group
} // eof main
