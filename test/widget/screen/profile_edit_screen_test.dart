import 'package:dhyana/bloc/profile/profile_bloc.dart';
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

class FakeUpdateProfileEvent
  extends Fake
  implements UpdateProfile {}

void main() {
  group('ProfileEditScreen Tests', () {
    late MockProfileBloc mockProfileBloc;

    setUpAll(() {
      registerFallbackValue(ProfileState.initial());
      registerFallbackValue(FakeUpdateProfileEvent());
    });

    setUp(() {
      mockProfileBloc = MockProfileBloc();
    });

    testWidgets('displays loading state', (WidgetTester tester) async {
      when(() => mockProfileBloc.state).thenReturn(ProfileState.loading());
      when(() => mockProfileBloc.stream).thenAnswer(
              (_) => Stream<ProfileState>.fromIterable([ProfileState.loading()])
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<ProfileBloc>(
            create: (context) => mockProfileBloc,
            child: const ProfileEditScreen(),
          ),
        ),
      );
      expect(find.byType(AppLoadingDisplay), findsOneWidget);
    });

    testWidgets('displays error state', (WidgetTester tester) async {
      when(() => mockProfileBloc.state).thenReturn(ProfileState.error());
      when(() => mockProfileBloc.stream).thenAnswer(
              (_) => Stream<ProfileState>.fromIterable([ProfileState.error()])
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<ProfileBloc>(
            create: (context) => mockProfileBloc,
            child: const ProfileEditScreen(),
          ),
        ),
      );
      expect(find.byType(AppErrorDisplay), findsOneWidget);
    });

    testWidgets('displays loaded state', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final Profile profile = FakeModelFactory().createProfile();

        when(() => mockProfileBloc.state).thenReturn(
            ProfileState.loaded(profile: profile)
        );
        when(() => mockProfileBloc.stream).thenAnswer(
                (_) => Stream<ProfileState>.fromIterable([
              ProfileState.loaded(profile: profile)
            ])
        );

        await tester.pumpWidget(
          withAllContextProviders(
            BlocProvider<ProfileBloc>(
              create: (context) => mockProfileBloc,
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

        when(() => mockProfileBloc.state).thenReturn(
            ProfileState.loaded(profile: profile)
        );
        when(() => mockProfileBloc.stream).thenAnswer(
                (_) => Stream<ProfileState>.fromIterable([
              ProfileState.loaded(profile: profile)
            ])
        );

        await tester.pumpWidget(
          withAllContextProviders(
            BlocProvider<ProfileBloc>(
              create: (context) => mockProfileBloc,
              child: const ProfileEditScreen(),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Fill the form fields if needed here

        await tester.tap(find.byType(AppButton));
        await tester.pumpAndSettle();

        final result = verify(() => mockProfileBloc.add(
          captureAny(that: isA<UpdateProfile>())
        ));

        UpdateProfile updateProfileEvent = result.captured.first as UpdateProfile;

        expect(updateProfileEvent.profile, equals(profile));
        expect(updateProfileEvent.formData, contains('firstName'));
        expect(updateProfileEvent.formData, contains('lastName'));
        expect(updateProfileEvent.onComplete, isA<Function(Profile)>());
        expect(updateProfileEvent.onError, isA<Function(Object?, StackTrace)>());
      });

    });

  });

}
