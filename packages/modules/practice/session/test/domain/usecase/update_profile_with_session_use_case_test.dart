import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:profile/profile.dart';
import 'package:session/src/domain/entity/session_entity.dart';
import 'package:session/src/domain/usecase/update_profile_with_session_use_case.dart';


void main() {
  late MockProfilePublicApi profilePublicApi;
  late UpdateProfileWithSessionUseCase useCase;

  setUpAll(() {
    registerFallbackValue(ProfileSession(
      id: 'fallback',
      type: .sitting,
      startTime: DateTime.utc(1970),
      endTime: DateTime.utc(1970),
      duration: Duration.zero,
    ));
  });

  setUp(() {
    profilePublicApi = MockProfilePublicApi();
    useCase = UpdateProfileWithSessionUseCase(
      profilePublicApi: profilePublicApi,
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
      statsReport: const ProfileStatsReport(),
      completed: true,
    );
  }

  ProfileSession createSession() {
    return ProfileSession(
      id: 'session-1',
      type: .sitting,
      startTime: DateTime(2026, 1, 2, 10, 0),
      endTime: DateTime(2026, 1, 2, 10, 20),
      duration: const Duration(minutes: 20),
    );
  }

  test('returns updated profile and persists it', () async {
    final profile = createProfile();
    final profileSession = createSession();
    final session = SessionEntity(
      id: profileSession.id,
      type: switch (profileSession.type) {
        .sitting => .sitting,
        .chanting => .chanting,
      },
      startTime: profileSession.startTime,
      endTime: profileSession.endTime,
      duration: profileSession.duration,
    );
    final expectedUpdatedProfile = profile.copyWith(
      statsReport: profile.statsReport.copyWith(
        completedDaysCount: profile.statsReport.completedDaysCount + 1,
      ),
    );

    when(
      () => profilePublicApi.updateProfileStatsWithSession(profile.id, any()),
    ).thenAnswer(
      (_) async =>
          (originalProfile: profile, updatedProfile: expectedUpdatedProfile),
    );

    final result = await useCase.execute(profile.id, session);

    expect(result.oldProfile, equals(profile));
    expect(result.updatedProfile, equals(expectedUpdatedProfile));
    expect(result.session, equals(session));
    verify(
      () => profilePublicApi.updateProfileStatsWithSession(profile.id, any()),
    ).called(1);
  });
}
