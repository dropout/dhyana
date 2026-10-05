import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_audit_entry_entity.freezed.dart';
part 'stats_audit_entry_entity.g.dart';

enum StatsAuditRule {
  consecutiveReset,
  milestoneReset,
  milestoneCompleted,
  nearMiss,
}

enum StatsAuditTrigger {
  session,
  validation,
}

/// Diagnostic record of a business decision that changed (or almost changed)
/// the consecutive days or milestone progress of a profile.
@freezed
sealed class StatsAuditEntryEntity with _$StatsAuditEntryEntity {

  const StatsAuditEntryEntity._();

  const factory StatsAuditEntryEntity({
    required StatsAuditRule rule,
    required StatsAuditTrigger trigger,
    @DateTimeConverter() required DateTime at,
    @DateTimeOrNullConverter() DateTime? lastSessionDate,
    @DateTimeOrNullConverter() DateTime? sessionStart,
    required int consecutiveDaysBefore,
    required int consecutiveDaysAfter,
    required int milestoneDaysBefore,
    required int milestoneDaysAfter,
    bool? usedCache,
    @DateTimeConverter() required DateTime expireAt,
  }) = _StatsAuditEntryEntity;

  factory StatsAuditEntryEntity.fromJson(Map<String, Object?> json) =>
    _$StatsAuditEntryEntityFromJson(json);

  /// One document per day and rule, so repeated triggers overwrite.
  String get id => '${at.toDayId()}_${rule.name}';

}
