import 'dart:math';

import 'package:dhyana/core/util/date_time_utils.dart';
import 'package:dhyana/modules/insights/domain/entity/day_details_entity.dart';
import 'package:dhyana/modules/insights/domain/entity/insights_session_entity.dart';
import 'package:dhyana/modules/insights/domain/entity/stats_bucket_entity.dart';
import 'package:dhyana/modules/insights/domain/enum/stats_entity_granularity.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:flutter/material.dart';

class BucketFillingRepository implements StatisticsRepository {
  final StatisticsRepository statisticsRepository;

  const BucketFillingRepository({
    required this.statisticsRepository,
  });

  @override
  Future<StatsBucketEntity> getBucket(
    String profileId,
    DateTime dateTime, {
    required StatsEntityGranularity granularity,
  }) async {
    return statisticsRepository.getBucket(
      profileId,
      dateTime,
      granularity: granularity,
    );
  }

  @override
  Future<List<StatsBucketEntity>> queryBuckets(
    String profileId, {
    required DateTime from,
    required DateTime to,
    required StatsEntityGranularity granularity,
  }) async {
    switch (granularity) {
      case StatsEntityGranularity.day:
        return (await queryDays(profileId, from: from, to: to))
            .map(
              (day) => StatsBucketEntity.day(
                id: day.id,
                startDate: day.startDate,
                minutesCount: day.minutesCount,
                sessionCount: day.sessionCount,
              ),
            )
            .toList();
      case StatsEntityGranularity.week:
        return (await queryWeeks(profileId, from: from, to: to))
            .map(
              (week) => StatsBucketEntity.week(
                id: week.id,
                startDate: week.startDate,
                minutesCount: week.minutesCount,
                sessionCount: week.sessionCount,
              ),
            )
            .toList();
      case StatsEntityGranularity.month:
        return (await queryMonths(profileId, from: from, to: to))
            .map(
              (month) => StatsBucketEntity.month(
                id: month.id,
                startDate: month.startDate,
                minutesCount: month.minutesCount,
                sessionCount: month.sessionCount,
              ),
            )
            .toList();
      case StatsEntityGranularity.year:
        return (await queryYears(profileId, from: from, to: to))
            .map(
              (year) => StatsBucketEntity.year(
                id: year.id,
                startDate: year.startDate,
                minutesCount: year.minutesCount,
                sessionCount: year.sessionCount,
              ),
            )
            .toList();
    }
  }

  @override
  Future<DayStatsBucketEntity> getDay(String profileId, DateTime dateTime) async {
    return statisticsRepository.getDay(profileId, dateTime);
  }

  @override
  Future<DayDetailsEntity> getDayDetails(String profileId, DateTime dateTime) async {
    return statisticsRepository.getDayDetails(profileId, dateTime);
  }

  @override
  Future<({DayStatsBucketEntity bucket, DayDetailsEntity details})> getDayWithDetails(
    String profileId,
    DateTime dateTime,
  ) async {
    return statisticsRepository.getDayWithDetails(profileId, dateTime);
  }

  @override
  Future<WeekStatsBucketEntity> getWeek(String profileId, DateTime dateTime) async {
    return statisticsRepository.getWeek(profileId, dateTime);
  }

  @override
  Future<MonthStatsBucketEntity> getMonth(String profileId, DateTime dateTime) async {
    return statisticsRepository.getMonth(profileId, dateTime);
  }

  @override
  Future<YearStatsBucketEntity> getYear(String profileId, DateTime dateTime) async {
    return statisticsRepository.getYear(profileId, dateTime);
  }

  @override
  Future<List<DayStatsBucketEntity>> queryDays(
    String profileId, {
    required DateTime from,
    required DateTime to,
  }) async {
    final days = await statisticsRepository.queryDays(profileId, from: from, to: to);

    return _fillBuckets(
      existingBuckets: days,
      count: _dayCount(from, to),
      startDateAt: (i) => DateTime(from.year, from.month, from.day + i),
      idForDate: (date) => date.toDayId(),
      createEmpty: (id, startDate) => DayStatsBucketEntity(
        id: id,
        startDate: startDate,
      ),
    );
  }

