import 'package:core/core.dart';
import 'package:social/src/domain/entity/presence_entity.dart';
import 'package:social/src/domain/entity/social_profile_entity.dart';
import 'package:social/src/domain/usecase/show_presence_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../social_mock_definitions.dart';

void main() {
	late MockPresenceRepository presenceRepository;
	late ShowPresenceUseCase useCase;

	setUp(() {
		presenceRepository = MockPresenceRepository();
		useCase = ShowPresenceUseCase(presenceRepository);
	});

	group('ShowPresenceUseCase.execute', () {
		test('creates presence with location and photo blurhash', () async {
			const profileId = 'profile-1';
			final startedAt = DateTime(2026, 1, 10, 7, 30);
			const location = Location(
				name: 'Lisbon',
				latLng: LatLng(latitude: 38.7223, longitude: -9.1393),
				geoHash: 'ez3fh4',
			);
			final expected = PresenceEntity(
				id: profileId,
				profile: SocialProfileEntity(
					id: profileId,
					firstName: 'Ada',
					lastName: 'Lovelace',
					photoUrl: null,
					photoBlurhash: 'L5H2EC=PM+yV0g-mq.wG9c010J}I',
					location: location,
				),
				startedAt: startedAt,
				location: location,
			);

			when(() => presenceRepository.create(expected)).thenAnswer((_) async {});

			await useCase.execute(
				profileId: profileId,
				firstName: 'Ada',
				lastName: 'Lovelace',
				photoBlurhash: 'L5H2EC=PM+yV0g-mq.wG9c010J}I',
				location: location,
				startedAt: startedAt,
			);

			verify(() => presenceRepository.create(expected)).called(1);
			verifyNoMoreInteractions(presenceRepository);
		});

		test('creates presence with null optional fields', () async {
			const profileId = 'profile-2';
			final startedAt = DateTime(2026, 1, 11, 9, 0);
			final expected = PresenceEntity(
				id: profileId,
				profile: const SocialProfileEntity(
					id: profileId,
					firstName: 'Grace',
					lastName: 'Hopper',
					photoUrl: null,
					photoBlurhash: null,
					location: null,
				),
				startedAt: startedAt,
				location: null,
			);

			when(() => presenceRepository.create(expected)).thenAnswer((_) async {});

			await useCase.execute(
				profileId: profileId,
				firstName: 'Grace',
				lastName: 'Hopper',
				startedAt: startedAt,
			);

			verify(() => presenceRepository.create(expected)).called(1);
			verifyNoMoreInteractions(presenceRepository);
		});

		test('forwards repository create errors', () async {
			const profileId = 'profile-3';
			final startedAt = DateTime(2026, 1, 12, 11, 0);
			final expected = PresenceEntity(
				id: profileId,
				profile: const SocialProfileEntity(
					id: profileId,
					firstName: 'Katherine',
					lastName: 'Johnson',
					photoUrl: null,
					photoBlurhash: null,
					location: null,
				),
				startedAt: startedAt,
				location: null,
			);
			final error = Exception('create failed');

			when(() => presenceRepository.create(expected)).thenThrow(error);

			expect(
				() => useCase.execute(
					profileId: profileId,
					firstName: 'Katherine',
					lastName: 'Johnson',
					startedAt: startedAt,
				),
				throwsA(same(error)),
			);
		});
	});
}
