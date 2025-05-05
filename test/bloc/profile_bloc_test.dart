import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/service/id_generator_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}
class MockStatisticsRepository extends Mock implements StatisticsRepository {}
class MockCrashlyticsService extends Mock implements CrashlyticsService {}
class MockIdGeneratorService extends Mock implements IdGeneratorService {}
class MockProfileStatsUpdater extends Mock implements ProfileStatsReportUpdater {}

void main() {
  final FakeModelFactory fakeFactory = FakeModelFactory();

  late Profile profile;
  // late Session session;

  late ProfileBloc profileBloc;
  late MockProfileRepository mockProfileRepository;
  late MockStatisticsRepository mockStatisticsRepository;
  late MockCrashlyticsService mockCrashlyticsService;
  late MockIdGeneratorService mockIdGeneratorService;
  late MockProfileStatsUpdater mockProfileStatsUpdater;

  setUp(() {
    profile = fakeFactory.createProfile();
    // session = fakeFactory.createSession();

    mockProfileRepository = MockProfileRepository();
    mockStatisticsRepository = MockStatisticsRepository();
    mockCrashlyticsService = MockCrashlyticsService();
    mockIdGeneratorService = MockIdGeneratorService();
    mockProfileStatsUpdater = MockProfileStatsUpdater();

    profileBloc = ProfileBloc(
      profileRepository: mockProfileRepository,
      statisticsRepository: mockStatisticsRepository,
      crashlyticsService: mockCrashlyticsService,
      idGeneratorService: mockIdGeneratorService,
      profileStatsUpdater: mockProfileStatsUpdater,
    );

    registerFallbackValue(fakeFactory.createProfile());
    registerFallbackValue(fakeFactory.createSession());
  });

  tearDown(() {
    profileBloc.close();
  });

  group('ProfileBloc', () {

    blocTest<ProfileBloc, ProfileState>(
      'emits [ProfileState.loading(), ProfileState.loaded()] when LoadProfile is added',
      build: () {
        when(() => mockProfileRepository.read(any())).thenAnswer((_) async => profile);
        return profileBloc;
      },
      act: (bloc) => bloc.add(const LoadProfile(profileId: '1')),
      expect: () => [
        const ProfileState.loading(),
        ProfileState.loaded(profile: profile),
      ],
      verify: (_) {
        verify(() => mockProfileRepository.read('1')).called(1);
      },
    );

    blocTest<ProfileBloc, ProfileState>(
      'emits [ProfileState.loading(), ProfileErrorState()] when LoadProfile fails',
      build: () {
        when(() => mockProfileRepository.read(any())).thenThrow(Exception('Failed to load profile'));
        return profileBloc;
      },
      act: (bloc) => bloc.add(const LoadProfile(profileId: '1')),
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

    blocTest<ProfileBloc, ProfileState>(
      'emits [ProfileState.loaded()] when UpdateProfile is added',
      build: () {
        when(() => mockProfileRepository.update(any())).thenAnswer((_) async => profile);
        return profileBloc;
      },
      act: (bloc) => bloc.add(
        ProfileEvent.updateProfile(
          profile: profile,
          formData: {},
          completeProfile: false,
        )
      ),
      expect: () => [
        ProfileState.loaded(profile: profile),
      ],
      verify: (_) {
        verify(() => mockProfileRepository.update(profile)).called(1);
      },
    );

    blocTest<ProfileBloc, ProfileState>(
      'emits [ProfileState.initial()] when ResetProfileContent is added',
      build: () => profileBloc,
      act: (bloc) => bloc.add(const ProfileEvent.clearData()),
      expect: () => [
        const ProfileState.initial(),
      ],
    );

    // blocTest<ProfileBloc, ProfileState>(
    //   'emits [ProfileState.loaded()] when LogSession is added',
    //   build: () {
    //     when(() => mockProfileRepository.read('1')).thenAnswer((_) async => profile);
    //     when(() => mockIdGeneratorService.sessionId('1')).thenReturn('1');
    //     // when(() => mockProfileStatsUpdater.updateProfileStatsReportWithNewSession(profile.statsReport, any())).thenReturn(profile.statsReport);
    //     when(() => mockStatisticsRepository.logSession(profile, any())).thenAnswer((_) async {});
    //     when(() => mockProfileRepository.update(profile)).thenAnswer((_) async => profile);
    //     return profileBloc;
    //   },
    //   act: (bloc) => bloc.add(ProfileEvent.logSession(
    //     profileId: '1',
    //     startTime: DateTime(2000, 1, 1),
    //     endTime: DateTime(2000, 1, 1).add(const Duration(hours: 1)),
    //     duration: const Duration(hours: 1),
    //     timerSettings: const TimerSettings(),
    //   )),
    //   expect: () => [
    //     ProfileState.loaded(profile: profile),
    //   ],
    //   verify: (_) {
    //     verify(() => mockProfileRepository.read('1')).called(1);
    //     // verify(() => mockProfileStatsUpdater.updateProfileStatsReportWithNewSession(profile.statsReport, any())).called(1);
    //     verify(() => mockStatisticsRepository.logSession(profile, any())).called(1);
    //     verify(() => mockProfileRepository.update(profile)).called(1);
    //   },
    // );

  });
}
