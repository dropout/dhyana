import 'package:core/core.dart';
import 'package:faker/faker.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/presentation/view/profile_menu.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:provider/provider.dart';



void main() {

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;

  setUpAll(() async {

    mockServices = MockServices();

    mockCrashlyticsService = MockCrashlyticsService();

    when(() => mockServices.crashlyticsService)
      .thenReturn(mockCrashlyticsService);

  });

  group('ProfileMenu', () {

    testWidgets('will show all the necessary menu items', (WidgetTester tester) async {

      final Profile profile = Faker().createProfile();

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>(create: (context) => mockServices ),
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
        expect(find.byKey(const Key('profile_menu_settings_tile')), findsOneWidget);
        expect(find.byKey(const Key('profile_menu_signout_tile')), findsOneWidget);
      });

    });

  }); // eof group
} // eof main
