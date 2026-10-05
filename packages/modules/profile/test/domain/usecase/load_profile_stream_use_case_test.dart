import 'package:faker/faker.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/domain/usecase/load_profile_stream_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../profile_mock_definitions.dart';

void main() {
	late MockProfileRepository profileRepository;
	late MockProfileStatsUpdater profileStatsUpdater;
	late Faker fakeModelFactory;
	late LoadProfileStreamUseCase useCase;

	setUp(() {
		profileRepository = MockProfileRepository();
		profileStatsUpdater = MockProfileStatsUpdater();
		fakeModelFactory = Faker();
		useCase = LoadProfileStreamUseCase(
			profileRepository: profileRepository,
			profileStatsUpdater: profileStatsUpdater,
		);
	});

	group('LoadProfileStreamUseCase.execute', () {
		test('emits original profile and does not persist when stats are unchanged', () async {
			final profile = fakeModelFactory.createProfileEntity();

			when(() => profileRepository.readStream(any()))
					.thenAnswer((_) => Stream.value(profile));
			when(() => profileStatsUpdater.validateStatsReport(profile.statsReport))
					.thenReturn(profile.statsReport);

			final emitted = await useCase.execute(profile.id).first;

			expect(emitted, equals(profile));
			verify(() => profileRepository.readStream(profile.id)).called(1);
			verify(() => profileStatsUpdater.validateStatsReport(profile.statsReport)).called(1);
			verifyNoMoreInteractions(profileRepository);
		});

		test('emits updated profile and persists when stats are invalidated', () async {
			final profile = fakeModelFactory.createProfileEntity();
			final updatedStatsReport = profile.statsReport.copyWith(
				completedDaysCount: profile.statsReport.completedDaysCount + 1,
			);
			final expectedUpdatedProfile = profile.copyWith(statsReport: updatedStatsReport);

			when(() => profileRepository.readStream(any()))
					.thenAnswer((_) => Stream.value(profile));
			when(() => profileStatsUpdater.validateStatsReport(profile.statsReport))
					.thenReturn(updatedStatsReport);
			when(() => profileRepository.update(expectedUpdatedProfile))
					.thenAnswer((_) async {});

			final emitted = await useCase.execute(profile.id).first;

			expect(emitted, equals(expectedUpdatedProfile));
			verify(() => profileRepository.readStream(profile.id)).called(1);
			verify(() => profileStatsUpdater.validateStatsReport(profile.statsReport)).called(1);
			verify(() => profileRepository.update(expectedUpdatedProfile)).called(1);
		});
	});
}
