import 'package:dhyana/model/all.dart';
import 'package:dhyana/util/profile_stats_calculator.dart' as pf_stats_calc;
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('profile_stats_calculator.calculateConsecutiveDays', () {

    test('can calculate consecutive days when its the first day', () {
      ProfileStats stats = const ProfileStats(
        consecutiveDays: 0,
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
      );

      final currentSessionTime = DateTime(2023, 8, 31, 12, 0);

      ProfileStats newStats = pf_stats_calc.calculateConsecutiveDays(
        stats,
        currentSessionTime,
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

      final currentSessionTime = DateTime(2023, 9, 1, 12, 0);

      ProfileStats newStats = pf_stats_calc.calculateConsecutiveDays(
        stats,
        currentSessionTime
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

      final currentSessionTime = DateTime(2023, 9, 1, 12, 0);

      ProfileStats newStats = pf_stats_calc.calculateConsecutiveDays(
        stats,
        currentSessionTime
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

      final currentSessionTime = DateTime(2023, 9, 3, 12, 0);

      ProfileStats newStats = pf_stats_calc.calculateConsecutiveDays(
          stats,
          currentSessionTime
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

      final currentSessionTime = DateTime(2023, 8, 31, 12, 0);

      ProfileStats newStats = pf_stats_calc.calculateCompletedDay(
        stats,
        currentSessionTime,
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

      final currentSessionTime = DateTime(2023, 8, 31, 12, 0);

      ProfileStats newStats = pf_stats_calc.calculateCompletedDay(
        stats,
        currentSessionTime
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

      ProfileStats newStats = pf_stats_calc.calculateCompletedDay(
        stats,
        currentSessionTime
      );

      expect(newStats.consecutiveDays, 0);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 1);
    });

  });

}
