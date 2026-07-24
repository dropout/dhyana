import 'package:dhyana/core/di/services.dart';
import 'package:dhyana/core/domain/model/fake/fake_model_factory.dart';
import 'package:dhyana/core/domain/model/profile.dart';
import 'package:dhyana/util/default_profile_data.dart';
import 'package:dhyana/core/presentation/widget/profile/profile_avatar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../mock_definitions.dart';
import '../../test_context_providers.dart';

void main() {

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;

  setUpAll(() async {

    mockServices = MockServices();

    mockCrashlyticsService = MockCrashlyticsService();

    when(() => mockServices.crashlyticsService)
      .thenReturn(mockCrashlyticsService);

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
