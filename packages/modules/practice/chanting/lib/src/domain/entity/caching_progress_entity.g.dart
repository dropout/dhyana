// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caching_progress_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CachingProgressEntity _$CachingProgressEntityFromJson(
  Map<String, dynamic> json,
) => _CachingProgressEntity(
  totalTasks: (json['totalTasks'] as num?)?.toInt() ?? 0,
  completedTasks: (json['completedTasks'] as num?)?.toInt() ?? 0,
  progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
  results:
      (json['results'] as List<dynamic>?)
          ?.map(
            (e) => _$recordConvert(
              e,
              ($jsonValue) => (
                chant: ChantEntity.fromJson(
                  $jsonValue['chant'] as Map<String, dynamic>,
                ),
                localResources: ChantLocalResourcesEntity.fromJson(
                  $jsonValue['localResources'] as Map<String, dynamic>,
                ),
              ),
            ),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$CachingProgressEntityToJson(
  _CachingProgressEntity instance,
) => <String, dynamic>{
  'totalTasks': instance.totalTasks,
  'completedTasks': instance.completedTasks,
  'progress': instance.progress,
  'results': instance.results
      .map(
        (e) => <String, dynamic>{
          'chant': e.chant,
          'localResources': e.localResources,
        },
      )
      .toList(),
};

$Rec _$recordConvert<$Rec>(Object? value, $Rec Function(Map) convert) =>
    convert(value as Map<String, dynamic>);
