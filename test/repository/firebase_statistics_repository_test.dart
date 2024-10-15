import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dhyana/data_provider/firebase/all.dart';
import 'package:dhyana/repository/firebase/firebase_statistics_repository.dart';
import 'package:dhyana/model/all.dart';

class MockFirebaseDataProviderFactory extends Mock implements FirebaseDataProviderFactory {}
class MockFirebaseDayDataProvider extends Mock implements FirebaseDayDataProvider {}
class MockFirebaseMonthDataProvider extends Mock implements FirebaseMonthDataProvider {}
class MockFirebaseYearDataProvider extends Mock implements FirebaseYearDataProvider {}
class MockFirebaseSessionDataProvider extends Mock implements FirebaseSessionDataProvider {}


void main() {

  final fakeFactory = FakeModelFactory();

  setUpAll(() {
    registerFallbackValue(DateTime.now());
    registerFallbackValue(fakeFactory.createDay());
    registerFallbackValue(fakeFactory.createMonth());
    registerFallbackValue(fakeFactory.createYear());
    registerFallbackValue(fakeFactory.createSession());
  });

  group('FirebaseStatisticsRepository', () {
    late FirebaseDataProviderFactory dataProviderFactory;
    late FirebaseStatisticsRepository repository;

    setUp(() {
      dataProviderFactory = MockFirebaseDataProviderFactory();
      repository = FirebaseStatisticsRepository(dataProviderFactory: dataProviderFactory);
    });

    group('getDay', () {
      test('returns Day for valid profileId and dateTime', () async {
        final mockDayDataProvider = MockFirebaseDayDataProvider();
        when(() => dataProviderFactory.createDayDataProvider(any())).thenReturn(mockDayDataProvider);
        when(() => mockDayDataProvider.read(any())).thenAnswer((_) async => fakeFactory.createDay());

        final result = await repository.getDay(
          'profileId',
          DateTime.now().subtract(const Duration(days: 30))
        );
        expect(result, isA<Day>());
      });

    });

    group('getMonth', () {
      test('returns Month for valid profileId and dateTime', () async {
        final mockMonthDataProvider = MockFirebaseMonthDataProvider();
        when(() => dataProviderFactory.createMonthDataProvider(any())).thenReturn(mockMonthDataProvider);
        when(() => mockMonthDataProvider.read(any())).thenAnswer((_) async => fakeFactory.createMonth());

        final result = await repository.getMonth('profileId', DateTime.now());

        expect(result, isA<Month>());
      });

    });

    group('getYear', () {
      test('returns Year for valid profileId and dateTime', () async {
        final mockYearDataProvider = MockFirebaseYearDataProvider();
        when(() => dataProviderFactory.createYearDataProvider(any())).thenReturn(mockYearDataProvider);
        when(() => mockYearDataProvider.read(any())).thenAnswer((_) async => fakeFactory.createYear());

        final result = await repository.getYear('profileId', DateTime.now());

        expect(result, isA<Year>());
      });

    });

    group('getSession', () {
      test('returns Session for valid profileId and sessionId', () async {
        final mockSessionDataProvider = MockFirebaseSessionDataProvider();
        when(() => dataProviderFactory.createSessionDataProvider(any())).thenReturn(mockSessionDataProvider);
        when(() => mockSessionDataProvider.read(any())).thenAnswer((_) async => fakeFactory.createSession());

        final result = await repository.getSession('profileId', 'sessionId');

        expect(result, isA<Session>());
      });

    });

    group('logSession', () {
      test('logs session for valid profile and session', () async {
        Profile profile = fakeFactory.createProfile();
        Session session = fakeFactory.createSession();

        final mockSessionDataProvider = MockFirebaseSessionDataProvider();
        final mockDayDataProvider = MockFirebaseDayDataProvider();
        final mockMonthDataProvider = MockFirebaseMonthDataProvider();
        final mockYearDataProvider = MockFirebaseYearDataProvider();

        when(() => dataProviderFactory.createSessionDataProvider(any())).thenReturn(mockSessionDataProvider);
        when(() => dataProviderFactory.createDayDataProvider(any())).thenReturn(mockDayDataProvider);
        when(() => dataProviderFactory.createMonthDataProvider(any())).thenReturn(mockMonthDataProvider);
        when(() => dataProviderFactory.createYearDataProvider(any())).thenReturn(mockYearDataProvider);

        when(() => mockSessionDataProvider.create(session)).thenAnswer((_) async => Future<void>.value());
        when(() => mockDayDataProvider.logSession(session, profile)).thenAnswer((_) async => Future<void>.value());
        when(() => mockMonthDataProvider.logSession(session)).thenAnswer((_) async => Future<void>.value());
        when(() => mockYearDataProvider.logSession(session)).thenAnswer((_) async => Future<void>.value());

        await repository.logSession(profile, session);

        verify(() => mockSessionDataProvider.create(session)).called(1);
        verify(() => mockDayDataProvider.logSession(session, profile)).called(1);
        verify(() => mockMonthDataProvider.logSession(session)).called(1);
        verify(() => mockYearDataProvider.logSession(session)).called(1);
      });

    });
  });
}
