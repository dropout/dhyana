import 'package:core/core.dart';
import 'package:chanting/src/domain/entity/chant_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chant_local_resources_entity.freezed.dart';
part 'chant_local_resources_entity.g.dart';

@freezed
sealed class ChantLocalResourcesEntity with _$ChantLocalResourcesEntity implements SerializableEntity {
  const ChantLocalResourcesEntity._();

  const factory ChantLocalResourcesEntity({
    required ChantEntity chant,
    required String audioLocalPath,
    required String lyricsLocalPath,
    required int audioVersion,
    required int lyricsVersion,
    @Default(false) bool usedStaleCache,
  }) = _ChantLocalResourcesEntity;

  factory ChantLocalResourcesEntity.fromJson(Map<String, Object?> json) =>
      _$ChantLocalResourcesEntityFromJson(json);

  @override
  String get id => chant.id;
}
