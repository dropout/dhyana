import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/data/mapper/profile_mapper.dart';
import 'package:profile/src/data/mapper/profile_session_mapper.dart';

import 'package:profile/src/domain/entity/consecutive_days_entity.dart';
import 'package:profile/src/domain/entity/profile_stats_report_entity.dart';
import 'package:profile/src/domain/service/profile_stats_updater_service.dart';
import 'package:profile/src/public/model/consecutive_days.dart';
import 'package:profile/src/public/model/profile_session.dart';
import 'package:profile/src/public/model/profile_stats_report.dart';

void main() {
  group('hasValidConsecutiveDays', () {
    test('can tell if the consecutive days are valid when last session was before yesterday', () {
      ProfileStatsReportUpdaterService profileStatsCalculator =
          ProfileStatsReportUpdaterService();
      expect(
        profileStatsCalculator.hasValidConsecutiveDays(
          DateTime(2023, 8, 30, 0, 0),
          DateTime(2023, 9, 1, 12, 0),
        ),
        false,
      );
      expect(
        profileStatsCalculator.hasValidConsecutiveDays(
          DateTime(2023, 12, 10, 0, 0),
          DateTime(2024, 1, 1, 0, 0),
        ),
        false,
      );
    });

    test('can tell if the consecutive days are valid when last session was yesterday', () {
      ProfileStatsReportUpdaterService profileStatsCalculator =
          ProfileStatsReportUpdaterService();
      expect(
        profileStatsCalculator.hasValidConsecutiveDays(
          DateTime(2023, 8, 31, 0, 0),
          DateTime(2023, 9, 1, 12, 0),
        ),
        true,
      );
    });

    test(
      'can tell if the consecutive days are valid when last session was today',
      () {
        ProfileStatsReportUpdaterService profileStatsCalculator =
            ProfileStatsReportUpdaterService();
        expect(
          profileStatsCalculator.hasValidConsecutiveDays(
            DateTime(2023, 9, 1, 3, 0),
            DateTime(2023, 9, 1, 12, 0),
          ),
          true,
        );
      },
    );

    test('can tell if the consecutive days are valid when last session was in previous month', () {
      ProfileStatsReportUpdaterService profileStatsCalculator =
          ProfileStatsReportUpdaterService();
      expect(
        profileStatsCalculator.hasValidConsecutiveDays(
          DateTime(2026, 9, 30, 9, 14),
          DateTime(2026, 10, 1, 9, 15),
        ),
        true,
      );
    });
  });

  group('calculateConsecutiveDays', () {
    test('can calculate consecutive days when its the first day', () {
      ProfileStatsReportEntity stats = const ProfileStatsReportEntity(
        consecutiveDays: ConsecutiveDaysEntity(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
      );

      ProfileStatsReportUpdaterService profileStatsCalculator =
          ProfileStatsReportUpdaterService();

      final currentSessionDate = DateTime(2023, 8, 31, 12, 0);

      ProfileStatsReportEntity newStats = profileStatsCalculator
          .updateConsecutiveDays(stats, currentSessionDate);

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

      ProfileStatsReportUpdaterService profileStatsCalculator =
          ProfileStatsReportUpdaterService();
      final currentSessionDate = DateTime(2023, 9, 1, 12, 0);

      ProfileStatsReportEntity newStats = profileStatsCalculator
          .updateConsecutiveDays(stats, currentSessionDate);

      expect(newStats.consecutiveDays.current, 1);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 0);
    });

    test(
      'can calculate consecutive days when last session was on the same day',
      () {
        ProfileStatsReportEntity stats = ProfileStatsReportEntity(
          consecutiveDays: const ConsecutiveDaysEntity(current: 1),
          completedMinutesCount: 0,
          completedSessionsCount: 0,
          completedDaysCount: 0,
          lastSessionDate: DateTime(2023, 9, 1),
        );

        ProfileStatsReportUpdaterService profileStatsCalculator =
            ProfileStatsReportUpdaterService();

        final currentSessionTime = DateTime(2023, 9, 1, 12, 0);

        ProfileStatsReportEntity newStats = profileStatsCalculator
            .updateConsecutiveDays(stats, currentSessionTime);

        expect(newStats.consecutiveDays.current, 1);
        expect(newStats.completedMinutesCount, 0);
        expect(newStats.completedSessionsCount, 0);
        expect(newStats.completedDaysCount, 0);
      },
    );

    test(
      'can calculate consecutive days when last session was before yesterday',
      () {
        ProfileStatsReportEntity stats = ProfileStatsReportEntity(
          consecutiveDays: const ConsecutiveDaysEntity(current: 3),
          completedMinutesCount: 0,
          completedSessionsCount: 0,
          completedDaysCount: 0,
          lastSessionDate: DateTime(2023, 9, 1),
        );

        ProfileStatsReportUpdaterService profileStatsCalculator =
            ProfileStatsReportUpdaterService();

        final currentSessionTime = DateTime(2023, 9, 3, 12, 0);

        ProfileStatsReportEntity newStats = profileStatsCalculator
            .updateConsecutiveDays(stats, currentSessionTime);

        expect(newStats.consecutiveDays.current, 1);
        expect(newStats.completedMinutesCount, 0);
        expect(newStats.completedSessionsCount, 0);
        expect(newStats.completedDaysCount, 0);
      },
    );

    test(
      'can calcualte consecutive days when last session was in previous month',
      () {
        ProfileStatsReportUpdaterService profileStatsCalculator =
            ProfileStatsReportUpdaterService();
        expect(
          profileStatsCalculator.hasValidConsecutiveDays(
            DateTime(2026, 9, 30, 9, 14),
            DateTime(2026, 10, 1, 12, 0),
          ),
          true,
        );
      },
    );
  });

  group('calculateCompletedDay', () {
    test('can calculate completed days when its the first day', () {
      ProfileStatsReportEntity stats = const ProfileStatsReportEntity(
        consecutiveDays: ConsecutiveDaysEntity(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
      );

      ProfileStatsReportUpdaterService profileStatsCalculator =
          ProfileStatsReportUpdaterService();

      final currentSessionTime = DateTime(2023, 8, 31, 12, 0);

      ProfileStatsReportEntity newStats = profileStatsCalculator
          .updateCompletedDays(stats, currentSessionTime);

      expect(newStats.consecutiveDays.current, 0);
      expect(newStats.completedMinutesCount, 0);
      expect(newStats.completedSessionsCount, 0);
      expect(newStats.completedDaysCount, 1);
    });

    test(
      'can calculate completed days when the last session was on the same day',
      () {
        ProfileStatsReportEntity stats = ProfileStatsReportEntity(
          consecutiveDays: const ConsecutiveDaysEntity(),
          completedMinutesCount: 0,
          completedSessionsCount: 0,
          completedDaysCount: 1,
          lastSessionDate: DateTime(2023, 8, 31, 0, 0),
        );

        ProfileStatsReportUpdaterService profileStatsCalculator =
            ProfileStatsReportUpdaterService();

        final currentSessionTime = DateTime(2023, 8, 31, 12, 0);

        ProfileStatsReportEntity newStats = profileStatsCalculator
            .updateCompletedDays(stats, currentSessionTime);

        expect(newStats.consecutiveDays.current, 0);
        expect(newStats.completedMinutesCount, 0);
        expect(newStats.completedSessionsCount, 0);
        expect(newStats.completedDaysCount, 1);
      },
    );

    test(
      'can calculate completed days when last session was on an another day',
      () {
        ProfileStatsReportEntity stats = ProfileStatsReportEntity(
          consecutiveDays: const ConsecutiveDaysEntity(),
          completedMinutesCount: 0,
          completedSessionsCount: 0,
          completedDaysCount: 0,
          lastSessionDate: DateTime(2022, 9, 1),
        );

        final currentSessionTime = DateTime(2023, 9, 1, 12, 0);

        ProfileStatsReportUpdaterService profileStatsCalculator =
            ProfileStatsReportUpdaterService();

        ProfileStatsReportEntity newStats = profileStatsCalculator
            .updateCompletedDays(stats, currentSessionTime);

        expect(newStats.consecutiveDays.current, 0);
        expect(newStats.completedMinutesCount, 0);
        expect(newStats.completedSessionsCount, 0);
        expect(newStats.completedDaysCount, 1);
      },
    );
  });

  group('updateProfileStatsWithSession', () {
    test('can update profile stats with a new session', () {
      ProfileStatsReportUpdaterService profileStatsUpdater =
          ProfileStatsReportUpdaterService();

      ProfileStatsReport stats = ProfileStatsReport(
        consecutiveDays: const ConsecutiveDays(),
        completedMinutesCount: 0,
        completedSessionsCount: 0,
        completedDaysCount: 0,
      );

      var profile = Faker().createProfile();
      profile = profile.copyWith(statsReport: stats);

      ProfileSession session = ProfileSession(
        id: 'test_01',
        startTime: DateTime(2023, 8, 31, 12, 0),
        endTime: DateTime(2023, 8, 31, 12, 30),
        type: .chanting,
        duration: Duration(minutes: 14),
      );

      final updatedProfile = profileStatsUpdater.updateProfileStatsWithSession(
        profile.toDomain(),
        session.toDomain(),
      ).toApi();

      expect(updatedProfile.statsReport.consecutiveDays.current, 1);
      expect(updatedProfile.statsReport.completedMinutesCount, 14);
      expect(updatedProfile.statsReport.completedSessionsCount, 1);
      expect(updatedProfile.statsReport.completedDaysCount, 1);
    });



    
    test('keeps consecutive days and milestone progress across a month boundary', () {
      final updater = ProfileStatsReportUpdaterService();
      var profile = Faker().createProfile().copyWith(
        statsReport: const ProfileStatsReport(
          consecutiveDays: ConsecutiveDays(),
          completedMinutesCount: 0,
          completedSessionsCount: 0,
          completedDaysCount: 0,
        ),
      ).toDomain();

      final days = [
        DateTime(2026, 9, 26, 10, 10),
        DateTime(2026, 9, 27, 10, 10),
        DateTime(2026, 9, 28, 10, 10),
        DateTime(2026, 9, 29, 10, 10),
        DateTime(2026, 9, 30, 10, 10),
        DateTime(2026, 10, 1, 10, 10),
      ];

      for (var i = 0; i < days.length; i++) {
        final start = days[i];
        profile = updater.updateProfileStatsWithSession(
          profile,
          ProfileSession(
            id: 'session_$i',
            startTime: start,
            endTime: start.add(const Duration(minutes: 15)),
            type: .sitting,
            duration: const Duration(minutes: 15),
          ).toDomain(),
        );
        final stats = profile.statsReport;
        expect(stats.consecutiveDays.current, i + 1, reason: 'day ${start.toIso8601String()}');
        expect(stats.milestoneProgress.completedDaysCount, i + 1, reason: 'day ${start.toIso8601String()}');
        expect(stats.completedDaysCount, i + 1);
      }
    });

    test('validation on the 1st of October does not reset a 5 day streak', () {
      final updater = ProfileStatsReportUpdaterService();
      var profile = Faker().createProfile().copyWith(
        statsReport: const ProfileStatsReport(
          consecutiveDays: ConsecutiveDays(),
          completedMinutesCount: 0,
          completedSessionsCount: 0,
          completedDaysCount: 0,
        ),
      ).toDomain();

      for (var d = 26; d <= 30; d++) {
        final start = DateTime(2026, 9, d, 10, 10);
        profile = updater.updateProfileStatsWithSession(
          profile,
          ProfileSession(
            id: 'session_$d',
            startTime: start,
            endTime: start.add(const Duration(minutes: 15)),
            type: .sitting,
            duration: const Duration(minutes: 15),
          ).toDomain(),
        );
      }

      final validated = updater.validateStatsReport(
        profile.statsReport,
        now: DateTime(2026, 10, 1, 10, 10),
      );
      expect(validated.consecutiveDays.current, 5);
      expect(validated.milestoneProgress.completedDaysCount, 5);

      final start = DateTime(2026, 10, 1, 10, 10);
      final updated = updater.updateProfileStatsWithSession(
        profile.copyWith(statsReport: validated),
        ProfileSession(
          id: 'session_oct_1',
          startTime: start,
          endTime: start.add(const Duration(minutes: 15)),
          type: .sitting,
          duration: const Duration(minutes: 15),
        ).toDomain(),
      );
      expect(updated.statsReport.consecutiveDays.current, 6);
      expect(updated.statsReport.milestoneProgress.completedDaysCount, 6);
    });
  });
}
