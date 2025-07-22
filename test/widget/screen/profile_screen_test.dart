import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/profile/all.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../test_context_providers.dart';
import '../../mock_definitions.dart';

void main() {

  group('ProfileScreen', () {
    late MockProfileBloc mockProfileBloc;
    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockCacheManagerService mockCacheManagerService;
    late MockCacheManager mockCacheManager;

    setUp(() async {
      mockProfileBloc = MockProfileBloc();
      mockServices = MockServices();
      mockCrashlyticsService = MockCrashlyticsService();
      mockCacheManagerService = MockCacheManagerService();
      mockCacheManager = MockCacheManager();

      when(() => mockCacheManagerService.cacheManager)
        .thenReturn(mockCacheManager);
      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);
      when(() => mockServices.cacheManagerService)
        .thenReturn(mockCacheManagerService);
    });

    testWidgets('can load Profile without constructor argument given', (WidgetTester tester) async {

      when(() => mockProfileBloc.state)
        .thenReturn(ProfileState.loading());

      await tester.pumpWidget(
          Provider<Services>(
              create: (context) => mockServices,
              child: withAllContextProviders(
                  MultiBlocProvider(
                    providers: [
                      BlocProvider<ProfileBloc>(
                        create: (context) => mockProfileBloc,
                      ),
                    ],
                    child: const ProfileScreen(
                      profileId: 'test_profile_id',
                    ),
                  )
              )
          )
      );

      await tester.pump(Duration(milliseconds: 1000));

      verify(() => mockProfileBloc.add(
        ProfileEvent.loadProfile(profileId: 'test_profile_id')
      )).called(1);
    });

    testWidgets('does not load Profile when its given as a parameter in the constructor', (WidgetTester tester) async {

      when(() => mockProfileBloc.state)
        .thenReturn(const ProfileState.initial());

      final Profile profileStub = FakeModelFactory().createProfile();

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: withAllContextProviders(
              MultiBlocProvider(
              providers: [
                BlocProvider<ProfileBloc>(
                  create: (context) => mockProfileBloc,
                ),
              ],
              child: ProfileScreen(
                profileId: 'test_profile_id',
                profile: profileStub,
              ),
            )
          )
        )
      );
      await tester.pump();

      // when profile is given as a parameter
      // it does not load the profile, just stores it in the bloc
      verify(() => mockProfileBloc.add(
        ProfileEvent.loadProfile(
          profileId: 'test_profile_id',
          profile: profileStub,
        )
      ));

    });

    testWidgets('can display a loading state', (WidgetTester tester) async {

      when(() => mockProfileBloc.state)
        .thenReturn(ProfileState.loading());

      await tester.pumpWidget(
          Provider<Services>(
              create: (context) => mockServices,
              child: withAllContextProviders(
                  MultiBlocProvider(
                    providers: [
                      BlocProvider<ProfileBloc>(
                        create: (context) => mockProfileBloc,
                      ),
                    ],
                    child: const ProfileScreen(
                      profileId: 'test_profile_id',
                    ),
                  )
              )
          )
      );
      await tester.pump(Duration(milliseconds: 1000));

      expect(find.byType(AppLoadingDisplay), findsOneWidget);
    });

    testWidgets('can display an error state', (WidgetTester tester) async {

      when(() => mockProfileBloc.state)
        .thenReturn(ProfileState.error());

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: withAllContextProviders(
            MultiBlocProvider(
              providers: [
                BlocProvider<ProfileBloc>(
                  create: (context) => mockProfileBloc,
                ),
              ],
              child: const ProfileScreen(
                profileId: 'test_profile_id',
              ),
            )
          )
        )
      );

      expect(find.byType(AppErrorDisplay), findsOneWidget);
    });

    testWidgets('can display loaded state', (WidgetTester tester) async {

      final Profile profileStub = FakeModelFactory().createProfile();

      when(() => mockProfileBloc.state)
        .thenReturn(ProfileState.loaded(profile: profileStub));

      await tester.runAsync(() async {
        await tester.pumpWidget(
          Provider<Services>(
            create: (context) => mockServices,
            child: withAllContextProviders(
              MultiBlocProvider(
                providers: [
                  BlocProvider<ProfileBloc>(
                    create: (context) => mockProfileBloc,
                  ),
                ],
                child: const ProfileScreen(
                  profileId: 'test_profile_id',
                ),
              )
            )
          )
        );
        await tester.pumpAndSettle();
      }).then((_) async {
        expect(find.byType(ProfileView), findsOneWidget);
      });

    });

  });

}
