import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';

part 'chant.freezed.dart';
part 'chant.g.dart';

@freezed
sealed class Chant with _$Chant implements Model {

  const Chant._();

  const factory Chant({
    required String id,
    required String name,
    required String audioResourceUrl,
    required String lyricsResourceUrl,
  }) = _Chant;

  factory Chant.fromJson(Map<String, Object?> json) =>
    _$ChantFromJson(json);

}
