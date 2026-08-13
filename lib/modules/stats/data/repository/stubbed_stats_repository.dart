import 'package:dhyana/modules/stats/domain/entity/day_details_entity.dart';
import 'package:dhyana/modules/stats/domain/entity/insights_session_entity.dart';
import 'package:dhyana/modules/stats/domain/entity/stats_bucket_entity.dart';
import 'package:dhyana/modules/stats/domain/enum/stats_entity_granularity.dart';
import 'package:dhyana/modules/stats/domain/repository/stats_repository.dart';
import 'package:dhyana/core/util/date_time_utils.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:flutter/material.dart';

class StubbedStatsRepository implements StatsRepository {

  final FakeModelFactory _fakeModelFactory = FakeModelFactory();

  @override
  Future<StatsBucketEntity> getBucket(
    String profileId,
    DateTime dateTime, {
    required StatsEntityGranularity granularity,
  }) async {
    switch (granularity) {
      case StatsEntityGranularity.days:
        final day = await getDay(profileId, dateTime);
        return StatsBucketEntity.day(
          id: day.id,
          startDate: day.startDate,
          minutesCount: day.minutesCount,
          sessionCount: day.sessionCount,
        );
      case StatsEntityGranularity.weeks:
        final week = await getWeek(profileId, dateTime);
        return StatsBucketEntity.week(
          id: week.id,
          startDate: week.startDate,
          minutesCount: week.minutesCount,
          sessionCount: week.sessionCount,
        );
      case StatsEntityGranularity.months:
        final month = await getMonth(profileId, dateTime);
        return StatsBucketEntity.month(
          id: month.id,
          startDate: month.startDate,
          minutesCount: month.minutesCount,
          sessionCount: month.sessionCount,
        );
      case StatsEntityGranularity.years:
        final year = await getYear(profileId, dateTime);
        return StatsBucketEntity.year(
          id: year.id,
          startDate: year.startDate,
          minutesCount: year.minutesCount,
          sessionCount: year.sessionCount,
        );
    }
  }

  // @override
  // Future<DayDetailsEntity> getDayDetails(String profileId, DateTime dateTime) async {
  //   final day = await getDay(profileId, dateTime);
  //   return DayDetailsEntity(
  //     id: day.id,
  //     sessions: day.sessions,
  //     consecutiveDaysCount: day.consecutiveDaysCount,
  //   );
  // }

  @override
  Future<List<StatsBucketEntity>> queryBuckets(
    String profileId, {
    required DateTime from,
    required DateTime to,
    required StatsEntityGranularity granularity,
  }) async {
    switch (granularity) {
      case StatsEntityGranularity.days:
        final days = await queryDays(profileId, from: from, to: to);
        return days
            .map((day) => StatsBucketEntity.day(
                  id: day.id,
                  startDate: day.startDate,
                  minutesCount: day.minutesCount,
                  sessionCount: day.sessionCount,
                ))
            .toList();
      case StatsEntityGranularity.weeks:
        final weeks = await queryWeeks(profileId, from: from, to: to);
        return weeks
            .map((week) => StatsBucketEntity.week(
                  id: week.id,
                  startDate: week.startDate,
                  minutesCount: week.minutesCount,
                  sessionCount: week.sessionCount,
                ))
            .toList();
      case StatsEntityGranularity.months:
        final months = await queryMonths(profileId, from: from, to: to);
        return months
            .map((month) => StatsBucketEntity.month(
                  id: month.id,
                  startDate: month.startDate,
                  minutesCount: month.minutesCount,
                  sessionCount: month.sessionCount,
                ))
            .toList();
      case StatsEntityGranularity.years:
        final years = await queryYears(profileId, from: from, to: to);
        return years
            .map((year) => StatsBucketEntity.year(
                  id: year.id,
                  startDate: year.startDate,
                  minutesCount: year.minutesCount,
                  sessionCount: year.sessionCount,
                ))
            .toList();
    }
  }

