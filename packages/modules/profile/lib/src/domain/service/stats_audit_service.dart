import 'package:core/core.dart';
import 'package:profile/src/domain/entity/profile_entity.dart';
import 'package:profile/src/domain/entity/profile_stats_report_entity.dart';
import 'package:profile/src/domain/entity/stats_audit_entry_entity.dart';
import 'package:profile/src/domain/repository/stats_audit_repository.dart';
import 'package:profile/src/domain/service/profile_stats_updater_service.dart';

/// Records audit entries for streak and milestone decisions.
/// Only writes for profiles with `settings.statsAuditEnabled` set.
class StatsAuditService with LoggerMixin {

  static const Duration retention = Duration(days: 30);

  final StatsAuditRepository repository;
  final ProfileStatsReportUpdaterService statsUpdater;

  StatsAuditService({
    required this.repository,
    required this.statsUpdater,
  });

  /// Builds the entries describing the difference between two reports.
  List<StatsAuditEntryEntity> buildEntries({
    required StatsAuditTrigger trigger,
    required ProfileStatsReportEntity before,
    required ProfileStatsReportEntity after,
    required DateTime now,
    DateTime? sessionStart,
    bool? usedCache,
  }) {
    final lastSession = before.lastSessionDate;
    final reference = sessionStart ?? now;
    final rules = <StatsAuditRule>[];

    final streakBefore = before.consecutiveDays.current;
    final streakWasBroken = switch (trigger) {
      StatsAuditTrigger.validation =>
        streakBefore > 0 && after.consecutiveDays.current == 0,
      StatsAuditTrigger.session =>
        streakBefore > 0 && lastSession != null &&
          !statsUpdater.hasValidConsecutiveDays(lastSession, reference),
    };
    if (streakWasBroken) rules.add(StatsAuditRule.consecutiveReset);

    final milestoneBefore = before.milestoneProgress;
    final milestoneAfter = after.milestoneProgress;
    // A completed milestone restarting at 1 is not a reset.
    if (milestoneBefore.completedDaysCount > 0 &&
        milestoneAfter.completedDaysCount < milestoneBefore.completedDaysCount &&
        milestoneBefore.completedDaysCount != milestoneBefore.targetDaysCount) {
      rules.add(StatsAuditRule.milestoneReset);
    }

    if (after.milestoneCount > before.milestoneCount) {
      rules.add(StatsAuditRule.milestoneCompleted);
    }

    // The streak survives only because the last session was yesterday.
    final validationRan = after.consecutiveDays.lastChecked !=
      before.consecutiveDays.lastChecked;
    if (trigger == StatsAuditTrigger.validation &&
        validationRan &&
        !streakWasBroken &&
        streakBefore > 0 &&
        lastSession != null &&
        reference.isYesterday(lastSession)) {
      rules.add(StatsAuditRule.nearMiss);
    }

    return [
      for (final rule in rules)
        StatsAuditEntryEntity(
          rule: rule,
          trigger: trigger,
          at: now,
          lastSessionDate: lastSession,
          sessionStart: sessionStart,
          consecutiveDaysBefore: streakBefore,
          consecutiveDaysAfter: after.consecutiveDays.current,
          milestoneDaysBefore: milestoneBefore.completedDaysCount,
          milestoneDaysAfter: milestoneAfter.completedDaysCount,
          usedCache: usedCache,
          expireAt: now.add(retention),
        ),
    ];
  }

  Future<void> recordValidation({
    required ProfileEntity profile,
    required ProfileStatsReportEntity validated,
    DateTime? now,
  }) => _record(
    profile.id,
    profile.settings.statsAuditEnabled,
    () => buildEntries(
      trigger: StatsAuditTrigger.validation,
      before: profile.statsReport,
      after: validated,
      now: now ?? DateTime.now(),
    ),
  );

  Future<void> recordSession({
    required ProfileEntity original,
    required ProfileEntity updated,
    required DateTime sessionStart,
    bool? usedCache,
    DateTime? now,
  }) => _record(
    original.id,
    original.settings.statsAuditEnabled,
    () => buildEntries(
      trigger: StatsAuditTrigger.session,
      before: original.statsReport,
      after: updated.statsReport,
      now: now ?? DateTime.now(),
      sessionStart: sessionStart,
      usedCache: usedCache,
    ),
  );

  /// Never throws: auditing must not break profile loading or saving.
  Future<void> _record(
    String profileId,
    bool enabled,
    List<StatsAuditEntryEntity> Function() build,
  ) async {
    if (!enabled) return;
    try {
      final entries = build();
      if (entries.isEmpty) return;
      await repository.saveAll(profileId, entries);
    } catch (e, s) {
      logger.e('Failed to record stats audit', error: e, stackTrace: s);
    }
  }

}
