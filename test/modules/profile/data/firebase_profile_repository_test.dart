import 'dart:async';

import 'package:dhyana/modules/profile/data/datasource/profile_data_provider.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_entity.dart';
import 'package:dhyana/modules/profile/data/repository/default_profile_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileDataProvider
  extends Mock
  implements ProfileDataProvider {}

class MockStorageDataProvider
  extends Mock
  implements StorageDataProvider {}

class MockProfileEntity
  extends Mock
  implements ProfileEntity {

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MockProfile';
  }
} 

void main() {

  group('FirebaseProfileRepositoryTest', () {

    late StreamController<MockProfileEntity> profileStreamController;
    late StreamController<List<MockProfileEntity>> profileQueryStreamController;
    late MockProfileDataProvider mockProfileDataProvider;
    late MockProfileEntity mockProfile;
    late DefaultProfileRepository firebaseProfileRepository;

    setUp(() {
      profileStreamController = StreamController<MockProfileEntity>(sync: true);
      profileQueryStreamController =
          StreamController<List<MockProfileEntity>>(sync: true);
      mockProfileDataProvider = MockProfileDataProvider();
      mockProfile = MockProfileEntity();
      firebaseProfileRepository = DefaultProfileRepository(
        profileDataProvider: mockProfileDataProvider,
      );
    });

    tearDown(() {
      profileStreamController.close();
    });

    test('can read profile by id', () {
      when(() => mockProfileDataProvider.read('test_id'))
          .thenAnswer((_) => Future.value(mockProfile));
      firebaseProfileRepository.read('test_id');
      verify(() => mockProfileDataProvider.read('test_id')).called(1);
    });

    test('can read profile stream by id', () {
      when(() => mockProfileDataProvider.readStream('test_id'))
          .thenAnswer((_) => profileStreamController.stream);
      firebaseProfileRepository.readStream('test_id');
      verify(() => mockProfileDataProvider.readStream('test_id')).called(1);
    });

    test('can update profile', () {
      when(() => mockProfileDataProvider.update(mockProfile))
          .thenAnswer((_) => Future.value(null));
      firebaseProfileRepository.update(mockProfile);
      verify(() => mockProfileDataProvider.update(mockProfile)).called(1);
    });

    test('can delete profile', () {
      when(() => mockProfileDataProvider.delete('test_id'))
          .thenAnswer((_) => Future.value(null));
      firebaseProfileRepository.delete('test_id');
      verify(() => mockProfileDataProvider.delete('test_id')).called(1);
    });

    test('can query profiles', () {
      when(() => mockProfileDataProvider.query())
          .thenAnswer((_) => Future.value([mockProfile]));
      firebaseProfileRepository.query();
      verify(() => mockProfileDataProvider.query()).called(1);
    });

    test('can query profiles stream', () {
      when(() => mockProfileDataProvider.queryStream())
          .thenAnswer((_) => profileQueryStreamController.stream);
      firebaseProfileRepository.queryStream();
      verify(() => mockProfileDataProvider.queryStream())
          .called(1);
    });

  });

}
