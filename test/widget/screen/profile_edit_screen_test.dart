import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/profile/profile_edit_form.dart';
import 'package:dhyana/widget/screen/profile_edit_screen.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../test_context_providers.dart';
import '../../mock_definitions.dart';

void main() {
  group('ProfileEditScreen Tests', () {
    late MockProfileCubit mockProfileCubit;

    setUpAll(() {
      registerFallbackValue(ProfileState.initial());
    });

    setUp(() {
      mockProfileCubit = MockProfileCubit();
    });

    testWidgets('displays loading state', (WidgetTester tester) async {
      when(() => mockProfileCubit.state).thenReturn(ProfileState.loading());
      when(() => mockProfileCubit.stream).thenAnswer(
              (_) => Stream<ProfileState>.fromIterable([ProfileState.loading()])
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<ProfileCubit>(
            create: (context) => mockProfileCubit,
            child: const ProfileEditScreen(),
          ),
        ),
      );
      expect(find.byType(AppLoadingDisplay), findsOneWidget);
    });

    testWidgets('displays error state', (WidgetTester tester) async {
      when(() => mockProfileCubit.state).thenReturn(ProfileState.error());
      when(() => mockProfileCubit.stream).thenAnswer(
              (_) => Stream<ProfileState>.fromIterable([ProfileState.error()])
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<ProfileCubit>(
            create: (context) => mockProfileCubit,
            child: const ProfileEditScreen(),
          ),
        ),
      );
      expect(find.byType(AppErrorDisplay), findsOneWidget);
    });

    testWidgets('displays loaded state', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final Profile profile = FakeModelFactory().createProfile();

        when(() => mockProfileCubit.state).thenReturn(
            ProfileState.loaded(profile: profile)
        );
        when(() => mockProfileCubit.stream).thenAnswer(
                (_) => Stream<ProfileState>.fromIterable([
              ProfileState.loaded(profile: profile)
            ])
        );

        await tester.pumpWidget(
          withAllContextProviders(
            BlocProvider<ProfileCubit>(
              create: (context) => mockProfileCubit,
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

        when(() => mockProfileCubit.state).thenReturn(
            ProfileState.loaded(profile: profile)
        );
        when(() => mockProfileCubit.stream).thenAnswer(
                (_) => Stream<ProfileState>.fromIterable([
              ProfileState.loaded(profile: profile)
            ])
        );

        await tester.pumpWidget(
          withAllContextProviders(
            BlocProvider<ProfileCubit>(
              create: (context) => mockProfileCubit,
              child: const ProfileEditScreen(),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Fill the form fields if needed here

        await tester.tap(find.byType(AppButton));
        await tester.pumpAndSettle();

        verify(() => mockProfileCubit.updateProfile(
          profile: profile,
          formData: any(named: 'formData', that: isA<Map<String, dynamic>>()),
          onComplete: any(named: 'onComplete', that: isA<Function(Profile)>()),
          onError: any(named: 'onError', that: isA<Function(Object?, StackTrace)>()),
        )).called(1);
      });

    });

  });

}
