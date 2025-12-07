import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile_settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock_definitions.dart';

void main() {
  final FakeModelFactory fakeFactory = FakeModelFactory();

  late Profile profile;

  late ProfileCubit profileCubit;
  late MockProfileRepository mockProfileRepository;
  late MockStatisticsRepository mockStatisticsRepository;
  late MockCrashlyticsService mockCrashlyticsService;
  late MockIdGeneratorService mockIdGeneratorService;
  late MockProfileStatsUpdater mockProfileStatsUpdater;
  late MockSettingsRepository mockSettingsRepository;

  setUp(() {
    profile = fakeFactory.createProfile();

    mockProfileRepository = MockProfileRepository();
    mockStatisticsRepository = MockStatisticsRepository();
    mockCrashlyticsService = MockCrashlyticsService();
    mockIdGeneratorService = MockIdGeneratorService();
    mockProfileStatsUpdater = MockProfileStatsUpdater();
    mockSettingsRepository = MockSettingsRepository();

    profileCubit = ProfileCubit(
      profileRepository: mockProfileRepository,
      settingsRepository: mockSettingsRepository,
      statisticsRepository: mockStatisticsRepository,
      crashlyticsService: mockCrashlyticsService,
      idGeneratorService: mockIdGeneratorService,
      profileStatsUpdater: mockProfileStatsUpdater,
    );

    registerFallbackValue(fakeFactory.createProfile());
    registerFallbackValue(ProfileStatisticsReport());
  });

  tearDown(() {
    profileCubit.close();
  });

  group('ProfileBloc', () {

    blocTest<ProfileCubit, ProfileState>(
      'emits [ProfileState.loading(), ProfileState.loaded()] when LoadProfile is added',
      build: () {
        when(() => mockProfileRepository.read(any())).thenAnswer((_) async => profile);
        when(() => mockProfileStatsUpdater.validateStatsReport(any())).thenReturn(profile.statsReport);
        return profileCubit;
      },
      act: (cubit) => cubit.loadProfile("1"),
      expect: () => [
        const ProfileState.loading(),
        ProfileState.loaded(profile: profile, settings: ProfileSettings(id: profile.id)),
      ],
      verify: (_) {
        verify(() => mockProfileRepository.read('1')).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits [ProfileState.loading(), ProfileErrorState()] when LoadProfile fails',
      build: () {
        when(() => mockProfileRepository.read(any())).thenThrow(Exception('Failed to load profile'));
        return profileCubit;
      },
      act: (cubit) => cubit.loadProfile('1'),
      expect: () => [
        const ProfileState.loading(),
        const ProfileState.error(),
      ],
      verify: (_) {
        verify(() => mockProfileRepository.read('1')).called(1);
        verify(() => mockCrashlyticsService.recordError(
          exception: any(named: 'exception'),
          stackTrace: any(named: 'stackTrace'),
          reason: any(named: 'reason'),
        )).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits [ProfileState.loaded()] when UpdateProfile is added',
      build: () {
        when(() => mockProfileRepository.update(any())).thenAnswer((_) async => profile);
        return profileCubit;
      },
      act: (cubit) => cubit.updateProfile(
        profile: profile,
        formData: {},
        completeProfile: false,
      ),
      expect: () => [
        ProfileState.loaded(profile: profile, settings: ProfileSettings(id: profile.id)),
      ],
      verify: (_) {
        verify(() => mockProfileRepository.update(profile)).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits [ProfileState.initial()] when ResetProfileContent is added',
      build: () => profileCubit,
      act: (cubit) => cubit.clearData(),
      expect: () => [
        const ProfileState.initial(),
      ],
    );

  });
}
