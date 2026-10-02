import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/domain/entity/consecutive_days_entity.dart';
import 'package:profile/src/domain/entity/milestone_progress_entity.dart';
import 'package:profile/src/domain/entity/profile_entity.dart';
import 'package:profile/src/domain/entity/profile_settings_entity.dart';
import 'package:profile/src/domain/entity/profile_stats_report_entity.dart';
import 'package:profile/src/domain/entity/stats_audit_entry_entity.dart';
import 'package:profile/src/domain/repository/stats_audit_repository.dart';
import 'package:profile/src/domain/service/profile_stats_updater_service.dart';
import 'package:profile/src/domain/service/stats_audit_service.dart';

class _FakeRepository implements StatsAuditRepository {
  final saved = <StatsAuditEntryEntity>[];
  bool fail = false;

  @override
  Future<void> saveAll(String profileId, List<StatsAuditEntryEntity> entries) async {
    if (fail) throw Exception('boom');
    saved.addAll(entries);
  }
}

ProfileEntity _profile({
  required ProfileStatsReportEntity stats,
  bool auditEnabled = true,
}) => Faker().createProfileEntity(
  statsReport: stats,
  settings: ProfileSettingsEntity(statsAuditEnabled: auditEnabled),
);

ProfileStatsReportEntity _stats({
  int streak = 5,
  int milestone = 5,
  DateTime? last,
  DateTime? checked,
}) => Faker().createProfileStatsReportEntity(
  consecutiveDays: streak,
  milestoneDays: milestone,
  lastSessionDate: last,
  lastChecked: checked,
);

void main() {
  late _FakeRepository repository;
  late ProfileStatsReportUpdaterService updater;
  late StatsAuditService service;

  setUp(() {
    repository = _FakeRepository();
    updater = ProfileStatsReportUpdaterService();
    service = StatsAuditService(repository: repository, statsUpdater: updater);
  });

  final last = DateTime(2026, 9, 30, 10, 10);

  test('records nothing when the streak is valid and nothing changes', () async {
    final now = DateTime(2026, 9, 30, 12);
    final before = _stats(last: last, checked: DateTime(2026, 9, 29));
    final after = updater.validateStatsReport(before, now: now);
    expect(service.buildEntries(
      trigger: StatsAuditTrigger.validation, before: before, after: after, now: now,
    ).map((e) => e.rule), isEmpty);
  });

  test('records a near miss on 1 Oct after a session on 30 Sep', () async {
    final now = DateTime(2026, 10, 1, 10, 10);
    final profile = _profile(stats: _stats(last: last, checked: DateTime(2026, 9, 30)));
    final validated = updater.validateStatsReport(profile.statsReport, now: now);
    await service.recordValidation(profile: profile, validated: validated, now: now);

    expect(repository.saved.map((e) => e.rule), [StatsAuditRule.nearMiss]);
    expect(repository.saved.single.consecutiveDaysAfter, 5);
    expect(repository.saved.single.id, '20261001_nearMiss');
    expect(repository.saved.single.expireAt, now.add(const Duration(days: 30)));
  });

  test('records streak and milestone reset after a missed day', () async {
    final now = DateTime(2026, 10, 2, 10, 10);
    final profile = _profile(stats: _stats(last: last, checked: DateTime(2026, 10, 1)));
    final validated = updater.validateStatsReport(profile.statsReport, now: now);
    await service.recordValidation(profile: profile, validated: validated, now: now);

    expect(repository.saved.map((e) => e.rule), [
      StatsAuditRule.consecutiveReset,
      StatsAuditRule.milestoneReset,
    ]);
  });

  test('records milestone completion on the session path', () async {
    final start = DateTime(2026, 10, 1, 10, 10);
    final original = _profile(stats: _stats(streak: 6, milestone: 6, last: last));
    final updated = original.copyWith(
      statsReport: original.statsReport.copyWith(
        consecutiveDays: const ConsecutiveDaysEntity(current: 7),
        milestoneProgress: const MilestoneProgressEntity(completedDaysCount: 7),
        milestoneCount: 1,
      ),
    );
    await service.recordSession(
      original: original, updated: updated, sessionStart: start, now: start,
    );
    expect(repository.saved.map((e) => e.rule), [StatsAuditRule.milestoneCompleted]);
  });

  test('records streak reset on the session path after a gap', () async {
    final start = DateTime(2026, 10, 3, 10, 10);
    final original = _profile(stats: _stats(last: last));
    final updated = original.copyWith(
      statsReport: original.statsReport.copyWith(
        consecutiveDays: const ConsecutiveDaysEntity(current: 1),
      ),
    );
    await service.recordSession(
      original: original, updated: updated, sessionStart: start, now: start,
    );
    expect(repository.saved.map((e) => e.rule), contains(StatsAuditRule.consecutiveReset));
  });

  test('writes nothing when the profile setting is disabled', () async {
    final now = DateTime(2026, 10, 2, 10, 10);
    final profile = _profile(
      stats: _stats(last: last, checked: DateTime(2026, 10, 1)),
      auditEnabled: false,
    );
    final validated = updater.validateStatsReport(profile.statsReport, now: now);
    await service.recordValidation(profile: profile, validated: validated, now: now);
    expect(repository.saved, isEmpty);
  });

  test('swallows repository failures', () async {
    repository.fail = true;
    final now = DateTime(2026, 10, 2, 10, 10);
    final profile = _profile(stats: _stats(last: last, checked: DateTime(2026, 10, 1)));
    final validated = updater.validateStatsReport(profile.statsReport, now: now);
    await expectLater(
      service.recordValidation(profile: profile, validated: validated, now: now),
      completes,
    );
  });
}
