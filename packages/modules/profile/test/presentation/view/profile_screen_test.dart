import 'package:core/core.dart';
import 'package:faker/faker.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/presentation/view/profile_view.dart';
import 'package:profile/src/presentation/view/screen/profile_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:provider/provider.dart';


void main() {

  group('ProfileScreen', () {
    late MockProfileStateCubit mockProfileCubit;
    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockResourceResolver mockResourceResolver;

    setUp(() async {
      mockProfileCubit = MockProfileStateCubit();
      mockServices = MockServices();
      mockCrashlyticsService = MockCrashlyticsService();
      mockResourceResolver = MockResourceResolver();

      

      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);
      
      when(() => mockServices.resourceResolver)
        .thenReturn(mockResourceResolver);      
      when(
        () => mockResourceResolver.resolveStoragePath(any()),
      ).thenAnswer((_) async => 'https://example.com/profile.jpg');

    });

    testWidgets('can load Profile without constructor argument given', (WidgetTester tester) async {

      when(() => mockProfileCubit.state)
        .thenReturn(ProfileState.loading());

      await tester.pumpWidget(
          Provider<Services>(
              create: (context) => mockServices,
              child: withAllContextProviders(
                  MultiBlocProvider(
                    providers: [
                      BlocProvider<MockProfileStateCubit>(
                        create: (context) => mockProfileCubit,
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

      verify(() => mockProfileCubit.loadProfile(
        'test_profile_id'
      )).called(1);
    });

    testWidgets('does not load Profile when its given as a parameter in the constructor', (WidgetTester tester) async {

      when(() => mockProfileCubit.state)
        .thenReturn(const ProfileState.initial());

      final Profile profileStub = Faker().createProfile();

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
      verify(() => mockProfileCubit.loadProfile(
        'test_profile_id',
        profile: profileStub,
      )).called(1);
    });

    testWidgets('can display a loading state', (WidgetTester tester) async {

      when(() => mockProfileCubit.state)
        .thenReturn(ProfileState.loading());

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

      when(() => mockProfileCubit.state)
        .thenReturn(ProfileState.error());

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

      final Profile profileStub = Faker().createProfile();

      when(() => mockProfileCubit.state)
        .thenReturn(ProfileState.loaded(
          profile: profileStub,
        ));

      await tester.runAsync(() async {
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
