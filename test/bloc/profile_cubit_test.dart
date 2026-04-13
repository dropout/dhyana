import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/data_provider/data_provider_exception.dart';
import 'package:dhyana/model/consecutive_days.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_settings.dart';
import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock_definitions.dart';

abstract class CallbackProvider {
  void onComplete(Profile profile);
  void onSettingsComplete(ProfileSettings settings);
  void onError(Object? error, StackTrace stackTrace);
}

class MockCallback extends Mock implements CallbackProvider {}

void main() {

  final FakeModelFactory fakeFactory = FakeModelFactory();

  late Profile profile;
  late ProfileSettings profileSettings;

  late MockProfileRepository mockProfileRepository;
  late MockStatisticsRepository mockStatisticsRepository;
  late MockCrashlyticsService mockCrashlyticsService;
  late MockIdGeneratorService mockIdGeneratorService;
  late MockProfileStatsUpdater mockProfileStatsUpdater;
  late MockSettingsRepository mockSettingsRepository;

  late MockCallback mockCallback;

  final validStatsReport = ProfileStatisticsReport(
    consecutiveDays: ConsecutiveDays(current: 2, longest: 2),
  );

  final invalidStatsReport = ProfileStatisticsReport(
    consecutiveDays: ConsecutiveDays(current: 0, longest: 2),
  ); 

  ProfileCubit createProfileCubit() {
    return ProfileCubit(
      profileRepository: mockProfileRepository,
      settingsRepository: mockSettingsRepository,
      statisticsRepository: mockStatisticsRepository,
      crashlyticsService: mockCrashlyticsService,
      idGeneratorService: mockIdGeneratorService,
      profileStatsUpdater: mockProfileStatsUpdater,
    );
  }

  setUpAll(() {
    profile = fakeFactory.createProfile().copyWith(
      statsReport: validStatsReport,
    );
    profileSettings = ProfileSettings(id: profile.id); // default values

    mockProfileRepository = MockProfileRepository();
    mockStatisticsRepository = MockStatisticsRepository();
    mockCrashlyticsService = MockCrashlyticsService();
    mockIdGeneratorService = MockIdGeneratorService();
    mockProfileStatsUpdater = MockProfileStatsUpdater();
    mockSettingsRepository = MockSettingsRepository();

    mockCallback = MockCallback();

    registerFallbackValue(StackTrace.empty);
    registerFallbackValue(Exception('Fallback exception'));
  });

  group('ProfileCubit', () {

    blocTest<ProfileCubit, ProfileState>(
      'can successfully load profile',
      build: () {
        when(
          () => mockProfileRepository.read(profile.id),
        ).thenAnswer((_) async => profile);
        when(
          () => mockSettingsRepository.read(profile.id),
        ).thenAnswer((_) async => profileSettings);
        when(
          () => mockProfileStatsUpdater.validateStatsReport(profile.statsReport),
        ).thenReturn(profile.statsReport);
        return createProfileCubit();
      },
      act: (cubit) => cubit.loadProfile(
        profile.id,
        onComplete: mockCallback.onComplete,
      ),
      expect: () => [
        const ProfileState.loading(),
        ProfileState.loaded(
          profile: profile,
          settings: profileSettings,
        ),
      ],
      verify: (_) {
        verify(() => mockProfileRepository.read(profile.id)).called(1);
        verify(() => mockSettingsRepository.read(profile.id)).called(1);
        verify(() => mockProfileStatsUpdater.validateStatsReport(profile.statsReport)).called(1);
        verify(() => mockCallback.onComplete(profile)).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'can successfully load profile when profile parameter is provided',
      build: () {
        when(
          () => mockSettingsRepository.read(profile.id),
        ).thenAnswer((_) async => profileSettings);

        when(
          () => mockProfileStatsUpdater.validateStatsReport(profile.statsReport),
        ).thenReturn(profile.statsReport);
        return createProfileCubit();
      },
      act: (cubit) => cubit.loadProfile(profile.id, profile: profile),
      expect: () => [
        ProfileState.loaded(
          profile: profile,
          settings: profileSettings,
        ),
      ],
      verify: (_) {
        verifyNever(() => mockProfileRepository.read(profile.id));
        verify(() => mockSettingsRepository.read(profile.id)).called(1);
        verify(() => mockProfileStatsUpdater.validateStatsReport(profile.statsReport)).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'can update profile with invalidated stats report when loading profile',
      build: () {
                
        when(() => mockProfileRepository.read(profile.id))
          .thenAnswer((_) async => profile);

        when(() => mockSettingsRepository.read(profile.id))
          .thenAnswer((_) async => profileSettings);

        when(() => mockProfileStatsUpdater.validateStatsReport(validStatsReport))
          .thenReturn(invalidStatsReport);
          
        when(() => mockProfileRepository.update(
          profile.copyWith(statsReport: invalidStatsReport)
        )).thenAnswer((_) async => profile.copyWith(statsReport: invalidStatsReport));
        
        return createProfileCubit();
      },
      act: (cubit) => cubit.loadProfile(profile.id),
      expect: () => [
        const ProfileState.loading(),
        ProfileState.loaded(
          profile: profile.copyWith(statsReport: invalidStatsReport),
          settings: profileSettings,
        ),
      ],
      verify: (_) {
        verify(() => mockProfileRepository.read(profile.id))
          .called(1);
        verify(() => mockProfileStatsUpdater.validateStatsReport(profile.statsReport))
          .called(1);
        verify(() => mockProfileRepository.update(profile.copyWith(statsReport: invalidStatsReport)))
          .called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'can handle profile loading failure',
      build: () {
        when(
          () => mockProfileRepository.read('1'),
        ).thenThrow(Exception('Failed to load profile'));
        return createProfileCubit();
      },
      act: (cubit) => cubit.loadProfile('1', onError: mockCallback.onError),
      expect: () => [
        const ProfileState.loading(), 
        const ProfileState.error()
      ],
      verify: (_) {
        verify(() => mockProfileRepository.read('1')).called(1);
        verify(
          () => mockCrashlyticsService.recordError(
            exception: any(named: 'exception'),
            stackTrace: any(named: 'stackTrace'),
            reason: any(named: 'reason'),
          ),
        ).called(1);
        verify(() => mockCallback.onError(any(), any())).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'can handle profile document not found when loading profile settings',
      build: () {
                
        when(
          () => mockProfileRepository.read(profile.id),
        ).thenAnswer((_) async => profile);

        when(
          () => mockProfileStatsUpdater.validateStatsReport(profile.statsReport),
        ).thenReturn(profile.statsReport);

        when(
          () => mockSettingsRepository.read(profile.id),
        ).thenThrow(DocumentNotFoundException(message: 'Profile settings not found'));

        return createProfileCubit();
      },
      act: (cubit) => cubit.loadProfile(
        profile.id, 
        onComplete: mockCallback.onComplete,
      ),
      expect: () => [
        const ProfileState.loading(), 
        ProfileState.loaded(
          profile: profile,
          settings: ProfileSettings(id: profile.id), // default settings returned when not found
        ),
      ],
      verify: (_) {
        verify(() => mockProfileRepository.read(profile.id)).called(1);
        verify(() => mockCallback.onComplete(profile)).called(1);
      },
    );    

    blocTest<ProfileCubit, ProfileState>(
      'can successfully update profile',
      build: () {
        when(
          () => mockProfileRepository.update(profile),
        ).thenAnswer((_) async => profile);
        when(
          () => mockSettingsRepository.read(profile.id),
        ).thenAnswer((_) async => profileSettings);
        return createProfileCubit();
      },
      act: (cubit) => cubit.updateProfile(
        profile: profile,
        formData: {},
        completeProfile: false,
        onComplete: mockCallback.onComplete,
      ),
      expect: () => [
        ProfileState.loaded(
          profile: profile,
          settings: profileSettings,
        ),
      ],
      verify: (_) {
        verify(() => mockProfileRepository.update(profile)).called(1);
        verify(() => mockCallback.onComplete(profile)).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'can handle profile update failure',
      build: () {
        when(
          () => mockProfileRepository.update(profile),
        ).thenThrow(Exception('Failed to update profile'));
        return createProfileCubit();
      },
      act: (cubit) => cubit.updateProfile(
        profile: profile,
        formData: {},
        onError: mockCallback.onError,
      ),
      expect: () => [
        // No state emission on error, only error handling
      ],
      verify: (_) {
        verify(
          () => mockCrashlyticsService.recordError(
            exception: any(named: 'exception'),
            stackTrace: any(named: 'stackTrace'),
            reason: any(named: 'reason'),
          ),
        ).called(1);
        verify(() => mockCallback.onError(any(), any())).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'can successfully update profile settings',
      build: () {
        final updatedSettings = ProfileSettings(id: profile.id);
        when(
          () => mockSettingsRepository.update(updatedSettings),
        ).thenAnswer((_) async => updatedSettings);
        return createProfileCubit();
      },
      act: (cubit) => cubit.updateProfileSettings(
        profile: profile,
        settingsFormData: {},
        onComplete: mockCallback.onSettingsComplete,
      ),
      expect: () => [
        ProfileState.loaded(
          profile: profile,
          settings: ProfileSettings(id: profile.id),
        ),
      ],
      verify: (_) {
        final updatedSettings = ProfileSettings(id: profile.id);
        verify(() => mockSettingsRepository.update(updatedSettings)).called(1);
        verify(() => mockCallback.onSettingsComplete(updatedSettings)).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'can handle profile settings update failure',
      build: () {
        final updatedSettings = ProfileSettings(id: profile.id);
        when(
          () => mockSettingsRepository.update(updatedSettings),
        ).thenThrow(Exception('Failed to update profile settings'));
        return createProfileCubit();
      },
      act: (cubit) => cubit.updateProfileSettings(
        profile: profile,
        settingsFormData: {},
        onError: mockCallback.onError,
      ),
      expect: () => [
        // No state emission on error, only error handling
      ],
      verify: (_) {
        verify(
          () => mockCrashlyticsService.recordError(
            exception: any(named: 'exception'),
            stackTrace: any(named: 'stackTrace'),
            reason: any(named: 'reason'),
          ),
        ).called(1);
        verify(() => mockCallback.onError(any(), any())).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'can clear profile data and reset to initial state',
      build: () => createProfileCubit(),
      act: (cubit) => cubit.clearData(),
      expect: () => [const ProfileState.initial()],
    );

  }); // eof group

} // eof main
