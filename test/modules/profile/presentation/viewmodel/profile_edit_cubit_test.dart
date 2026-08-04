import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/core/domain/entity/fake/fake_model_factory.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/profile_edit_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_definitions.dart';

void main() {
  late MockLoadProfileUseCase loadProfileUseCase;
  late MockUpdateProfileUseCase updateProfileUseCase;
  late MockUpdateProfileSettingsUseCase updateProfileSettingsUseCase;
  late MockCrashlyticsService crashlyticsService;
  late FakeModelFactory fakeModelFactory;

  ProfileEditCubit buildCubit() {
    return ProfileEditCubit(
      loadProfileUseCase: loadProfileUseCase,
      updateProfileUseCase: updateProfileUseCase,
      updateProfileSettingsUseCase: updateProfileSettingsUseCase,
      crashlyticsService: crashlyticsService,
    );
  }

  setUp(() {
    loadProfileUseCase = MockLoadProfileUseCase();
    updateProfileUseCase = MockUpdateProfileUseCase();
    updateProfileSettingsUseCase = MockUpdateProfileSettingsUseCase();
    crashlyticsService = MockCrashlyticsService();
    fakeModelFactory = FakeModelFactory();

    when(
      () => crashlyticsService.recordError(
        exception: any(named: 'exception'),
        stackTrace: any(named: 'stackTrace'),
        reason: any(named: 'reason'),
      ),
    ).thenReturn(null);
  });

  group('ProfileEditCubit.loadProfile', () {
    blocTest<ProfileEditCubit, ProfileEditState>(
      'emits loading then loaded, and calls onComplete on success',
      build: buildCubit,
      act: (cubit) async {
        final profile = fakeModelFactory.createProfile();
        when(() => loadProfileUseCase.execute(profile.id))
            .thenAnswer((_) async => profile);

        final callbackCompleter = Completer<Profile>();

        cubit.loadProfile(
          profile.id,
          onComplete: (result) {
            callbackCompleter.complete(result);
          },
        );

        final callbackProfile = await callbackCompleter.future;
        expect(callbackProfile, equals(profile));
      },
      expect: () => [
        const ProfileEditState.loading(),
        isA<ProfileEditLoadedState>(),
      ],
      verify: (cubit) {
        final loadedState = cubit.state as ProfileEditLoadedState;
        verify(() => loadProfileUseCase.execute(loadedState.profile.id)).called(1);
        verifyNever(
          () => crashlyticsService.recordError(
            exception: any(named: 'exception'),
            stackTrace: any(named: 'stackTrace'),
            reason: any(named: 'reason'),
          ),
        );
      },
    );

    blocTest<ProfileEditCubit, ProfileEditState>(
      'emits error, calls crashlytics and onError on failure',
      build: buildCubit,
      act: (cubit) async {
        final profileId = 'profile-1';
        final exception = Exception('load failed');
        final stackTrace = StackTrace.current;

        when(() => loadProfileUseCase.execute(profileId))
            .thenAnswer((_) => Future<Profile>.error(exception, stackTrace));

        final callbackCompleter = Completer<(Object?, StackTrace)>();

        cubit.loadProfile(
          profileId,
          onError: (error, stack) {
            callbackCompleter.complete((error, stack));
          },
        );

        final callbackData = await callbackCompleter.future;
        expect(callbackData.$1, same(exception));
        expect(callbackData.$2, same(stackTrace));
      },
      expect: () => [
        const ProfileEditState.loading(),
        const ProfileEditState.error(),
      ],
      verify: (_) {
        verify(
          () => crashlyticsService.recordError(
            exception: any(named: 'exception'),
            stackTrace: any(named: 'stackTrace'),
            reason: 'Unable to load profile: profile-1',
          ),
        ).called(1);
      },
    );
  });

  group('ProfileEditCubit.updateProfile', () {
    late String updatedProfileId;

    blocTest<ProfileEditCubit, ProfileEditState>(
      'emits loaded and calls onComplete on success',
      build: buildCubit,
      act: (cubit) async {
        final profile = fakeModelFactory.createProfile();
        final updatedProfile = profile.copyWith(firstName: 'Updated');
        const formData = <String, dynamic>{'firstName': 'Updated'};

        when(
          () => updateProfileUseCase.execute(
            profile: profile,
            updatedFields: formData,
            completeProfile: false,
          ),
        ).thenAnswer((_) async => updatedProfile);

        final callbackCompleter = Completer<Profile>();

        cubit.updateProfile(
          profile: profile,
          formData: formData,
          onComplete: (result) {
            callbackCompleter.complete(result);
          },
        );

        final callbackProfile = await callbackCompleter.future;
        expect(callbackProfile, equals(updatedProfile));
      },
      expect: () => [
        isA<ProfileEditLoadedState>(),
      ],
      verify: (_) {
        verifyNever(
          () => crashlyticsService.recordError(
            exception: any(named: 'exception'),
            stackTrace: any(named: 'stackTrace'),
            reason: any(named: 'reason'),
          ),
        );
      },
    );

    blocTest<ProfileEditCubit, ProfileEditState>(
      'calls crashlytics and onError on failure',
      build: buildCubit,
      act: (cubit) async {
        final profile = fakeModelFactory.createProfile();
        updatedProfileId = profile.id;
        const formData = <String, dynamic>{'firstName': 'Updated'};
        final exception = Exception('update failed');
        final stackTrace = StackTrace.current;

        when(
          () => updateProfileUseCase.execute(
            profile: profile,
            updatedFields: formData,
            completeProfile: false,
          ),
        ).thenAnswer((_) => Future<Profile>.error(exception, stackTrace));

        final callbackCompleter = Completer<(Object?, StackTrace)>();

        cubit.updateProfile(
          profile: profile,
          formData: formData,
          onError: (error, stack) {
            callbackCompleter.complete((error, stack));
          },
        );

        final callbackData = await callbackCompleter.future;
        expect(callbackData.$1, same(exception));
        expect(callbackData.$2, same(stackTrace));
      },
      expect: () => <ProfileEditState>[],
      verify: (_) {
        verify(
          () => crashlyticsService.recordError(
            exception: any(named: 'exception'),
            stackTrace: any(named: 'stackTrace'),
            reason: 'Unable to update profile: $updatedProfileId',
          ),
        ).called(1);
      },
    );
  });

  group('ProfileEditCubit.updateProfileSettings', () {
    late String updatedSettingsProfileId;

    blocTest<ProfileEditCubit, ProfileEditState>(
      'emits loaded and calls onComplete on success',
      build: buildCubit,
      act: (cubit) async {
        final profile = fakeModelFactory.createProfile();
        final updatedProfile = profile.copyWith(
          settings: profile.settings.copyWith(showStatsOnFinishScreen: false),
        );
        const settingsFormData = <String, dynamic>{
          'showStatsOnFinishScreen': false,
          'usePresenceFeature': true,
        };

        when(
          () => updateProfileSettingsUseCase.execute(
            profile: profile,
            updatedFields: settingsFormData,
          ),
        ).thenAnswer((_) async => updatedProfile);

        final callbackCompleter = Completer<void>();

        cubit.updateProfileSettings(
          profile: profile,
          settingsFormData: settingsFormData,
          onComplete: (settings) {
            expect(settings, equals(updatedProfile.settings));
            callbackCompleter.complete();
          },
        );

        await callbackCompleter.future;
      },
      expect: () => [
        isA<ProfileEditLoadedState>(),
      ],
      verify: (_) {
        verifyNever(
          () => crashlyticsService.recordError(
            exception: any(named: 'exception'),
            stackTrace: any(named: 'stackTrace'),
            reason: any(named: 'reason'),
          ),
        );
      },
    );

    blocTest<ProfileEditCubit, ProfileEditState>(
      'calls crashlytics and onError on failure',
      build: buildCubit,
      act: (cubit) async {
        final profile = fakeModelFactory.createProfile();
        updatedSettingsProfileId = profile.id;
        const settingsFormData = <String, dynamic>{
          'showStatsOnFinishScreen': false,
          'usePresenceFeature': false,
        };
        final exception = Exception('settings update failed');
        final stackTrace = StackTrace.current;

        when(
          () => updateProfileSettingsUseCase.execute(
            profile: profile,
            updatedFields: settingsFormData,
          ),
        ).thenAnswer((_) => Future<Profile>.error(exception, stackTrace));

        final callbackCompleter = Completer<(Object?, StackTrace)>();

        cubit.updateProfileSettings(
          profile: profile,
          settingsFormData: settingsFormData,
          onError: (error, stack) {
            callbackCompleter.complete((error, stack));
          },
        );

        final callbackData = await callbackCompleter.future;
        expect(callbackData.$1, same(exception));
        expect(callbackData.$2, same(stackTrace));
      },
      expect: () => <ProfileEditState>[],
      verify: (_) {
        verify(
          () => crashlyticsService.recordError(
            exception: any(named: 'exception'),
            stackTrace: any(named: 'stackTrace'),
            reason: 'Unable to update profile settings for profile: $updatedSettingsProfileId',
          ),
        ).called(1);
      },
    );
  });
}
