import 'package:flutter_test/flutter_test.dart';

import 'package:profile/src/domain/entity/consecutive_days_entity.dart';
import 'package:profile/src/domain/entity/profile_stats_report_entity.dart';
import 'package:profile/src/domain/service/profile_stats_updater_service.dart';

void main() {

  group('ProfileStatisticsReportCalculator.hasValidConsecutiveDays', () {

    test('can tell if the consecutive days are valid when last session was before yesterday', () {
      ProfileStatsReportUpdaterService profileStatsCalculator = ProfileStatsReportUpdaterService();
      expect(profileStatsCalculator.hasValidConsecutiveDays(
        DateTime(2023, 8, 30, 0, 0),
        DateTime(2023, 9, 1, 12, 0),
      ), false);
      expect(profileStatsCalculator.hasValidConsecutiveDays(
        DateTime(2023, 12, 10, 0, 0),
        DateTime(2024, 1, 1, 0, 0),
      ), false);
    });

    test('can tell if the consecutive days are valid when last session was yesterday', () {
      ProfileStatsReportUpdaterService profileStatsCalculator = ProfileStatsReportUpdaterService();
      expect(profileStatsCalculator.hasValidConsecutiveDays(
        DateTime(2023, 8, 31, 0, 0),
        DateTime(2023, 9, 1, 12, 0),
      ), true);
    });

    test('can tell if the consecutive days are valid when last session was today', () {
      ProfileStatsReportUpdaterService profileStatsCalculator = ProfileStatsReportUpdaterService();
      expect(profileStatsCalculator.hasValidConsecutiveDays(
        DateTime(2023, 9, 1, 3, 0),
        DateTime(2023, 9, 1, 12, 0),
      ), true);
    });

  });

  group('ProfileStatisticsReportCalculator.calculateConsecutiveDays', () {

    test('can calculate consecutive days when its the first day', () {
      ProfileStatsReportEntity stats = const ProfileStatsReportEntity(
        consecutiveDays: ConsecutiveDaysEntity(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
      );

      ProfileStatsReportUpdaterService profileStatsCalculator = ProfileStatsReportUpdaterService();

      final currentSessionDate = DateTime(2023, 8, 31, 12, 0);

      ProfileStatsReportEntity newStats =
        profileStatsCalculator.updateConsecutiveDays(stats, currentSessionDate);

      expect(newStats.consecutiveDays.current, 1);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

    test('can calculate consecutive days when last session was yesterday', () {
      ProfileStatsReportEntity stats = ProfileStatsReportEntity(
        consecutiveDays: const ConsecutiveDaysEntity(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        lastSessionDate: DateTime(2023, 8, 31, 0, 0),
      );

      ProfileStatsReportUpdaterService profileStatsCalculator = ProfileStatsReportUpdaterService();
      final currentSessionDate = DateTime(2023, 9, 1, 12, 0);

      ProfileStatsReportEntity newStats =
        profileStatsCalculator.updateConsecutiveDays(stats, currentSessionDate);

      expect(newStats.consecutiveDays.current, 1);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

    test('can calculate consecutive days when last session was on the same day', () {
      ProfileStatsReportEntity stats = ProfileStatsReportEntity(
        consecutiveDays: const ConsecutiveDaysEntity(current: 1),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        lastSessionDate: DateTime(2023, 9, 1),
      );

      ProfileStatsReportUpdaterService profileStatsCalculator = ProfileStatsReportUpdaterService();

      final currentSessionTime = DateTime(2023, 9, 1, 12, 0);

      ProfileStatsReportEntity newStats =
        profileStatsCalculator.updateConsecutiveDays(stats, currentSessionTime);

      expect(newStats.consecutiveDays.current, 1);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

    test('can calculate consecutive days when last session was before yesterday', () {
      ProfileStatsReportEntity stats = ProfileStatsReportEntity(
        consecutiveDays: const ConsecutiveDaysEntity(current: 3),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        lastSessionDate: DateTime(2023, 9, 1),
      );

      ProfileStatsReportUpdaterService profileStatsCalculator = ProfileStatsReportUpdaterService();

      final currentSessionTime = DateTime(2023, 9, 3, 12, 0);

      ProfileStatsReportEntity newStats =
        profileStatsCalculator.updateConsecutiveDays(stats, currentSessionTime);

      expect(newStats.consecutiveDays.current, 1);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

  });

  group('profile_stats_calculator.calculateCompletedDay', () {

    test('can calculate completed days when its the first day', () {
      ProfileStatsReportEntity stats = const ProfileStatsReportEntity(
        consecutiveDays: ConsecutiveDaysEntity(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
      );

      ProfileStatsReportUpdaterService profileStatsCalculator = ProfileStatsReportUpdaterService();

      final currentSessionTime = DateTime(2023, 8, 31, 12, 0);

      ProfileStatsReportEntity newStats = profileStatsCalculator.updateCompletedDays(
        stats,
        currentSessionTime,
      );

      expect(newStats.consecutiveDays.current, 0);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 1);
    });

    test('can calculate completed days when the last session was on the same day', () {
      ProfileStatsReportEntity stats = ProfileStatsReportEntity(
        consecutiveDays: const ConsecutiveDaysEntity(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 1,
        lastSessionDate: DateTime(2023, 8, 31, 0, 0),
      );

      ProfileStatsReportUpdaterService profileStatsCalculator = ProfileStatsReportUpdaterService();

      final currentSessionTime = DateTime(2023, 8, 31, 12, 0);

      ProfileStatsReportEntity newStats = profileStatsCalculator.updateCompletedDays(
        stats,
        currentSessionTime
      );

      expect(newStats.consecutiveDays.current, 0);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 1);
    });

    test('can calculate completed days when last session was on an another day', () {
      ProfileStatsReportEntity stats = ProfileStatsReportEntity(
        consecutiveDays: const ConsecutiveDaysEntity(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        lastSessionDate: DateTime(2022, 9, 1),
      );

      final currentSessionTime = DateTime(2023, 9, 1, 12, 0);

      ProfileStatsReportUpdaterService profileStatsCalculator = ProfileStatsReportUpdaterService();

      ProfileStatsReportEntity newStats = profileStatsCalculator.updateCompletedDays(
        stats,
        currentSessionTime
      );

      expect(newStats.consecutiveDays.current, 0);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 1);
    });

  });

}
