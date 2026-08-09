import 'package:dhyana/modules/insights/domain/entity/day.dart';
import 'package:dhyana/modules/insights/domain/entity/insights_session_entity.dart';
import 'package:dhyana/modules/insights/domain/entity/month.dart';
import 'package:dhyana/modules/insights/domain/entity/week.dart';
import 'package:dhyana/modules/insights/domain/entity/year.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/core/util/date_time_utils.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:flutter/material.dart';

class StubbedStatisticsRepository implements StatisticsRepository {

  final FakeModelFactory _fakeModelFactory = FakeModelFactory();

  @override
  Future<Day> getDay(String profileId, DateTime dateTime) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(_fakeModelFactory.createDay(
      startDate: dateTime,
    ));
  }

  @override
  Future<Week> getWeek(String profileId, DateTime dateTime) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(_fakeModelFactory.createWeek());
  }

  @override
  Future<Month> getMonth(String profileId, DateTime dateTime) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(_fakeModelFactory.createMonth());
  }

  @override
  Future<Year> getYear(String profileId, DateTime dateTime) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(_fakeModelFactory.createYear());
  }

  @override
  Future<List<Day>> queryDays(String profileId, {required DateTime from, required DateTime to}) async {
    await Future.delayed(Duration(milliseconds: 500));
    Duration difference = from.difference(to);
    List<Day> days = [];
    for (var i = 0; i < difference.inDays.abs(); ++i) {
      DateTime date = from.add(Duration(days: i));
      Day day = _fakeModelFactory.createDay(
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
  Future<List<Week>> queryWeeks(String profileId, {required DateTime from, required DateTime to}) async {
    await Future.delayed(Duration(seconds: 1));
    Duration diff = to.difference(from);
    int weeksCount = (diff.inDays / 7).ceil();

    List<Week> weeks = [];
    for (var i = 0; i < weeksCount; ++i) {
      DateTime date = from.add(Duration(days: i * 7));
      Week week = _fakeModelFactory.createWeek(startDate: date);
      week = week.copyWith(
        id: date.toWeekId(),
      );
      weeks.add(week);
    }

    return Future.value(weeks);
  }

  @override
  Future<List<Month>> queryMonths(
    String profileId,
    {required DateTime from, required DateTime to}
  ) async {
    await Future.delayed(Duration(seconds: 1));
    int monthsCount = DateUtils.monthDelta(from, to);
    List<Month> months = [];
    for (var i = 0; i < monthsCount; ++i) {
      DateTime date = from.copyWith(
        month: from.month + i,
      );
      Month month = _fakeModelFactory.createMonth(startDate: date);
      month = month.copyWith(
        id: date.toMonthId(),
      );
      months.add(month);
    }

    return Future.value(months);
  }

  @override
  Future<List<Year>> queryYears(String profileId, {required DateTime from, required DateTime to}) async {
    await Future.delayed(Duration(seconds: 1));
    int yearsCount = to.year - from.year;
    List<Year> years = [];
    for (var i = 0; i <= yearsCount - 1; ++i) {
      DateTime date = from.copyWith(
        year: from.year + i,
      );
      Year year = _fakeModelFactory.createYear(startDate: date);
      year = year.copyWith(
        id: date.toYearId(),
      );
      years.add(year);
    }
    return Future.value(years);
  }

  @override
  Future<void> logSessionStatistics(String profileId, InsightsSessionEntity session, int consecutiveDaysCount) async {
    return Future.value();
  }
}
