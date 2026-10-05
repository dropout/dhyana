import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social/src/data/datasource/faker_social_extension.dart';


import 'package:social/src/domain/entity/presence_entity.dart';
import 'package:social/src/domain/entity/presence_query_options_entity.dart';
import 'package:social/src/data/repository/default_presence_repository.dart';

import '../social_mock_definitions.dart';


void main() {
  group('DefaultPresenceRepositoryTest', () {
    late StreamController<PresenceEntity> presenceStreamController;
    late MockPresenceDataProvider mockPresenceDataProvider;
    late DefaultPresenceRepository presenceRepository;

    setUp(() {
      presenceStreamController = StreamController<PresenceEntity>(sync: true);
      mockPresenceDataProvider = MockPresenceDataProvider();
      presenceRepository = DefaultPresenceRepository(
        presenceDataProvider: mockPresenceDataProvider,
      );
    });

    tearDown(() {
      presenceStreamController.close();
    });

    test('can create presence', () async {
      final presence = Faker().createPresenceEntity();
      when(() => mockPresenceDataProvider.create(presence))
        .thenAnswer((_) async {});

      await presenceRepository.create(presence);

      verify(() => mockPresenceDataProvider.create(presence)).called(1);
    });

    test('can read presence by id', () async {
      final presence = Faker().createPresenceEntity();
      when(() => mockPresenceDataProvider.read(presence.id, preferCache: false))
          .thenAnswer((_) async => presence);

      final result = await presenceRepository.read(presence.id);

      expect(result, equals(presence));
      verify(() => mockPresenceDataProvider.read(presence.id, preferCache: false)).called(1);
    });

    test('can read presence stream by id', () {
      when(() => mockPresenceDataProvider.readStream('test_id'))
          .thenAnswer((_) => presenceStreamController.stream);

      final stream = presenceRepository.readStream('test_id');

      expect(stream, isA<Stream<PresenceEntity>>());
      verify(() => mockPresenceDataProvider.readStream('test_id')).called(1);
    });

    test('can update presence', () async {
      final presence = Faker().createPresenceEntity();
      when(() => mockPresenceDataProvider.update(presence))
          .thenAnswer((_) async {});

      await presenceRepository.update(presence);

      verify(() => mockPresenceDataProvider.update(presence)).called(1);
    });

    test('can delete presence', () async {
      when(() => mockPresenceDataProvider.delete('test_id'))
          .thenAnswer((_) async {});

      await presenceRepository.delete('test_id');

      verify(() => mockPresenceDataProvider.delete('test_id')).called(1);
    });

    test('showPresence delegates to create on provider', () async {
      final presence = Faker().createPresenceEntity();
      when(() => mockPresenceDataProvider.create(presence))
          .thenAnswer((_) async {});

      await presenceRepository.create(
        presence
      );

      verify(() => mockPresenceDataProvider.create(presence)).called(1);
    });

    test('query returns all when ownProfileId is null', () async {
      const queryOptions = PresenceQueryOptionsEntity();
      final presenceList = [
        Faker().createPresenceEntity(),
        Faker().createPresenceEntity(),
      ];
      when(() => mockPresenceDataProvider.query(queryOptions))
          .thenAnswer((_) async => presenceList);

      final result = await presenceRepository.query(queryOptions);

      expect(result, equals(presenceList));
      verify(() => mockPresenceDataProvider.query(queryOptions)).called(1);
    });

    test('query excludes own profile when ownProfileId is provided', () async {
      final ownPresence = Faker().createPresenceEntity();
      final otherPresence = Faker().createPresenceEntity();

      final queryOptions = PresenceQueryOptionsEntity(ownProfileId: ownPresence.id);

      when(() => mockPresenceDataProvider.query(queryOptions))
          .thenAnswer((_) async => [ownPresence, otherPresence]);

      final result = await presenceRepository.query(queryOptions);

      expect(result, equals([otherPresence]));
      verify(() => mockPresenceDataProvider.query(queryOptions)).called(1);
    });

    test('queryStream throws UnimplementedError', () {
      expect(
        () => presenceRepository.queryStream(const PresenceQueryOptionsEntity()),
        throwsA(isA<UnimplementedError>()),
      );
    });
  });
}
