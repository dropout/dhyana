import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:core/core.dart';
import 'package:stats/src/data/datasource/faker_stats_extension.dart';
import 'package:stats/src/domain/entity/day_details_entity.dart';
import 'package:stats/src/domain/entity/stats_session_entity.dart';
import 'package:stats/src/data/datasource/firebase_stats_data_provider_factory.dart';
import 'package:stats/src/data/repository/firebase_stats_repository.dart';
import 'package:stats/src/domain/entity/stats_bucket_entity.dart';
import 'package:stats/src/domain/repository/stats_repository.dart';

import '../../stats_mock_definitions.dart';

void main() {
  final fakeFactory = Faker();

  setUpAll(() {
    registerFallbackValue(DateTime.now());
    registerFallbackValue(fakeFactory.createDayStatsBucketEntity());
    registerFallbackValue(fakeFactory.createWeekStatsBucketEntity());
    registerFallbackValue(fakeFactory.createMonthStatsBucketEntity());
    registerFallbackValue(fakeFactory.createYearStatsBucketEntity());
    registerFallbackValue(fakeFactory.createDayDetailsEntity());
    registerFallbackValue(fakeFactory.createSessionEntity());
  });

  group('FirebaseStatisticsRepository', () {
    late FirebaseStatsDataProviderFactory dataProviderFactory;
    late StatsRepository repository;

    setUp(() {
      dataProviderFactory = MockStatsDataProviderFactory();
      repository = FirestoreStatsRepository(
        dataProviderFactory: dataProviderFactory,
      );
    });

    group('generic bucket retrieval', () {
      test('getBucket', () async {
        final mockDayDataProvider = MockStatsBucketDataProvider();
        final profileId = 'profileId';
        final dateTime = DateTime.now();

        when(
          () => dataProviderFactory.createStatsBucketDataProvider(
            profileId,
            .days,
          ),
        ).thenReturn(mockDayDataProvider);

        when(
          () => mockDayDataProvider.read(dateTime.toDayId()),
        ).thenAnswer((_) async => fakeFactory.createDayStatsBucketEntity());

        final result = await repository.getBucket(
          profileId,
          dateTime,
          granularity: .days,
        );

        expect(result, isA<DayStatsBucketEntity>());

        verify(
          () => dataProviderFactory.createStatsBucketDataProvider(
            profileId,
            .days,
          ),
        ).called(1);
        verify(() => mockDayDataProvider.read(dateTime.toDayId())).called(1);
      });

      test('queryBuckets', () async {
        final mockDayDataProvider = MockStatsBucketDataProvider();
        final profileId = 'profileId';
        final from = DateTime.now();
        final to = from.add(const Duration(days: 7));

        when(
          () => dataProviderFactory.createStatsBucketDataProvider(
            profileId,
            .weeks,
          ),
        ).thenReturn(mockDayDataProvider);

        when(() => mockDayDataProvider.query(from: from, to: to)).thenAnswer(
          (_) async => fakeFactory.createWeekStatsBucketEntityList(5),
        );

        final result = await repository.queryBuckets(
          profileId,
          from: from,
          to: to,
          granularity: .weeks,
        );

        expect(result, isA<List<WeekStatsBucketEntity>>());

        verify(
          () => dataProviderFactory.createStatsBucketDataProvider(
            profileId,
            .weeks,
          ),
        ).called(1);
        verify(() => mockDayDataProvider.query(from: from, to: to)).called(1);
      });
    });

    group('getDayDetails', () {
      test('returns DayDetails for valid profileId and dateTime', () async {
        final mockDetailDayDataProvider = MockDayDetailsDataProvider();
        final profileId = 'profileId';
        final dateTime = DateTime.now();

        when(
          () => dataProviderFactory.createDayDetailsDataProvider(profileId),
        ).thenReturn(mockDetailDayDataProvider);

        when(
          () => mockDetailDayDataProvider.read(dateTime.toDayId()),
        ).thenAnswer((_) async => fakeFactory.createDayDetailsEntity());

        final result = await repository.getDayDetails(profileId, dateTime);

        expect(result, isA<DayDetailsEntity>());

        verify(
          () => dataProviderFactory.createDayDetailsDataProvider(profileId),
        ).called(1);
        verify(
          () => mockDetailDayDataProvider.read(dateTime.toDayId()),
        ).called(1);
      });
    });

    group('get specific bucket', () {
      test('returns Day for valid profileId and dateTime', () async {
        final mockDayDataProvider = MockStatsBucketDataProvider();
        final profileId = 'profileId';
        final dateTime = DateTime.now();

        when(
          () => dataProviderFactory.createStatsBucketDataProvider(
            profileId,
            .days,
          ),
        ).thenReturn(mockDayDataProvider);

        when(
          () => mockDayDataProvider.read(dateTime.toDayId()),
        ).thenAnswer((_) async => fakeFactory.createDayStatsBucketEntity());

        final result = await repository.getDay(profileId, dateTime);

        expect(result, isA<DayStatsBucketEntity>());

        verify(
          () => dataProviderFactory.createStatsBucketDataProvider(
            profileId,
            .days,
          ),
        ).called(1);
        verify(() => mockDayDataProvider.read(dateTime.toDayId())).called(1);
      });

      test('returns Week for valid profileId and dateTime', () async {
        final mockWeekDataProvider = MockStatsBucketDataProvider();
        final profileId = 'profileId';
        final dateTime = DateTime.now();

        when(
          () => dataProviderFactory.createStatsBucketDataProvider(
            profileId,
            .weeks,
          ),
        ).thenReturn(mockWeekDataProvider);

        when(
          () => mockWeekDataProvider.read(dateTime.toWeekId()),
        ).thenAnswer((_) async => fakeFactory.createWeekStatsBucketEntity());

        final result = await repository.getWeek(profileId, dateTime);

        expect(result, isA<WeekStatsBucketEntity>());

        verify(
          () => dataProviderFactory.createStatsBucketDataProvider(
            profileId,
            .weeks,
          ),
        ).called(1);
        verify(() => mockWeekDataProvider.read(dateTime.toWeekId())).called(1);
      });

      test('returns Month for valid profileId and dateTime', () async {
        final mockMonthDataProvider = MockStatsBucketDataProvider();
        final profileId = 'profileId';
        final dateTime = DateTime.now();

        when(
          () => dataProviderFactory.createStatsBucketDataProvider(
            profileId,
            .months,
          ),
        ).thenReturn(mockMonthDataProvider);

        when(
          () => mockMonthDataProvider.read(dateTime.toMonthId()),
        ).thenAnswer((_) async => fakeFactory.createMonthStatsBucketEntity());

        final result = await repository.getMonth(profileId, dateTime);

        expect(result, isA<MonthStatsBucketEntity>());

        verify(
          () => dataProviderFactory.createStatsBucketDataProvider(
            profileId,
            .months,
          ),
        ).called(1);
        verify(
          () => mockMonthDataProvider.read(dateTime.toMonthId()),
        ).called(1);
      });

      test('returns Year for valid profileId and dateTime', () async {
        final mockYearDataProvider = MockStatsBucketDataProvider();
        final profileId = 'profileId';
        final dateTime = DateTime.now();

        when(
          () => dataProviderFactory.createStatsBucketDataProvider(
            profileId,
            .years,
          ),
        ).thenReturn(mockYearDataProvider);

        when(
          () => mockYearDataProvider.read(dateTime.toYearId()),
        ).thenAnswer((_) async => fakeFactory.createYearStatsBucketEntity());

        final result = await repository.getYear(profileId, dateTime);

        expect(result, isA<YearStatsBucketEntity>());

        verify(
          () => dataProviderFactory.createStatsBucketDataProvider(
            profileId,
            .years,
          ),
        ).called(1);
        verify(() => mockYearDataProvider.read(dateTime.toYearId())).called(1);
      });
    });

    group('logDayStats', () {
      late MockStatsBucketDataProvider mockDayProvider;
      late MockDayDetailsDataProvider mockDayDetailsProvider;
      late String profileId;
      late StatsSessionEntity statsSession;

      setUp(() {
        mockDayProvider = MockStatsBucketDataProvider();
        mockDayDetailsProvider = MockDayDetailsDataProvider();
        profileId = 'profileId';
        final session = fakeFactory.createSessionEntity();
        statsSession = StatsSessionEntity(
          id: session.id,
          type: session.type,
          startTime: session.startTime,
          endTime: session.endTime,
          duration: session.duration,
        );
        when(() => dataProviderFactory.createStatsBucketDataProvider(any(), .days))
            .thenReturn(mockDayProvider);
        when(() => dataProviderFactory.createDayDetailsDataProvider(any()))
            .thenReturn(mockDayDetailsProvider);
        when(() => mockDayProvider.set(any(), merge: true))
            .thenAnswer((_) async {});
        when(() => mockDayDetailsProvider.set(any(), merge: true))
            .thenAnswer((_) async {});
      });

      test('updates existing bucket and details when they exist', () async {
        final existing = fakeFactory.createDayStatsBucketEntity(startDate: statsSession.startTime);
        final existingDetails = fakeFactory.createDayDetailsEntity(startDate: statsSession.startTime);

        when(() => mockDayProvider.read(statsSession.startTime.toDayId()))
            .thenAnswer((_) async => existing);
        when(() => mockDayDetailsProvider.read(statsSession.startTime.toDayId()))
            .thenAnswer((_) async => existingDetails);

        await (repository as FirestoreStatsRepository)
            .logDayStats(statsSession, profileId, 3);

        final bucketCapture = verify(() => mockDayProvider.set(captureAny(), merge: true)).captured;
        final updated = bucketCapture.first as DayStatsBucketEntity;
        expect(updated.sessionCount, existing.sessionCount + 1);
        expect(updated.minutesCount, existing.minutesCount + statsSession.duration.inMinutes);

        final detailsCapture = verify(() => mockDayDetailsProvider.set(captureAny(), merge: true)).captured;
        final updatedDetails = detailsCapture.first as DayDetailsEntity;
        expect(updatedDetails.sessions.length, existingDetails.sessions.length + 1);
        expect(updatedDetails.consecutiveDaysCount, 3);
      });

      test('creates new bucket and details when they do not exist', () async {
        when(() => mockDayProvider.read(statsSession.startTime.toDayId()))
            .thenThrow(Exception('not found'));
        when(() => mockDayDetailsProvider.read(statsSession.startTime.toDayId()))
            .thenThrow(Exception('not found'));

        await (repository as FirestoreStatsRepository)
            .logDayStats(statsSession, profileId, 1);

        final bucketCapture = verify(() => mockDayProvider.set(captureAny(), merge: true)).captured;
        final newBucket = bucketCapture.first as DayStatsBucketEntity;
        expect(newBucket.sessionCount, 1);
        expect(newBucket.minutesCount, statsSession.duration.inMinutes);

        final detailsCapture = verify(() => mockDayDetailsProvider.set(captureAny(), merge: true)).captured;
        final newDetails = detailsCapture.first as DayDetailsEntity;
        expect(newDetails.sessions.length, 1);
        expect(newDetails.consecutiveDaysCount, 1);
      });
    });

    group('logWeekStats', () {
      late MockStatsBucketDataProvider mockWeekProvider;
      late String profileId;
      late StatsSessionEntity statsSession;

      setUp(() {
        mockWeekProvider = MockStatsBucketDataProvider();
        profileId = 'profileId';
        final session = fakeFactory.createSessionEntity();
        statsSession = StatsSessionEntity(
          id: session.id,
          type: session.type,
          startTime: session.startTime,
          endTime: session.endTime,
          duration: session.duration,
        );
        when(() => dataProviderFactory.createStatsBucketDataProvider(any(), .weeks))
            .thenReturn(mockWeekProvider);
        when(() => mockWeekProvider.set(any(), merge: true))
            .thenAnswer((_) async {});
      });

      test('updates existing bucket when it exists', () async {
        final existing = fakeFactory.createWeekStatsBucketEntity(startDate: statsSession.startTime);

        when(() => mockWeekProvider.read(statsSession.startTime.toWeekId()))
            .thenAnswer((_) async => existing);

        await (repository as FirestoreStatsRepository)
            .logWeekStats(statsSession, profileId);

        final captured = verify(() => mockWeekProvider.set(captureAny(), merge: true)).captured;
        final updated = captured.first as WeekStatsBucketEntity;
        expect(updated.sessionCount, existing.sessionCount + 1);
        expect(updated.minutesCount, existing.minutesCount + statsSession.duration.inMinutes);
      });

      test('creates new bucket when it does not exist', () async {
        when(() => mockWeekProvider.read(statsSession.startTime.toWeekId()))
            .thenThrow(Exception('not found'));

        await (repository as FirestoreStatsRepository)
            .logWeekStats(statsSession, profileId);

        final captured = verify(() => mockWeekProvider.set(captureAny(), merge: true)).captured;
        final newBucket = captured.first as WeekStatsBucketEntity;
        expect(newBucket.sessionCount, 1);
        expect(newBucket.minutesCount, statsSession.duration.inMinutes);
      });
    });

    group('logMonthStats', () {
      late MockStatsBucketDataProvider mockMonthProvider;
      late String profileId;
      late StatsSessionEntity statsSession;

      setUp(() {
        mockMonthProvider = MockStatsBucketDataProvider();
        profileId = 'profileId';
        final session = fakeFactory.createSessionEntity();
        statsSession = StatsSessionEntity(
          id: session.id,
          type: session.type,
          startTime: session.startTime,
          endTime: session.endTime,
          duration: session.duration,
        );
        when(() => dataProviderFactory.createStatsBucketDataProvider(any(), .months))
            .thenReturn(mockMonthProvider);
        when(() => mockMonthProvider.set(any(), merge: true))
            .thenAnswer((_) async {});
      });

      test('updates existing bucket when it exists', () async {
        final existing = fakeFactory.createMonthStatsBucketEntity(startDate: statsSession.startTime);

        when(() => mockMonthProvider.read(statsSession.startTime.toMonthId()))
            .thenAnswer((_) async => existing);

        await (repository as FirestoreStatsRepository)
            .logMonthStats(statsSession, profileId);

        final captured = verify(() => mockMonthProvider.set(captureAny(), merge: true)).captured;
        final updated = captured.first as MonthStatsBucketEntity;
        expect(updated.sessionCount, existing.sessionCount + 1);
        expect(updated.minutesCount, existing.minutesCount + statsSession.duration.inMinutes);
      });

      test('creates new bucket when it does not exist', () async {
        when(() => mockMonthProvider.read(statsSession.startTime.toMonthId()))
            .thenThrow(Exception('not found'));

        await (repository as FirestoreStatsRepository)
            .logMonthStats(statsSession, profileId);

        final captured = verify(() => mockMonthProvider.set(captureAny(), merge: true)).captured;
        final newBucket = captured.first as MonthStatsBucketEntity;
        expect(newBucket.sessionCount, 1);
        expect(newBucket.minutesCount, statsSession.duration.inMinutes);
      });
    });

    group('logYearStats', () {
      late MockStatsBucketDataProvider mockYearProvider;
      late String profileId;
      late StatsSessionEntity statsSession;

      setUp(() {
        mockYearProvider = MockStatsBucketDataProvider();
        profileId = 'profileId';
        final session = fakeFactory.createSessionEntity();
        statsSession = StatsSessionEntity(
          id: session.id,
          type: session.type,
          startTime: session.startTime,
          endTime: session.endTime,
          duration: session.duration,
        );
        when(() => dataProviderFactory.createStatsBucketDataProvider(any(), .years))
            .thenReturn(mockYearProvider);
        when(() => mockYearProvider.set(any(), merge: true))
            .thenAnswer((_) async {});
      });

      test('updates existing bucket when it exists', () async {
        final existing = fakeFactory.createYearStatsBucketEntity(startDate: statsSession.startTime);

        when(() => mockYearProvider.read(statsSession.startTime.toYearId()))
            .thenAnswer((_) async => existing);

        await (repository as FirestoreStatsRepository)
            .logYearStats(statsSession, profileId);

        final captured = verify(() => mockYearProvider.set(captureAny(), merge: true)).captured;
        final updated = captured.first as YearStatsBucketEntity;
        expect(updated.sessionCount, existing.sessionCount + 1);
        expect(updated.minutesCount, existing.minutesCount + statsSession.duration.inMinutes);
      });

      test('creates new bucket when it does not exist', () async {
        when(() => mockYearProvider.read(statsSession.startTime.toYearId()))
            .thenThrow(Exception('not found'));

        await (repository as FirestoreStatsRepository)
            .logYearStats(statsSession, profileId);

        final captured = verify(() => mockYearProvider.set(captureAny(), merge: true)).captured;
        final newBucket = captured.first as YearStatsBucketEntity;
        expect(newBucket.sessionCount, 1);
        expect(newBucket.minutesCount, statsSession.duration.inMinutes);
      });
    });

  });
}
