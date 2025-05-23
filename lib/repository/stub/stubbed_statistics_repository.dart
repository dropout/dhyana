import 'package:dhyana/model/all.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
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
  Future<Session> getSession(String profileId, String sessionId) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(_fakeModelFactory.createSession());
  }

  @override
  Future<List<Day>> queryDays(String profileId, DayQueryOptions queryOptions) async {
    await Future.delayed(Duration(milliseconds: 500));
    Duration difference = queryOptions.from.difference(queryOptions.to);
    List<Day> days = [];
    for (var i = 0; i < difference.inDays.abs(); ++i) {
      DateTime date = queryOptions.from.add(Duration(days: i));
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
  Future<List<Week>> queryWeeks(String profileId, WeekQueryOptions queryOptions) async {
    await Future.delayed(Duration(seconds: 1));
    Duration diff = queryOptions.to.difference(queryOptions.from);
    int weeksCount = (diff.inDays / 7).ceil();

    List<Week> weeks = [];
    for (var i = 0; i < weeksCount; ++i) {
      DateTime date = queryOptions.from.add(Duration(days: i * 7));
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
    MonthQueryOptions queryOptions
  ) async {
    await Future.delayed(Duration(seconds: 1));
    int monthsCount = DateUtils.monthDelta(queryOptions.from, queryOptions.to);
    List<Month> months = [];
    for (var i = 0; i < monthsCount; ++i) {
      DateTime date = queryOptions.from.copyWith(
        month: queryOptions.from.month + i,
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
  Future<List<Year>> queryYears(String profileId, YearQueryOptions queryOptions) async {
    await Future.delayed(Duration(seconds: 1));
    int yearsCount = queryOptions.to.year - queryOptions.from.year;
    List<Year> years = [];
    for (var i = 0; i <= yearsCount - 1; ++i) {
      DateTime date = queryOptions.from.copyWith(
        year: queryOptions.from.year + i,
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
  Future<List<Session>> querySessions(String profileId, SessionQueryOptions queryOptions) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(_fakeModelFactory.createSessions(queryOptions.limit));
  }

  @override
  Future<void> logSession(Profile profile, Session session) {
    return Future.value();
  }
}
