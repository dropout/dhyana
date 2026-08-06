import 'package:dhyana/core/domain/entity/fake/fake_model_factory.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/modules/profile/presentation/view/profile_edit_form.dart';
import 'package:dhyana/modules/profile/presentation/view/screen/profile_edit_screen.dart';
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
  group('ProfileEditScreen Tests', () {
    late MockProfileEditCubit mockProfileEditCubit;

    setUpAll(() {
      registerFallbackValue(ProfileEditState.initial());
    });

    setUp(() {
      mockProfileEditCubit = MockProfileEditCubit();
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
            child: const ProfileEditScreen(),
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
            child: const ProfileEditScreen(),
          ),
        ),
      );
      expect(find.byType(AppErrorDisplay), findsOneWidget);
    });

    testWidgets('displays loaded state', (WidgetTester tester) async {
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
              child: const ProfileEditScreen(),
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
              child: const ProfileEditScreen(),
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
