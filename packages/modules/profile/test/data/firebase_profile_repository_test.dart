import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';

import 'package:profile/src/data/datasource/profile_data_provider.dart';
import 'package:profile/src/domain/entity/profile_entity.dart';
import 'package:profile/src/data/repository/default_profile_repository.dart';

import '../profile_mock_definitions.dart';



void main() {

  group('FirebaseProfileRepositoryTest', () {

    late StreamController<ProfileEntity> profileStreamController;
    late StreamController<List<ProfileEntity>> profileQueryStreamController;

    late ProfileDataProvider mockProfileDataProvider;

    late DefaultProfileRepository profileRepository;

    setUp(() {
      profileStreamController = StreamController<ProfileEntity>(sync: true);
      profileQueryStreamController =
        StreamController<List<ProfileEntity>>(sync: true);

      mockProfileDataProvider = MockProfileDataProvider();
      
      profileRepository = DefaultProfileRepository(
        profileDataProvider: mockProfileDataProvider,
      );
    });

    tearDown(() {
      profileStreamController.close();
      profileQueryStreamController.close();
    });

    test('can read profile by id', () {
      final profileEntity = Faker().createProfileEntity();
      when(() => mockProfileDataProvider.read('test_id', preferCache: false))
        .thenAnswer((_) => Future.value(profileEntity));
      profileRepository.read('test_id', preferCache: false);
      verify(() => mockProfileDataProvider.read('test_id', preferCache: false)).called(1);
    });

    test('can read profile stream by id', () {
      when(() => mockProfileDataProvider.readStream('test_id'))
        .thenAnswer((_) => profileStreamController.stream);
      profileRepository.readStream('test_id');
      verify(() => mockProfileDataProvider.readStream('test_id')).called(1);
    });

    test('can update profile', () {
      final profileEntity = Faker().createProfileEntity();
      when(() => mockProfileDataProvider.update(profileEntity))
          .thenAnswer((_) => Future.value(null));
      profileRepository.update(profileEntity);
      verify(() => mockProfileDataProvider.update(profileEntity)).called(1);
    });

    test('can delete profile', () {
      when(() => mockProfileDataProvider.delete('test_id'))
          .thenAnswer((_) => Future.value(null));
      profileRepository.delete('test_id');
      verify(() => mockProfileDataProvider.delete('test_id')).called(1);
    });

    test('can query profiles', () {
      final profileEntity = Faker().createProfileEntity();
      when(() => mockProfileDataProvider.query())
          .thenAnswer((_) => Future.value([profileEntity]));
      profileRepository.query();
      verify(() => mockProfileDataProvider.query()).called(1);
    });

    test('can query profiles stream', () {
      when(() => mockProfileDataProvider.queryStream())
          .thenAnswer((_) => profileQueryStreamController.stream);
      profileRepository.queryStream();
      verify(() => mockProfileDataProvider.queryStream())
          .called(1);
    });

  });

}
