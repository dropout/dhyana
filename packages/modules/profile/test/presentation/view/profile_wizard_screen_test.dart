import 'package:core/core.dart';
import 'package:faker/faker.dart';
import 'package:get_it/get_it.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/presentation/view/profile_edit_form.dart';
import 'package:profile/src/presentation/view/screen/profile_wizard_screen.dart';

import 'package:profile/src/presentation/viewmodel/profile_edit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:provider/provider.dart';

import '../../profile_mock_definitions.dart';
import '../../profile_test_helper.dart';

void main() {
  group('ProfileWizardScreen Tests', () {
    late MockProfileEditCubit mockProfileEditCubit;
    late Services mockServices;
    late CrashlyticsService mockCrashlyticsService;
    late HapticsService mockHapticsService;

    setUpAll(() {
      registerFallbackValue(ProfileEditState.initial());
    });

    setUp(() {
      GetIt.I.registerFactory<ProfileEditCubit>(
        () => mockProfileEditCubit,
      );

      mockProfileEditCubit = MockProfileEditCubit();
      mockCrashlyticsService = MockCrashlyticsService();
      mockHapticsService = MockHapticsService();
      mockServices = MockServices();

      when(() => mockServices.crashlyticsService)
          .thenReturn(mockCrashlyticsService);
      when(() => mockServices.hapticsService).thenReturn(mockHapticsService);
    });

    tearDown(() {
      GetIt.I.reset();
    });

    testWidgets('will load profile on init', (WidgetTester tester) async {
      when(() => mockProfileEditCubit.state)
          .thenReturn(ProfileEditState.initial());
      when(() => mockProfileEditCubit.stream).thenAnswer(
        (_) =>
            Stream<ProfileEditState>.fromIterable([ProfileEditState.initial()]),
      );

      await tester.pumpWidget(
        ProfileTestHelper.withLocalizationProvider(
          BlocProvider<ProfileEditCubit>(
            create: (context) => mockProfileEditCubit,
            child: ProfileWizardScreen(profileId: 'test_profile_id'),
          ),
        ),
      );

      verify(() => mockProfileEditCubit.loadProfile('test_profile_id'))
          .called(1);
    });

    testWidgets('can display a loading state', (WidgetTester tester) async {
      when(() => mockProfileEditCubit.state)
          .thenReturn(ProfileEditState.loading());
      when(() => mockProfileEditCubit.stream).thenAnswer(
        (_) =>
            Stream<ProfileEditState>.fromIterable([ProfileEditState.loading()]),
      );

      await tester.pumpWidget(
        ProfileTestHelper.withLocalizationProvider(
          BlocProvider<ProfileEditCubit>(
            create: (context) => mockProfileEditCubit,
            child: ProfileWizardScreen(profileId: 'test_profile_id'),
          ),
        ),
      );
      expect(find.byType(AppLoadingDisplay), findsOneWidget);
    });

    testWidgets('can display an error state', (WidgetTester tester) async {
      when(() => mockProfileEditCubit.state)
          .thenReturn(ProfileEditState.error());
      when(() => mockProfileEditCubit.stream).thenAnswer(
        (_) =>
            Stream<ProfileEditState>.fromIterable([ProfileEditState.error()]),
      );

      await tester.pumpWidget(
        ProfileTestHelper.withLocalizationProvider(
          BlocProvider<ProfileEditCubit>(
            create: (context) => mockProfileEditCubit,
            child: ProfileWizardScreen(profileId: 'test_profile_id'),
          ),
        ),
      );
      expect(find.byType(AppErrorDisplay), findsOneWidget);
    });

    testWidgets('can display loaded state', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final Profile profile = Faker().createProfile();

        when(() => mockProfileEditCubit.state)
            .thenReturn(ProfileEditState.loaded(profile: profile));
        when(() => mockProfileEditCubit.stream).thenAnswer(
          (_) => Stream<ProfileEditState>.fromIterable([
            ProfileEditState.loaded(profile: profile),
          ]),
        );

        await tester.pumpWidget(
          ProfileTestHelper.withLocalizationProvider(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                BlocProvider<ProfileEditCubit>(
                  create: (context) => mockProfileEditCubit,
                ),
              ],
              child: ProfileWizardScreen(profileId: 'test_profile_id'),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ProfileEditForm), findsOneWidget);
        expect(find.byType(AppButton), findsOneWidget);
        expect(find.text('MENTÉS'), findsOneWidget);
      });
    });

    testWidgets('can handle form submission', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final Profile profile = Faker().createProfile();

        when(() => mockProfileEditCubit.state)
            .thenReturn(ProfileEditState.loaded(profile: profile));
        when(() => mockProfileEditCubit.stream).thenAnswer(
          (_) => Stream<ProfileEditState>.fromIterable([
            ProfileEditState.loaded(profile: profile),
          ]),
        );

        await tester.pumpWidget(
          ProfileTestHelper.withLocalizationProvider(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
                BlocProvider<ProfileEditCubit>(
                  create: (context) => mockProfileEditCubit,
                ),
              ],
              child: ProfileWizardScreen(profileId: 'test_profile_id'),
            ),
          ),
        );

        await tester.tap(find.byType(AppButton));
        await tester.pumpAndSettle();

        verify(
          () => mockProfileEditCubit.updateProfile(
            profile: profile,
            formData: any(named: 'formData'),
            onComplete: any(
              named: 'onComplete',
              that: isA<Function(Profile)>(),
            ),
            onError: any(
              named: 'onError',
              that: isA<Function(Object?, StackTrace)>(),
            ),
            completeProfile: true,
          ),
        ).called(1);
      });
    });
  });
}