  @override
  Future<List<WeekStatsBucketEntity>> queryWeeks(
    String profileId, {
    required DateTime from,
    required DateTime to,
  }) async {
    final weeks = await statisticsRepository.queryWeeks(profileId, from: from, to: to);

    return _fillBuckets(
      existingBuckets: weeks,
      count: _weekCount(from, to),
      startDateAt: (i) => DateTime(from.year, from.month, from.day + (i * 7)),
      idForDate: (date) => date.toWeekId(),
      createEmpty: (id, startDate) => WeekStatsBucketEntity(
        id: id,
        startDate: startDate,
      ),
    );
  }

  @override
  Future<List<MonthStatsBucketEntity>> queryMonths(
    String profileId, {
    required DateTime from,
    required DateTime to,
  }) async {
    final months = await statisticsRepository.queryMonths(profileId, from: from, to: to);

    return _fillBuckets(
      existingBuckets: months,
      count: _monthCount(from, to),
      startDateAt: (i) => DateTime(from.year, from.month + i),
      idForDate: (date) => date.toMonthId(),
      createEmpty: (id, startDate) => MonthStatsBucketEntity(
        id: id,
        startDate: startDate,
        minutesCount: 0,
        sessionCount: 0,
      ),
    );
  }

  @override
  Future<List<YearStatsBucketEntity>> queryYears(
    String profileId, {
    required DateTime from,
    required DateTime to,
  }) async {
    final years = await statisticsRepository.queryYears(profileId, from: from, to: to);

    return _fillBuckets(
      existingBuckets: years,
      count: _yearCount(from, to),
      startDateAt: (i) => DateTime(from.year + i, 1, 1),
      idForDate: (date) => date.toYearId(),
      createEmpty: (id, startDate) => YearStatsBucketEntity(
        id: id,
        startDate: startDate,
        minutesCount: 0,
        sessionCount: 0,
      ),
    );
  }

  @override
  Future<List<({DayStatsBucketEntity bucket, DayDetailsEntity details})>> queryDaysWithDetails(
    String profileId, {
    required DateTime from,
    required DateTime to,
  }) async {
    final buckets = await queryDays(profileId, from: from, to: to);
    final existingDetails = await statisticsRepository.queryDaysWithDetails(profileId, from: from, to: to);
    final detailsByBucketId = {
      for (final entry in existingDetails) entry.bucket.id: entry.details,
    };

    return buckets.map((bucket) {
      final details = detailsByBucketId[bucket.id];
      return (
        bucket: bucket,
        details: details ??
            DayDetailsEntity(
              id: bucket.id,
              startDate: bucket.startDate,
            ),
      );
    }).toList();
  }

  @override
  Future<void> logSessionStatistics(
    String profileId,
    InsightsSessionEntity session,
    int consecutiveDaysCount,
  ) async {
    await statisticsRepository.logSessionStatistics(
      profileId,
      session,
      consecutiveDaysCount,
    );
  }

  List<TBucket> _fillBuckets<TBucket extends StatsBucketEntity>({
    required List<TBucket> existingBuckets,
    required int count,
    required DateTime Function(int index) startDateAt,
    required String Function(DateTime date) idForDate,
    required TBucket Function(String id, DateTime startDate) createEmpty,
  }) {
    final existingById = {
      for (final bucket in existingBuckets) bucket.id: bucket,
    };

    return List.generate(count, (i) {
      final startDate = startDateAt(i);
      final id = idForDate(startDate);
      return existingById[id] ?? createEmpty(id, startDate);
    });
  }

  int _dayCount(DateTime from, DateTime to) {
    return max(0, to.difference(from).inDays.abs() + 1);
  }

  int _weekCount(DateTime from, DateTime to) {
    final daysBetween = to.difference(from).inDays.abs();
    return max(1, ((daysBetween + 1) / 7).ceil());
  }

  int _monthCount(DateTime from, DateTime to) {
    return max(0, DateUtils.monthDelta(from, to) + 1);
  }

  int _yearCount(DateTime from, DateTime to) {
    return max(0, to.year - from.year + 1);
  }
}
