import 'package:dhyana/model/all.dart';
import 'package:dhyana/util/profile_stats_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('ProfileStatsCalculator.hasValidConsecutiveDays', () {

    test('can tell if the consecutive days are valid when last session was before yesterday', () {
      ProfileStatsCalculator profileStatsCalculator = ProfileStatsCalculator();
      expect(profileStatsCalculator.isValidConsecutiveDays(
        DateTime(2023, 8, 30, 0, 0),
        DateTime(2023, 9, 1, 12, 0),
      ), false);
      expect(profileStatsCalculator.isValidConsecutiveDays(
        DateTime(2023, 12, 10, 0, 0),
        DateTime(2024, 1, 1, 0, 0),
      ), false);
    });

    test('can tell if the consecutive days are valid when last session was yesterday', () {
      ProfileStatsCalculator profileStatsCalculator = ProfileStatsCalculator();
      expect(profileStatsCalculator.isValidConsecutiveDays(
        DateTime(2023, 8, 31, 0, 0),
        DateTime(2023, 9, 1, 12, 0),
      ), true);
    });

    test('can tell if the consecutive days are valid when last session was today', () {
      ProfileStatsCalculator profileStatsCalculator = ProfileStatsCalculator();
      expect(profileStatsCalculator.isValidConsecutiveDays(
        DateTime(2023, 9, 1, 3, 0),
        DateTime(2023, 9, 1, 12, 0),
      ), true);
    });

  });

  group('ProfileStatsCalculator.calculateConsecutiveDays', () {

    test('can calculate consecutive days when its the first day', () {
      ProfileStats stats = const ProfileStats(
        consecutiveDays: 0,
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
      );

      ProfileStatsCalculator profileStatsCalculator = ProfileStatsCalculator();

      final currentSessionDate = DateTime(2023, 8, 31, 12, 0);

      ProfileStats newStats = profileStatsCalculator.calculateConsecutiveDays(
        stats,
        currentSessionDate: currentSessionDate
      );

      expect(newStats.consecutiveDays, 0);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

    test('can calculate consecutive days when last session was yesterday', () {
      ProfileStats stats = ProfileStats(
        consecutiveDays: 0,
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        lastSessionDate: DateTime(2023, 8, 31, 0, 0),
      );

      ProfileStatsCalculator profileStatsCalculator = ProfileStatsCalculator();
      final currentSessionDate = DateTime(2023, 9, 1, 12, 0);

      ProfileStats newStats = profileStatsCalculator.calculateConsecutiveDays(
        stats,
        currentSessionDate: currentSessionDate
      );

      expect(newStats.consecutiveDays, 1);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

    test('can calculate consecutive days when last session was on the same day', () {
      ProfileStats stats = ProfileStats(
        consecutiveDays: 1,
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        lastSessionDate: DateTime(2023, 9, 1),
      );

      ProfileStatsCalculator profileStatsCalculator = ProfileStatsCalculator();

      final currentSessionTime = DateTime(2023, 9, 1, 12, 0);

      ProfileStats newStats = profileStatsCalculator.calculateConsecutiveDays(
        stats,
        currentSessionDate: currentSessionTime
      );

      expect(newStats.consecutiveDays, 1);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

    test('can calculate consecutive days when last session was before yesterday', () {
      ProfileStats stats = ProfileStats(
        consecutiveDays: 3,
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        lastSessionDate: DateTime(2023, 9, 1),
      );

      ProfileStatsCalculator profileStatsCalculator = ProfileStatsCalculator();

      final currentSessionTime = DateTime(2023, 9, 3, 12, 0);

      ProfileStats newStats = profileStatsCalculator.calculateConsecutiveDays(
          stats,
          currentSessionDate: currentSessionTime
      );

      expect(newStats.consecutiveDays, 0);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

  });

  group('profile_stats_calculator.calculateCompletedDay', () {

    test('can calculate completed days when its the first day', () {
      ProfileStats stats = const ProfileStats(
        consecutiveDays: 0,
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
      );

      ProfileStatsCalculator profileStatsCalculator = ProfileStatsCalculator();

      final currentSessionTime = DateTime(2023, 8, 31, 12, 0);

      ProfileStats newStats = profileStatsCalculator.calculateCompletedDay(
        stats,
        currentSessionDate: currentSessionTime,
      );

      expect(newStats.consecutiveDays, 0);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 1);
    });

    test('can calculate completed days when the last session was on the same day', () {
      ProfileStats stats = ProfileStats(
        consecutiveDays: 0,
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 1,
        lastSessionDate: DateTime(2023, 8, 31, 0, 0),
      );

      ProfileStatsCalculator profileStatsCalculator = ProfileStatsCalculator();

      final currentSessionTime = DateTime(2023, 8, 31, 12, 0);

      ProfileStats newStats = profileStatsCalculator.calculateCompletedDay(
        stats,
        currentSessionDate: currentSessionTime
      );

      expect(newStats.consecutiveDays, 0);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 1);
    });

    test('can calculate completed days when last session was on an another day', () {
      ProfileStats stats = ProfileStats(
        consecutiveDays: 0,
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        lastSessionDate: DateTime(2022, 9, 1),
      );

      final currentSessionTime = DateTime(2023, 9, 1, 12, 0);

      ProfileStatsCalculator profileStatsCalculator = ProfileStatsCalculator();

      ProfileStats newStats = profileStatsCalculator.calculateCompletedDay(
        stats,
        currentSessionDate: currentSessionTime
      );

      expect(newStats.consecutiveDays, 0);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 1);
    });

  });

}
