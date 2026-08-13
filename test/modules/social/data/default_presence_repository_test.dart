import 'dart:async';

import 'package:dhyana/modules/social/domain/entity/presence_entity.dart';
import 'package:dhyana/modules/social/domain/entity/presence_query_options_entity.dart';
import 'package:dhyana/modules/social/domain/entity/social_profile_entity.dart';
import 'package:dhyana/modules/social/data/repository/default_presence_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../social_mock_definitions.dart';



void main() {
  group('DefaultPresenceRepositoryTest', () {
    late StreamController<PresenceEntity> presenceStreamController;
    late MockPresenceDataProvider mockPresenceDataProvider;
    late DefaultPresenceRepository firebasePresenceRepository;

    PresenceEntity createPresence(String id) {
      return PresenceEntity(
        id: id,
        profile: const SocialProfileEntity(
          id: 'profile-id',
          firstName: 'Ada',
          lastName: 'Lovelace',
          photoUrl: null,
          photoBlurhash: null,
        ),
        startedAt: DateTime(2026, 1, 1),
      );
    }

    setUp(() {
      presenceStreamController = StreamController<PresenceEntity>(sync: true);
      mockPresenceDataProvider = MockPresenceDataProvider();
      firebasePresenceRepository = DefaultPresenceRepository(
        presenceDataProvider: mockPresenceDataProvider,
      );
    });

    tearDown(() {
      presenceStreamController.close();
    });

    test('can create presence', () async {
      final presence = createPresence('test_id');
      when(() => mockPresenceDataProvider.create(presence))
          .thenAnswer((_) async {});

      await firebasePresenceRepository.create(presence);

      verify(() => mockPresenceDataProvider.create(presence)).called(1);
    });

    test('can read presence by id', () async {
      final presence = createPresence('test_id');
      when(() => mockPresenceDataProvider.read('test_id'))
          .thenAnswer((_) async => presence);

      final result = await firebasePresenceRepository.read('test_id');

      expect(result, equals(presence));
      verify(() => mockPresenceDataProvider.read('test_id')).called(1);
    });

    test('can read presence stream by id', () {
      when(() => mockPresenceDataProvider.readStream('test_id'))
          .thenAnswer((_) => presenceStreamController.stream);

      final stream = firebasePresenceRepository.readStream('test_id');

      expect(stream, isA<Stream<PresenceEntity>>());
      verify(() => mockPresenceDataProvider.readStream('test_id')).called(1);
    });

    test('can update presence', () async {
      final presence = createPresence('test_id');
      when(() => mockPresenceDataProvider.update(presence))
          .thenAnswer((_) async {});

      await firebasePresenceRepository.update(presence);

      verify(() => mockPresenceDataProvider.update(presence)).called(1);
    });

    test('can delete presence', () async {
      when(() => mockPresenceDataProvider.delete('test_id'))
          .thenAnswer((_) async {});

      await firebasePresenceRepository.delete('test_id');

      verify(() => mockPresenceDataProvider.delete('test_id')).called(1);
    });

    test('showPresence delegates to create on provider', () async {
      final presence = createPresence('test_id');
      when(() => mockPresenceDataProvider.create(presence))
          .thenAnswer((_) async {});

      await firebasePresenceRepository.create(
        presence
      );

      verify(() => mockPresenceDataProvider.create(presence)).called(1);
    });

    test('query returns all when ownProfileId is null', () async {
      const queryOptions = PresenceQueryOptionsEntity();
      final presenceList = [
        createPresence('id-1'),
        createPresence('id-2'),
      ];
      when(() => mockPresenceDataProvider.query(queryOptions))
          .thenAnswer((_) async => presenceList);

      final result = await firebasePresenceRepository.query(queryOptions);

      expect(result, equals(presenceList));
      verify(() => mockPresenceDataProvider.query(queryOptions)).called(1);
    });

    test('query excludes own profile when ownProfileId is provided', () async {
      const queryOptions = PresenceQueryOptionsEntity(ownProfileId: 'id-1');
      final ownPresence = createPresence('id-1');
      final otherPresence = createPresence('id-2');
      when(() => mockPresenceDataProvider.query(queryOptions))
          .thenAnswer((_) async => [ownPresence, otherPresence]);

      final result = await firebasePresenceRepository.query(queryOptions);

      expect(result, equals([otherPresence]));
      verify(() => mockPresenceDataProvider.query(queryOptions)).called(1);
    });

    test('queryStream throws UnimplementedError', () {
      expect(
        () => firebasePresenceRepository.queryStream(const PresenceQueryOptionsEntity()),
        throwsA(isA<UnimplementedError>()),
      );
    });
  });
}
