import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:provider/provider.dart';

import 'package:core/core.dart';
import 'package:profile/src/presentation/view/profile_edit_form.dart';
import 'package:profile/src/presentation/view/screen/profile_edit_screen.dart';
import 'package:profile/src/presentation/viewmodel/profile_edit_cubit.dart';

import '../../profile_mock_definitions.dart';


void main() {
  group('ProfileEditScreen Tests', () {
    late MockProfileEditCubit mockProfileEditCubit;
    late Services mockServices;
    late CrashlyticsService mockCrashlyticsService;
    late HapticsService mockHapticsService;

    setUpAll(() {
      registerFallbackValue(ProfileEditState.initial());
    });

    setUp(() {
      mockProfileEditCubit = MockProfileEditCubit();
      mockCrashlyticsService = MockCrashlyticsService();
      mockHapticsService = MockHapticsService();
      mockServices = MockServices();

      when(() => mockServices.crashlyticsService)
          .thenReturn(mockCrashlyticsService);
      when(() => mockServices.hapticsService)
          .thenReturn(mockHapticsService);
    });

    testWidgets('displays loading state', (WidgetTester tester) async {
      when(() => mockProfileEditCubit.state).thenReturn(ProfileEditState.loading());
      when(() => mockProfileEditCubit.stream).thenAnswer(
              (_) => Stream<ProfileEditState>.fromIterable([ProfileEditState.loading()])
      );

      await tester.pumpWidget(
        withAllContextProviders(  
          BlocProvider<ProfileEditCubit>(
            create: (context) => mockProfileEditCubit,
            child: const ProfileEditScreen(profileId: 'profileId'),
          ),
        ),
      );
      expect(find.byType(AppLoadingDisplay), findsOneWidget);
    });

    testWidgets('displays error state', (WidgetTester tester) async {
      when(() => mockProfileEditCubit.state).thenReturn(ProfileEditState.error());
      when(() => mockProfileEditCubit.stream).thenAnswer(
              (_) => Stream<ProfileEditState>.fromIterable([ProfileEditState.error()])
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<ProfileEditCubit>(
            create: (context) => mockProfileEditCubit,
            child: const ProfileEditScreen(profileId: 'profileId'),
          ),
        ),
      );
      expect(find.byType(AppErrorDisplay), findsOneWidget);
    });

    testWidgets('displays loaded state', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final Profile profile = Faker().createProfile();

        when(() => mockProfileEditCubit.state).thenReturn(
            ProfileEditState.loaded(profile: profile)
        );
        when(() => mockProfileEditCubit.stream).thenAnswer(
                (_) => Stream<ProfileEditState>.fromIterable([
              ProfileEditState.loaded(profile: profile)
            ])
        );

        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                BlocProvider<ProfileEditCubit>(
                  create: (context) => mockProfileEditCubit,                  
                ),
              ],
              child: const ProfileEditScreen(profileId: 'profileId'),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ProfileEditForm), findsOneWidget);
        expect(find.byType(AppButton), findsOneWidget);
      });
    });

    testWidgets('handles form submission', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final Profile profile = Faker().createProfile();

        when(() => mockProfileEditCubit.state).thenReturn(
            ProfileEditState.loaded(profile: profile)
        );
        when(() => mockProfileEditCubit.stream).thenAnswer(
                (_) => Stream<ProfileEditState>.fromIterable([
              ProfileEditState.loaded(profile: profile)
            ])
        );

        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                BlocProvider<ProfileEditCubit>(
                  create: (context) => mockProfileEditCubit,                  
                ),                
              ],
              child: const ProfileEditScreen(profileId: 'profileId'),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Fill the form fields if needed here

        await tester.tap(find.byType(AppButton));
        await tester.pumpAndSettle();

        verify(() => mockProfileEditCubit.updateProfile(
          profile: profile,
          formData: any(named: 'formData', that: isA<Map<String, dynamic>>()),
          onComplete: any(named: 'onComplete', that: isA<Function(Profile)>()),
          onError: any(named: 'onError', that: isA<Function(Object?, StackTrace)>()),
        )).called(1);
      });

    });

  });

}
