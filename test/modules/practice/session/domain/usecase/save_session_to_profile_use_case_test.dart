import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/domain/enum/session_type.dart';
import 'package:dhyana/modules/insights/domain/entity/profile_statistics_report.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/update_profile_with_session_use_case.dart';
import 'package:dhyana/modules/profile/data/service/default_profile_stats_report_updater_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mock_definitions.dart';

void main() {
  late MockProfileRepository profileRepository;
  late MockProfileStatsUpdaterService profileStatsUpdaterService;
  late UpdateProfileWithSessionUseCase useCase;

  setUp(() {
    profileRepository = MockProfileRepository();
    profileStatsUpdaterService = MockProfileStatsUpdaterService();
    useCase = UpdateProfileWithSessionUseCase(
      profileRepository: profileRepository,
      profileStatsUpdaterService: profileStatsUpdaterService,
    );
  });

  Profile createProfile() {
    return Profile(
      id: 'profile-1',
      firstName: 'Ada',
      lastName: 'Lovelace',
      email: 'ada@dhyana.app',
      photoUrl: null,
      photoBlurhash: null,
      signupDate: DateTime(2026, 1, 1),
      statsReport: const ProfileStatisticsReport(),
      completed: true,
    );
  }

  Session createSession() {
    return Session(
      id: 'session-1',
      type: SessionType.sitting,
      startTime: DateTime(2026, 1, 2, 10, 0),
      endTime: DateTime(2026, 1, 2, 10, 20),
      duration: const Duration(minutes: 20),
    );
  }

  test('returns updated profile and persists it', () async {
    final profile = createProfile();
    final session = createSession();

    when(
      () => profileRepository.read(profile.id),
    ).thenAnswer((_) async => profile);

    final expectedUpdatedProfile = DefaultProfileReportUpdaterService()
        .updateProfileStatsWithSession(profile, session)
        .updatedProfile;
    when(
      () => profileRepository.update(expectedUpdatedProfile),
    ).thenAnswer((_) async {});

    final result = await useCase.execute(profile.id, session);

    expect(result, equals(expectedUpdatedProfile));
    verify(() => profileRepository.read(profile.id)).called(1);
    verify(() => profileRepository.update(expectedUpdatedProfile)).called(1);
  });
}
