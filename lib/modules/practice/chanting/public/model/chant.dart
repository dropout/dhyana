import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/core/data/converter/duration_converter.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_metadata_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'chant.freezed.dart';
part 'chant.g.dart';

/// A view model for a chant, which includes a unique identifier and the chant itself.
/// The unique identifier is used as a key for the chant in the selected chants list,
/// so that the Flutter reorderable list can identify chants even if there are
/// multiple ones added to the list.
// @freezed
// sealed class UiChant with _$UiChant {

//   const UiChant._();

//   const factory UiChant({

//     /// A unique identifier for this item. This is used as a key in the list
//     /// so that multiple instances of the same chant can be added to the list and reordered. 
//     required String uniqueId,
    
//     /// The identifier of the chant. This is used to look up the chant in the database.
//     required String chantId,

//     /// The name of the chant.
//     required String name,

//     /// The blur hash of the chant's cover image.
//     required String blurHash,

//     /// The order to display the chant in a list.
//     required int order,

//     /// The length of the chant.
//     required Duration duration,

//   }) = _UiChant;
  
// }

@freezed
sealed class Chant with _$Chant implements Dto {

  const Chant._();

  const factory Chant({
    required String id,
    required String name,
    required ChantMetaDataEntity metaData,
    required String blurHash,
    @Default(0) int order,
    @DurationConverter() required Duration length,    
  }) = _Chant;

  factory Chant.fromJson(Map<String, Object?> json) =>
    _$ChantFromJson(json);

}
