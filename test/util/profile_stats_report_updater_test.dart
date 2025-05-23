import 'package:dhyana/model/all.dart';
import 'package:dhyana/service/profile_stats_report_updater.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('ProfileStatisticsReportCalculator.hasValidConsecutiveDays', () {

    test('can tell if the consecutive days are valid when last session was before yesterday', () {
      ProfileStatsReportUpdater profileStatsCalculator = ProfileStatsReportUpdater();
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
      ProfileStatsReportUpdater profileStatsCalculator = ProfileStatsReportUpdater();
      expect(profileStatsCalculator.hasValidConsecutiveDays(
        DateTime(2023, 8, 31, 0, 0),
        DateTime(2023, 9, 1, 12, 0),
      ), true);
    });

    test('can tell if the consecutive days are valid when last session was today', () {
      ProfileStatsReportUpdater profileStatsCalculator = ProfileStatsReportUpdater();
      expect(profileStatsCalculator.hasValidConsecutiveDays(
        DateTime(2023, 9, 1, 3, 0),
        DateTime(2023, 9, 1, 12, 0),
      ), true);
    });

  });

  group('ProfileStatisticsReportCalculator.calculateConsecutiveDays', () {

    test('can calculate consecutive days when its the first day', () {
      ProfileStatisticsReport stats = const ProfileStatisticsReport(
        consecutiveDays: ConsecutiveDays(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
      );

      ProfileStatsReportUpdater profileStatsCalculator = ProfileStatsReportUpdater();

      final currentSessionDate = DateTime(2023, 8, 31, 12, 0);

      ProfileStatisticsReport newStats =
        profileStatsCalculator.updateConsecutiveDays(stats, currentSessionDate);

      expect(newStats.consecutiveDays.current, 1);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

    test('can calculate consecutive days when last session was yesterday', () {
      ProfileStatisticsReport stats = ProfileStatisticsReport(
        consecutiveDays: const ConsecutiveDays(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        lastSessionDate: DateTime(2023, 8, 31, 0, 0),
      );

      ProfileStatsReportUpdater profileStatsCalculator = ProfileStatsReportUpdater();
      final currentSessionDate = DateTime(2023, 9, 1, 12, 0);

      ProfileStatisticsReport newStats =
        profileStatsCalculator.updateConsecutiveDays(stats, currentSessionDate);

      expect(newStats.consecutiveDays.current, 1);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

    test('can calculate consecutive days when last session was on the same day', () {
      ProfileStatisticsReport stats = ProfileStatisticsReport(
        consecutiveDays: const ConsecutiveDays(current: 1),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        lastSessionDate: DateTime(2023, 9, 1),
      );

      ProfileStatsReportUpdater profileStatsCalculator = ProfileStatsReportUpdater();

      final currentSessionTime = DateTime(2023, 9, 1, 12, 0);

      ProfileStatisticsReport newStats =
        profileStatsCalculator.updateConsecutiveDays(stats, currentSessionTime);

      expect(newStats.consecutiveDays.current, 1);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

    test('can calculate consecutive days when last session was before yesterday', () {
      ProfileStatisticsReport stats = ProfileStatisticsReport(
        consecutiveDays: const ConsecutiveDays(current: 3),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        lastSessionDate: DateTime(2023, 9, 1),
      );

      ProfileStatsReportUpdater profileStatsCalculator = ProfileStatsReportUpdater();

      final currentSessionTime = DateTime(2023, 9, 3, 12, 0);

      ProfileStatisticsReport newStats =
        profileStatsCalculator.updateConsecutiveDays(stats, currentSessionTime);

      expect(newStats.consecutiveDays.current, 1);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

  });

  group('profile_stats_calculator.calculateCompletedDay', () {

    test('can calculate completed days when its the first day', () {
      ProfileStatisticsReport stats = const ProfileStatisticsReport(
        consecutiveDays: ConsecutiveDays(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
      );

      ProfileStatsReportUpdater profileStatsCalculator = ProfileStatsReportUpdater();

      final currentSessionTime = DateTime(2023, 8, 31, 12, 0);

      ProfileStatisticsReport newStats = profileStatsCalculator.updateCompletedDays(
        stats,
        currentSessionTime,
      );

      expect(newStats.consecutiveDays.current, 0);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 1);
    });

    test('can calculate completed days when the last session was on the same day', () {
      ProfileStatisticsReport stats = ProfileStatisticsReport(
        consecutiveDays: const ConsecutiveDays(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 1,
        lastSessionDate: DateTime(2023, 8, 31, 0, 0),
      );

      ProfileStatsReportUpdater profileStatsCalculator = ProfileStatsReportUpdater();

      final currentSessionTime = DateTime(2023, 8, 31, 12, 0);

      ProfileStatisticsReport newStats = profileStatsCalculator.updateCompletedDays(
        stats,
        currentSessionTime
      );

      expect(newStats.consecutiveDays.current, 0);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 1);
    });

    test('can calculate completed days when last session was on an another day', () {
      ProfileStatisticsReport stats = ProfileStatisticsReport(
        consecutiveDays: const ConsecutiveDays(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
        lastSessionDate: DateTime(2022, 9, 1),
      );

      final currentSessionTime = DateTime(2023, 9, 1, 12, 0);

      ProfileStatsReportUpdater profileStatsCalculator = ProfileStatsReportUpdater();

      ProfileStatisticsReport newStats = profileStatsCalculator.updateCompletedDays(
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