  @override
  Future<DayStatsBucketEntity> getDay(String profileId, DateTime dateTime, {bool preferCache = false}) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(_fakeModelFactory.createDayStatsBucketEntity(
      startDate: dateTime,
    ));
  }

  @override
  Future<DayDetailsEntity> getDayDetails(String profileId, DateTime dateTime, {bool preferCache = false}) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(_fakeModelFactory.createDayDetailsEntity(
      startDate: dateTime,
    ));
  }

  @override
  Future<WeekStatsBucketEntity> getWeek(String profileId, DateTime dateTime, {bool preferCache = false}) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(_fakeModelFactory.createWeekStatsBucketEntity());
  }

  @override
  Future<MonthStatsBucketEntity> getMonth(String profileId, DateTime dateTime, {bool preferCache = false}) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(_fakeModelFactory.createMonthStatsBucketEntity());
  }

  @override
  Future<YearStatsBucketEntity> getYear(String profileId, DateTime dateTime, {bool preferCache = false}) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(_fakeModelFactory.createYearStatsBucketEntity());
  }

  @override
  Future<List<DayStatsBucketEntity>> queryDays(String profileId, {required DateTime from, required DateTime to}) async {
    await Future.delayed(Duration(milliseconds: 500));
    Duration difference = from.difference(to);
    List<DayStatsBucketEntity> days = [];
    for (var i = 0; i < difference.inDays.abs(); ++i) {
      DateTime date = from.add(Duration(days: i));
      DayStatsBucketEntity day = _fakeModelFactory.createDayStatsBucketEntity(
        startDate: date,
      );
      day = day.copyWith(
        id: date.toDayId(),
      );
      days.add(day);
    }
    return Future.value(days);
  }

  @override
  Future<List<WeekStatsBucketEntity>> queryWeeks(String profileId, {required DateTime from, required DateTime to}) async {
    await Future.delayed(Duration(seconds: 1));
    Duration diff = to.difference(from);
    int weeksCount = (diff.inDays / 7).ceil();

    List<WeekStatsBucketEntity> weeks = [];
    for (var i = 0; i < weeksCount; ++i) {
      DateTime date = from.add(Duration(days: i * 7));
      WeekStatsBucketEntity week = _fakeModelFactory.createWeekStatsBucketEntity(startDate: date);
      week = week.copyWith(
        id: date.toWeekId(),
      );
      weeks.add(week);
    }

    return Future.value(weeks);
  }

  @override
  Future<List<MonthStatsBucketEntity>> queryMonths(
    String profileId,
    {required DateTime from, required DateTime to}
  ) async {
    await Future.delayed(Duration(seconds: 1));
    int monthsCount = DateUtils.monthDelta(from, to);
    List<MonthStatsBucketEntity> months = [];
    for (var i = 0; i < monthsCount; ++i) {
      DateTime date = from.copyWith(
        month: from.month + i,
      );
      MonthStatsBucketEntity month = _fakeModelFactory.createMonthStatsBucketEntity(startDate: date);
      month = month.copyWith(
        id: date.toMonthId(),
      );
      months.add(month);
    }

    return Future.value(months);
  }

  @override
  Future<List<YearStatsBucketEntity>> queryYears(String profileId, {required DateTime from, required DateTime to}) async {
    await Future.delayed(Duration(seconds: 1));
    int yearsCount = to.year - from.year;
    List<YearStatsBucketEntity> years = [];
    for (var i = 0; i <= yearsCount - 1; ++i) {
      DateTime date = from.copyWith(
        year: from.year + i,
      );
      YearStatsBucketEntity year = _fakeModelFactory.createYearStatsBucketEntity(startDate: date);
      year = year.copyWith(
        id: date.toYearId(),
      );
      years.add(year);
    }
    return Future.value(years);
  }

  @override
  Future<void> logSessionStats(String profileId, StatsSessionEntity session, int consecutiveDaysCount) async {
    return Future.value();
  }

  @override
  Future<({DayStatsBucketEntity bucket, DayDetailsEntity details})> getDayWithDetails(String profileId, DateTime dateTime, {bool preferCache = false}) async {
    final day = await getDay(profileId, dateTime, preferCache: preferCache);
    final details = _fakeModelFactory.createDayDetailsEntity(startDate: dateTime);
    return Future.value((bucket: day, details: details));
  }

  @override
  Future<List<({DayStatsBucketEntity bucket, DayDetailsEntity details})>> queryDaysWithDetails(String profileId, {required DateTime from, required DateTime to}) {
    final days = queryDays(profileId, from: from, to: to);
    final details = Future.value(_fakeModelFactory.createDayDetailsEntityList(to.difference(from).inDays.abs()));
    return Future.wait([days, details]).then((results) {
      final days = results[0] as List<DayStatsBucketEntity>;
      final details = results[1] as List<DayDetailsEntity>;
      return List.generate(days.length, (index) => (bucket: days[index], details: details[index]));
    });

  }
}
