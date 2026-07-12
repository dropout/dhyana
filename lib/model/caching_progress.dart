import 'package:dhyana/model/chant.dart';
import 'package:dhyana/model/chant_local_resources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'caching_progress.freezed.dart';
part 'caching_progress.g.dart';

@freezed
sealed class CachingProgress with _$CachingProgress {

  const CachingProgress._();

  const factory CachingProgress({
    @Default(0) int totalTasks,
    @Default(0) int completedTasks,
    @Default(0.0) double progress,
    @Default([]) List<({Chant chant, ChantLocalResources localResources})> results,
  }) = _CachingProgress;

  factory CachingProgress.fromJson(Map<String, Object?> json) =>
    _$CachingProgressFromJson(json);

}