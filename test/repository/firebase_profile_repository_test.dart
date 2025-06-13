import 'dart:async';

import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_query_options.dart';
import 'package:dhyana/repository/firebase/all.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileDataProvider
  extends Mock
  implements ProfileDataProvider {}

class MockStorageDataProvider
  extends Mock
  implements StorageDataProvider {}

class MockProfile
  extends Mock
  implements Profile {

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MockProfile';
  }
}

void main() {

  group('FirebaseProfileRepositoryTest', () {

    late StreamController<MockProfile> profileStreamController;
    late StreamController<List<MockProfile>> profileQueryStreamController;
    late MockProfileDataProvider mockProfileDataProvider;
    late MockStorageDataProvider mockStorageDataProvider;
    late MockProfile mockProfile;
    late FirebaseProfileRepository firebaseProfileRepository;

    setUp(() {
      profileStreamController = StreamController<MockProfile>(sync: true);
      profileQueryStreamController =
          StreamController<List<MockProfile>>(sync: true);
      mockProfileDataProvider = MockProfileDataProvider();
      mockStorageDataProvider = MockStorageDataProvider();
      mockProfile = MockProfile();
      firebaseProfileRepository = FirebaseProfileRepository(
        profileDataProvider: mockProfileDataProvider,
        storageDataProvider: mockStorageDataProvider
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
      ProfileQueryOptions profileQueryOptions = const ProfileQueryOptions();
      when(() => mockProfileDataProvider.query(profileQueryOptions))
          .thenAnswer((_) => Future.value([mockProfile]));
      firebaseProfileRepository.query(const ProfileQueryOptions());
      verify(() => mockProfileDataProvider.query(profileQueryOptions)).called(1);
    });

    test('can query profiles stream', () {
      ProfileQueryOptions profileQueryOptions = const ProfileQueryOptions();
      when(() => mockProfileDataProvider.queryStream(profileQueryOptions))
          .thenAnswer((_) => profileQueryStreamController.stream);
      firebaseProfileRepository.queryStream(const ProfileQueryOptions());
      verify(() => mockProfileDataProvider.queryStream(profileQueryOptions))
          .called(1);
    });

  });

}
