import 'package:dhyana/core/domain/entity/fake/fake_model_factory.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/modules/profile/presentation/view/profile_edit_form.dart';
import 'package:dhyana/modules/profile/presentation/view/screen/profile_wizard_screen.dart';
import 'package:dhyana/core/presentation/view/util/app_button.dart';
import 'package:dhyana/core/presentation/view/util/app_error_display.dart';
import 'package:dhyana/core/presentation/view/util/app_loading_display.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/profile_edit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../test_context_providers.dart';
import '../../../../mock_definitions.dart';

void main() {
  group('ProfileWizardScreen Tests', () {
    late MockProfileEditCubit mockProfileEditCubit;

    setUpAll(() {
      registerFallbackValue(ProfileEditState.initial());
    });

    setUp(() {
      mockProfileEditCubit = MockProfileEditCubit();
    });

    testWidgets('will load profile on init', (WidgetTester tester) async {
      when(() => mockProfileEditCubit.state).thenReturn(ProfileEditState.initial());
      when(() => mockProfileEditCubit.stream).thenAnswer(
        (_) => Stream<ProfileEditState>.fromIterable([ProfileEditState.initial()])
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<ProfileEditCubit>(
            create: (context) => mockProfileEditCubit,
            child: ProfileWizardScreen(profileId: 'test_profile_id'),
          ),
        )
      );

      verify(() => mockProfileEditCubit
        .loadProfile('test_profile_id')).called(1);
    });

    testWidgets('can display a loading state', (WidgetTester tester) async {

      when(() => mockProfileEditCubit.state).thenReturn(ProfileEditState.loading());
      when(() => mockProfileEditCubit.stream).thenAnswer(
        (_) => Stream<ProfileEditState>.fromIterable([ProfileEditState.loading()])
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<ProfileEditCubit>(
            create: (context) => mockProfileEditCubit,
            child: ProfileWizardScreen(profileId: 'test_profile_id'),
          ),
        )
      );
      expect(find.byType(AppLoadingDisplay), findsOneWidget);
    });

    testWidgets('can display an error state', (WidgetTester tester) async {

      when(() => mockProfileEditCubit.state).thenReturn(ProfileEditState.error());
      when(() => mockProfileEditCubit.stream).thenAnswer(
        (_) => Stream<ProfileEditState>.fromIterable([ProfileEditState.error()])
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<ProfileEditCubit>(
            create: (context) => mockProfileEditCubit,
            child: ProfileWizardScreen(profileId: 'test_profile_id'),
          ),
        )
      );
      expect(find.byType(AppErrorDisplay), findsOneWidget);
    });

    testWidgets('can display loaded state', (WidgetTester tester) async {

      await mockNetworkImages(() async {

        final Profile profile = FakeModelFactory().createProfile();

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
            BlocProvider<ProfileEditCubit>(
              create: (context) => mockProfileEditCubit,
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
        final Profile profile = FakeModelFactory().createProfile();

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
            BlocProvider<ProfileEditCubit>(
              create: (context) => mockProfileEditCubit,
              child: ProfileWizardScreen(profileId: 'test_profile_id'),
            ),
          )
        );

        await tester.tap(find.byType(AppButton));
        await tester.pumpAndSettle();

        verify(() => mockProfileEditCubit.updateProfile(
          profile: profile,
          formData: any(named: 'formData'),          
          onComplete: any(named: 'onComplete', that: isA<Function(Profile)>()),
          onError: any(named: 'onError', that: isA<Function(Object?, StackTrace)>()),          
          completeProfile: true,
        )).called(1);

      });
    });

  });
}
