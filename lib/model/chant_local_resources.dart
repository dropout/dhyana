import 'package:dhyana/model/chant.dart';
import 'package:dhyana/core/domain/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chant_local_resources.freezed.dart';
part 'chant_local_resources.g.dart';

@freezed
sealed class ChantLocalResources with _$ChantLocalResources implements Model {
  const ChantLocalResources._();

  const factory ChantLocalResources({
    required Chant chant,
    required String audioLocalPath,
    required String lyricsLocalPath,
    required int audioVersion,
    required int lyricsVersion,
    @Default(false) bool usedStaleCache,
  }) = _ChantLocalResources;

  factory ChantLocalResources.fromJson(Map<String, Object?> json) =>
      _$ChantLocalResourcesFromJson(json);

  @override
  String get id => chant.id;
}
