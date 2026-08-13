import 'package:dhyana/core/domain/enum/home_screen_view_state.dart';
import 'package:dhyana/core/data/converter/duration_converter.dart';
import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'insights_session_entity.freezed.dart';
part 'insights_session_entity.g.dart';

@freezed
sealed class StatsSessionEntity with _$StatsSessionEntity implements Dto {

  const StatsSessionEntity._();

  const factory StatsSessionEntity({
    required String id,
    required HomeScreenViewState type,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
  }) = _StatsSessionEntity;

  factory StatsSessionEntity.fromJson(Map<String, Object?> json) =>
    _$StatsSessionEntityFromJson(json);

}
