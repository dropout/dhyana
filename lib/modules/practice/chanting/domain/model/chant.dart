import 'package:dhyana/core/domain/model/model.dart';
import 'package:dhyana/core/domain/model/converter/duration_converter.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chant_asset_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'chant.freezed.dart';
part 'chant.g.dart';

/// A view model for a chant, which includes a unique identifier and the chant itself.
/// The unique identifier is used as a key for the chant in the selected chants list,
/// so that the Flutter reorderable list can identify chants even if there are
/// multiple ones added to the list.
@freezed
sealed class ChantViewModel with _$ChantViewModel {

  const ChantViewModel._();

  const factory ChantViewModel({
    required String uniqueId,
    required Chant chant,
    // required String imageUrl,
  }) = _ChantViewModel;

  factory ChantViewModel.fromJson(Map<String, Object?> json) =>
    _$ChantViewModelFromJson(json);
  
}

@freezed
sealed class Chant with _$Chant implements Model {

  const Chant._();

  const factory Chant({
    required String id,
    required String name,
    required ChantMetaData metaData,
    required String blurHash,
    @Default(0) int order,
    @DurationConverter() required Duration length,    
  }) = _Chant;

  factory Chant.fromJson(Map<String, Object?> json) =>
    _$ChantFromJson(json);

}
