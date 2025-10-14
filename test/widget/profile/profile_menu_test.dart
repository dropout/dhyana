import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/profile/profile_menu.dart';
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

  group('ProfileMenu', () {

    testWidgets('will show all the necessary menu items', (WidgetTester tester) async {

      final Profile profile = FakeModelFactory().createProfile();

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>(create: (context) =>mockServices ),
              ],
              child: ProfileMenu(
                profile: profile,
              ),
            )
          )
        );
      }).then((_) async {
        expect(find.byKey(const Key('profile_menu_edit_profile_tile')), findsOneWidget);
        expect(find.byKey(const Key('profile_menu_session_history_tile')), findsOneWidget);
        expect(find.byKey(const Key('profile_menu_statistics_tile')), findsOneWidget);
        expect(find.byKey(const Key('profile_menu_donate_tile')), findsOneWidget);
        expect(find.byKey(const Key('profile_menu_delete_profile_tile')), findsOneWidget);
        expect(find.byKey(const Key('profile_menu_signout_tile')), findsOneWidget);
      });



    });

  }); // eof group
} // eof main
