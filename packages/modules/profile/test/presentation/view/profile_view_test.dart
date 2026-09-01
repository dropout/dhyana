import 'package:core/core.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/view/profile_image.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:profile/src/presentation/view/profile_footer.dart';
import 'package:profile/src/presentation/view/profile_menu.dart';
import 'package:profile/src/presentation/view/profile_view.dart';


void main() {
  group('ProfileView', () {
    late MockProfileStateCubit mockProfileCubit;
    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockResourceResolver mockResourceResolver;

    // TODO: Try to eliminate the need for this, when CachedNetworkImage is used
    setUpAll(() async {
      // nock.init();

      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    });

    setUp(() async {
      mockProfileCubit = MockProfileStateCubit();
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
    });

    testWidgets('has all the required widgets to display profile info', (
      WidgetTester tester,
    ) async {
      final Profile profile = Faker().createProfile();

      await tester
          .runAsync(() async {
            await tester.pumpWidget(
              Provider<Services>(
                create: (context) => mockServices,
                child: withAllContextProviders(
                  MultiBlocProvider(
                    providers: [
                      BlocProvider<ProfileStateCubit>(
                        create: (context) => mockProfileCubit,
                      ),
                    ],
                    child: SingleChildScrollView(
                      child: ProfileView(profile: profile),
                    ),
                  ),
                ),
              ),
            );
            await tester.pumpAndSettle();
          })
          .then((_) {
            expect(find.byType(ProfileImage), findsOneWidget);
            expect(find.text(profile.displayName), findsOneWidget);
            expect(find.byKey(const Key('milestone_progress_view')), findsOneWidget);
            expect(find.byKey(const Key('consecutive_days_view')), findsOneWidget);
            expect(find.byKey(const Key('milestones_view')), findsOneWidget);
            expect(find.byKey(const Key('summary_view')), findsOneWidget);
            expect(find.byType(ProfileMenu), findsOneWidget);
            expect(find.byType(ProfileFooter), findsOneWidget);
          });
    });
  });
}
