import 'package:dhyana/core/domain/entity/lat_lng.dart';
import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/core/domain/entity/presence/presence.dart';
import 'package:dhyana/core/domain/entity/presence/public_profile.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/modules/insights/domain/model/profile_statistics_report.dart';
import 'package:dhyana/modules/social/domain/usecase/show_presence_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_definitions.dart';

void main() {
  late MockPresenceRepository presenceRepository;
  late MockProfileRepository profileRepository;
  late MockAuthRepository authRepository;
  late ShowPresenceUseCase useCase;

  setUpAll(() {
    registerFallbackValue(
      Presence(
        id: 'fallback-id',
        profile: const PublicProfile(
          id: 'fallback-profile',
          firstName: 'Fallback',
          lastName: 'User',
          photoUrl: null,
          photoBlurhash: null,
        ),
        startedAt: DateTime(2026, 1, 1),
      ),
    );
  });

  setUp(() {
    presenceRepository = MockPresenceRepository();
    profileRepository = MockProfileRepository();
    authRepository = MockAuthRepository();

    useCase = ShowPresenceUseCase(
      presenceRepository: presenceRepository,
      profileRepository: profileRepository,
      authRepository: authRepository,
    );
  });

  Profile createProfile({required bool completed}) {
    return Profile(
      id: 'profile-1',
      firstName: 'Ada',
      lastName: 'Lovelace',
      email: 'ada@dhyana.app',
      photoUrl: 'https://example.com/avatar.jpg',
      photoBlurhash: 'L6Pj0^~qM{t7?bofRjof00ayj[ay',
      signupDate: DateTime(2026, 1, 1),
      statsReport: const ProfileStatisticsReport(),
      completed: completed,
      location: Location(
        name: 'Berlin',
        latLng: const LatLng(latitude: 52.52, longitude: 13.405),
        geoHash: 'u33dc1',
      ),
    );
  }

  group('ShowPresenceUseCase.execute', () {
    test('shows presence when profile is completed', () async {
      final profile = createProfile(completed: true);

      when(() => profileRepository.read(profile.id))
          .thenAnswer((_) async => profile);
      when(() => presenceRepository.showPresence(any()))
          .thenAnswer((_) async {});

      await useCase.execute(profile.id);

      verify(() => profileRepository.read(profile.id)).called(1);
      final captured = verify(
        () => presenceRepository.showPresence(captureAny()),
      ).captured.single as Presence;

      expect(captured.id, profile.id);
      expect(captured.profile, PublicProfile.fromProfile(profile: profile));
      expect(captured.location, profile.location);
      expect(
        captured.startedAt.isAfter(DateTime.now().subtract(const Duration(seconds: 2))),
        isTrue,
      );
      expect(
        captured.startedAt.isBefore(DateTime.now().add(const Duration(seconds: 2))),
        isTrue,
      );
      verifyNoMoreInteractions(presenceRepository);
    });

    test('does not show presence when profile is incomplete', () async {
      final profile = createProfile(completed: false);

      when(() => profileRepository.read(profile.id))
          .thenAnswer((_) async => profile);

      await useCase.execute(profile.id);

      verify(() => profileRepository.read(profile.id)).called(1);
      verifyNever(() => presenceRepository.showPresence(any()));
      verifyNoMoreInteractions(presenceRepository);
    });

    test('rethrows when reading profile fails', () async {
      final exception = Exception('read failed');
      final stackTrace = StackTrace.current;

      when(() => profileRepository.read('profile-1')).thenAnswer(
        (_) => Future<Profile>.error(exception, stackTrace),
      );

      await expectLater(
        useCase.execute('profile-1'),
        throwsA(same(exception)),
      );
      verify(() => profileRepository.read('profile-1')).called(1);
      verifyNever(() => presenceRepository.showPresence(any()));
    });

    test('rethrows when showPresence fails', () async {
      final profile = createProfile(completed: true);
      final exception = Exception('show failed');
      final stackTrace = StackTrace.current;

      when(() => profileRepository.read(profile.id))
          .thenAnswer((_) async => profile);
      when(() => presenceRepository.showPresence(any())).thenAnswer(
        (_) => Future<void>.error(exception, stackTrace),
      );

      await expectLater(
        useCase.execute(profile.id),
        throwsA(same(exception)),
      );
      verify(() => profileRepository.read(profile.id)).called(1);
      verify(() => presenceRepository.showPresence(any())).called(1);
    });
  });
}
