import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'day.dart';

part 'milestone.freezed.dart';
part 'milestone.g.dart';

@freezed
class Milestone with _$Milestone {

  const Milestone._();

  const factory Milestone({
    required String id,
    @Default([]) List<Day> days,
  }) = _Milestone;

  factory Milestone.fromJson(Map<String, Object?> json) =>
      _$MilestoneFromJson(json);

}
