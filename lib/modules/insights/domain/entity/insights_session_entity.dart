import 'package:dhyana/core/domain/enum/home_screen_view_state.dart';
import 'package:dhyana/core/data/converter/duration_converter.dart';
import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'insights_session_entity.freezed.dart';
part 'insights_session_entity.g.dart';

@freezed
sealed class InsightsSessionEntity with _$InsightsSessionEntity implements Dto {

  const InsightsSessionEntity._();

  const factory InsightsSessionEntity({
    required String id,
    required HomeScreenViewState type,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
  }) = _InsightsSessionEntity;

  factory InsightsSessionEntity.fromJson(Map<String, Object?> json) =>
    _$InsightsSessionEntityFromJson(json);

}
