import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/core/domain/entity/lat_lng.dart';
import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/modules/social/domain/entity/presence_entity.dart';
import 'package:dhyana/modules/social/domain/entity/social_profile_entity.dart';
import 'package:dhyana/modules/social/domain/entity/presence_query_options_entity.dart';
import 'package:dhyana/modules/social/domain/usecase/query_presence_use_case.dart';
import 'package:dhyana/modules/social/social_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_definitions.dart';

class MockLoadPresenceDataUseCase extends Mock
		implements QueryPresenceUseCase {}

void main() {
	late MockLoadPresenceDataUseCase loadPresenceDataUseCase;
	late MockCrashlyticsService crashlyticsService;

	PresenceCubit buildCubit() {
		return PresenceCubit(
			queryPresenceDataUseCase: loadPresenceDataUseCase,
			crashlyticsService: crashlyticsService,
		);
	}

  Location createBerlinLocation() {
		return Location(
			name: 'Berlin',
			latLng: const LatLng(latitude: 52.52, longitude: 13.405),
			geoHash: 'u33dc1',
		);
	}

  Presence createPresence(String id) {
    return Presence(
      id: id,
      profile: SocialProfile(
        id: 'profile-$id',
        firstName: 'First$id',
        lastName: 'Last$id',
        photoUrl: null,
        photoBlurhash: null,
      ),
      startedAt: DateTime(2026, 1, 1),
      location: createBerlinLocation(),
    );
  }

	PresenceEntity createPresenceEntity(String id) {
		return PresenceEntity(
			id: id,
			profile: SocialProfileEntity(
				id: 'profile-$id',
				firstName: 'First$id',
				lastName: 'Last$id',
				photoUrl: null,
				photoBlurhash: null,
			),
			startedAt: DateTime(2026, 1, 1),
			location: Location(
				name: 'Berlin',
				latLng: const LatLng(latitude: 52.52, longitude: 13.405),
				geoHash: 'u33dc1',
			),
		);
	}



	setUp(() {
		loadPresenceDataUseCase = MockLoadPresenceDataUseCase();
		crashlyticsService = MockCrashlyticsService();

		when(
			() => crashlyticsService.recordError(
				exception: any(named: 'exception'),
				stackTrace: any(named: 'stackTrace'),
				reason: any(named: 'reason'),
			),
		).thenReturn(null);
	});

	test('initial state is PresenceState.initial', () {
		expect(buildCubit().state, equals(const PresenceState.initial()));
	});

	group('PresenceCubit.loadPresenceData', () {
		blocTest<PresenceCubit, PresenceState>(
			'emits loading then loaded when use case succeeds',
			build: buildCubit,
			setUp: () {
				final queryOptions = PresenceQueryOptionsEntity(
					ownProfileId: 'me',
					location: createBerlinLocation(),
					rangeInKm: 42,
					windowSize: const Duration(minutes: 30),
					limit: 7,
				);
				when(
					() => loadPresenceDataUseCase.execute(queryOptions),
				).thenAnswer((_) async => [createPresenceEntity('1'), createPresenceEntity('2')]);
			},
			act: (cubit) {
				return cubit.loadPresenceData(
					ownProfileId: 'me',
					location: createBerlinLocation(),
					rangeInKm: 42,
					windowSize: const Duration(minutes: 30),
					limit: 7,
				);
			},
			expect: () => [
				const PresenceState.loading(),
				PresenceState.loaded(
					presenceList: [createPresence('1'), createPresence('2')],
				),
			],
			verify: (_) {
				final queryOptions = PresenceQueryOptionsEntity(
					ownProfileId: 'me',
					location: createBerlinLocation(),
					rangeInKm: 42,
					windowSize: const Duration(minutes: 30),
					limit: 7,
				);
				verify(
					() => loadPresenceDataUseCase.execute(queryOptions),
				).called(1);
				verifyNever(
					() => crashlyticsService.recordError(
						exception: any(named: 'exception'),
						stackTrace: any(named: 'stackTrace'),
						reason: any(named: 'reason'),
					),
				);
			},
		);

		blocTest<PresenceCubit, PresenceState>(
			'emits loading then error and records crashlytics when use case throws',
			build: buildCubit,
			setUp: () {
				const queryOptions = PresenceQueryOptionsEntity();
				when(
					() => loadPresenceDataUseCase.execute(queryOptions),
				).thenThrow(Exception('load failed'));
			},
			act: (cubit) => cubit.loadPresenceData(),
			expect: () => [
				const PresenceState.loading(),
				const PresenceState.error(),
			],
			verify: (_) {
				verify(
					() => crashlyticsService.recordError(
						exception: any(named: 'exception'),
						stackTrace: any(named: 'stackTrace'),
						reason: 'Unable to load presence data',
					),
				).called(1);
			},
		);
	});

	group('PresenceCubit.loadPresenceData appendResult', () {
		blocTest<PresenceCubit, PresenceState>(
			'emits loadingMore then loaded when appendResult is true from initial state',
			build: buildCubit,
			setUp: () {
				const queryOptions = PresenceQueryOptionsEntity(
					lastDocumentId: 'doc-1',
					limit: 2,
				);
				when(
					() => loadPresenceDataUseCase.execute(queryOptions),
				).thenAnswer((_) async => [createPresenceEntity('1'), createPresenceEntity('2')]);
			},
			act: (cubit) => cubit.loadPresenceData(
        lastDocumentId: 'doc-1',
        limit: 2,
				appendResult: true,
			),
			expect: () => [
				const PresenceState.loadingMore(presenceList: []),
				PresenceState.loaded(
					presenceList: [createPresence('1'), createPresence('2')],
				),
			],
			verify: (_) {
				verify(
					() => loadPresenceDataUseCase.execute(
						const PresenceQueryOptionsEntity(
							lastDocumentId: 'doc-1',
							limit: 2,
						),
					),
				).called(1);
			},
		);

		blocTest<PresenceCubit, PresenceState>(
			'appends items to existing list when appendResult is true',
			build: buildCubit,
			setUp: () {
				when(
					() => loadPresenceDataUseCase.execute(
						const PresenceQueryOptionsEntity(),
					),
				).thenAnswer((_) async => [createPresenceEntity('1')]);
				when(
					() => loadPresenceDataUseCase.execute(
						const PresenceQueryOptionsEntity(
							lastDocumentId: 'doc-2',
							limit: 2,
						),
					),
				).thenAnswer((_) async => [createPresenceEntity('2'), createPresenceEntity('3')]);
			},
			act: (cubit) async {
				await cubit.loadPresenceData();
				await cubit.loadPresenceData(
          lastDocumentId: 'doc-2',
          limit: 2,
					appendResult: true,
				);
			},
			expect: () => [
				const PresenceState.loading(),
				PresenceState.loaded(presenceList: [createPresence('1')]),
				PresenceState.loadingMore(presenceList: [createPresence('1')]),
				PresenceState.loaded(
					presenceList: [
						createPresence('1'),
						createPresence('2'),
						createPresence('3'),
					],
				),
			],
		);

		blocTest<PresenceCubit, PresenceState>(
			'emits loadingMore then error and records crashlytics when append query throws',
			build: buildCubit,
			setUp: () {
				when(
					() => loadPresenceDataUseCase.execute(
						const PresenceQueryOptionsEntity(
							lastDocumentId: 'doc-3',
							limit: 4,
						),
					),
				).thenThrow(Exception('load more failed'));
			},
			act: (cubit) => cubit.loadPresenceData(
        lastDocumentId: 'doc-3',
        limit: 4,
				appendResult: true,
			),
			expect: () => [
				const PresenceState.loadingMore(presenceList: []),
				const PresenceState.error(),
			],
			verify: (_) {
				verify(
					() => crashlyticsService.recordError(
						exception: any(named: 'exception'),
						stackTrace: any(named: 'stackTrace'),
						reason: 'Unable to load presence data',
					),
				).called(1);
			},
		);
	});

	// group('PresenceCubit.showPresence', () {
	// 	blocTest<PresenceCubit, PresenceState>(
	// 		'calls use case and emits no state when successful',
	// 		build: buildCubit,
	// 		setUp: () {
	// 			when(() => showPresenceUseCase.execute('profile-1'))
	// 					.thenAnswer((_) async {});
	// 		},
	// 		act: (cubit) => cubit.showPresence('profile-1'),
	// 		expect: () => <PresenceState>[],
	// 		verify: (_) {
	// 			verify(() => showPresenceUseCase.execute('profile-1')).called(1);
	// 			verifyNever(
	// 				() => crashlyticsService.recordError(
	// 					exception: any(named: 'exception'),
	// 					stackTrace: any(named: 'stackTrace'),
	// 					reason: any(named: 'reason'),
	// 				),
	// 			);
	// 		},
	// 	);

	// 	blocTest<PresenceCubit, PresenceState>(
	// 		'records crashlytics and emits no state when use case throws',
	// 		build: buildCubit,
	// 		setUp: () {
	// 			when(() => showPresenceUseCase.execute('profile-2'))
	// 					.thenThrow(Exception('show failed'));
	// 		},
	// 		act: (cubit) => cubit.showPresence('profile-2'),
	// 		expect: () => <PresenceState>[],
	// 		verify: (_) {
	// 			verify(
	// 				() => crashlyticsService.recordError(
	// 					exception: any(named: 'exception'),
	// 					stackTrace: any(named: 'stackTrace'),
	// 					reason: 'Unable to show presence!',
	// 				),
	// 			).called(1);
	// 		},
	// 	);
	// });
}
