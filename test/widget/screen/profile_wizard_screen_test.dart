import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/profile/profile_edit_form.dart';
import 'package:dhyana/widget/screen/profile_wizard_screen.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../test_context_providers.dart';

class MockProfileBloc
  extends MockBloc<ProfileEvent, ProfileState>
  implements ProfileBloc {}

class FakeUpdateProfileEvent
    extends Fake
    implements UpdateProfile {}

void main() {
  group('ProfileWizardScreen Tests', () {
    late MockProfileBloc mockProfileBloc;

    setUpAll(() {
      registerFallbackValue(ProfileState.initial());
      registerFallbackValue(FakeUpdateProfileEvent());
    });

    setUp(() {
      mockProfileBloc = MockProfileBloc();
    });

    testWidgets('will load profile on init', (WidgetTester tester) async {
      when(() => mockProfileBloc.state).thenReturn(ProfileState.initial());
      when(() => mockProfileBloc.stream).thenAnswer(
        (_) => Stream<ProfileState>.fromIterable([ProfileState.initial()])
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<ProfileBloc>(
            create: (context) => mockProfileBloc,
            child: ProfileWizardScreen(profileId: 'test_profile_id'),
          ),
        )
      );

      verify(() => mockProfileBloc.add(ProfileEvent.loadProfile(profileId: 'test_profile_id'))).called(1);
    });

    testWidgets('can display a loading state', (WidgetTester tester) async {

      when(() => mockProfileBloc.state).thenReturn(ProfileState.loading());
      when(() => mockProfileBloc.stream).thenAnswer(
        (_) => Stream<ProfileState>.fromIterable([ProfileState.loading()])
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<ProfileBloc>(
            create: (context) => mockProfileBloc,
            child: ProfileWizardScreen(profileId: 'test_profile_id'),
          ),
        )
      );
      expect(find.byType(AppLoadingDisplay), findsOneWidget);
    });

    testWidgets('can display an error state', (WidgetTester tester) async {

      when(() => mockProfileBloc.state).thenReturn(ProfileState.error());
      when(() => mockProfileBloc.stream).thenAnswer(
        (_) => Stream<ProfileState>.fromIterable([ProfileState.error()])
      );

      await tester.pumpWidget(
        withAllContextProviders(
          BlocProvider<ProfileBloc>(
            create: (context) => mockProfileBloc,
            child: ProfileWizardScreen(profileId: 'test_profile_id'),
          ),
        )
      );
      expect(find.byType(AppErrorDisplay), findsOneWidget);
    });

    testWidgets('can display loaded state', (WidgetTester tester) async {

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
              child: ProfileWizardScreen(profileId: 'test_profile_id'),
            ),
          )
        );

        await tester.tap(find.byType(AppButton));
        await tester.pumpAndSettle();

        final result = verify(() => mockProfileBloc.add(
          captureAny(that: isA<UpdateProfile>())
        ));

        UpdateProfile updateProfileEvent = result.captured.first as UpdateProfile;

        expect(updateProfileEvent.profile, equals(profile));
        expect(updateProfileEvent.formData, {
          'firstName': profile.firstName,
          'lastName': profile.lastName,
        });
        expect(updateProfileEvent.completeProfile, isTrue);
        expect(updateProfileEvent.onComplete, isA<Function(Profile)>());
        expect(updateProfileEvent.onError, isA<Function(Object?, StackTrace)>());
      });
    });

  });
}
