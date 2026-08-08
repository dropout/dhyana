import 'package:dhyana/modules/practice/chanting/domain/entity/chant_entity.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_local_resources_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'caching_progress_entity.freezed.dart';
part 'caching_progress_entity.g.dart';

@freezed
sealed class CachingProgressEntity with _$CachingProgressEntity {

  const CachingProgressEntity._();

  const factory CachingProgressEntity({
    @Default(0) int totalTasks,
    @Default(0) int completedTasks,
    @Default(0.0) double progress,
    @Default([]) List<({ChantEntity chant, ChantLocalResourcesEntity localResources})> results,
  }) = _CachingProgressEntity;

  factory CachingProgressEntity.fromJson(Map<String, Object?> json) =>
    _$CachingProgressEntityFromJson(json);

}